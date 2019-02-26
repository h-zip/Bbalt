//
//  JHScrollTabsView.m
//  Bbalt
//
//  Created by bory on 2019/2/26.
//  Copyright © 2019年 hans. All rights reserved.
//

#import "JHScrollTabsView.h"

@implementation JHScrollTabsView
-(instancetype)initWithTitles:(NSArray*)titles
                       Margin:(CGFloat)margin
                      Spacing:(CGFloat)spacing
                    LineColor:(UIColor*)lineColor
                   LineHeight:(CGFloat)lineHeight
                 SelectedAttr:(NSDictionary*)selectedAttr
               UnSelectedAttr:(NSDictionary*)unSelectedAttr{
    self = [super init];
    if (self) {
        self.titles = titles;
        self.margin = margin;
        self.spacing = spacing;
        self.lineColor = lineColor;
        self.lineHeight = lineHeight;
        self.selectedAttr = selectedAttr;
        self.unSelectedAttr = unSelectedAttr;
        self.widthArr = [@[]mutableCopy];
        self.tabs = [@[]mutableCopy];
        self.line = [UIView new];
        self.line.backgroundColor = self.lineColor;
        self.containerScrollView = [JHFactoryInstance baseScrollView];
        self.containerScrollView.pagingEnabled = NO;
        self.containerScrollView.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:self.containerScrollView];
        NSArray *arr1 = JH_EqualSizeLayouts(self.containerScrollView, self);
        JH_AddLayouts(self, arr1);
        CGFloat contentWidth = margin * 2;
        NSMutableArray *arr2 = [@[]mutableCopy];
        UIView *last = nil;
        for (int i = 0; i < self.titles.count; i++) {
            NSDictionary *attr = i==0 ? self.selectedAttr : self.unSelectedAttr;
            JHButton *btn = [JHButton buttonWithType:UIButtonTypeCustom];
            btn.translatesAutoresizingMaskIntoConstraints = NO;
            if(i==0) {btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;btn.titleEdgeInsets = (UIEdgeInsets){0,margin,0,0};}
            if(i==titles.count-1) {btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;btn.titleEdgeInsets = (UIEdgeInsets){0,0,0,margin};}
            @WeakObj(self);
            [[btn rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(__kindof UIControl * _Nullable x) {
                @StrongObj(self);
                if (self.tabTapBlock) self.tabTapBlock(x, i);
                if (self.index != i) {
                    [self layoutIfNeeded];
                    [JHAnimateManager defaultAnimate_1_WithAnimations:^{
                        [self changeToIndex:i];
                        [self layoutIfNeeded];
                        [self fixScrollPositionToIndex:i];
                    } Completion:^(BOOL finished) {
                        [self changeTitleColorToIndex:i];
                    }];
                }
            }];
            NSMutableAttributedString *str = MutableStringAttr(self.titles[i], attr);
            [btn setAttributedTitle:str forState:UIControlStateNormal];
            CGSize size = [btn.titleLabel sizeThatFits:CGSizeZero];
            [self.widthArr addObject:@(size.width)];
            [self.tabs addObject:btn];
            [self.containerScrollView addSubview:btn];
            contentWidth = contentWidth + size.width;
            NSLayoutConstraint *t = JH_Layout(btn, JH_Top, self.containerScrollView, JH_Top, 0);
            NSLayoutConstraint *b = JH_Layout(btn, JH_Bottom, self.containerScrollView, JH_Bottom, self.lineHeight);
            CGFloat _w = (i==0 || i==titles.count-1) ? (self.spacing + self.margin  + size.width) : (2 * self.spacing  + size.width);
            NSLayoutConstraint *w = JH_Layout(btn, JH_Width, nil, JH_NotAnAttribute, _w);
            NSLayoutConstraint *l = (i == 0) ? JH_Layout(btn, JH_Leading, self.containerScrollView, JH_Leading, 0) : JH_Layout(btn, JH_Leading, last, JH_Trailing, 0);
            if (i == self.titles.count-1) {
                NSLayoutConstraint *r = JH_Layout(btn, JH_Trailing, self.containerScrollView, JH_Trailing, 0);
                [arr2 addObject:r];
            }
            [arr2 addObjectsFromArray:@[t,b,w,l]];
            last = btn;
        }
        JH_AddLayouts(self.containerScrollView, arr2);
        contentWidth = contentWidth + self.spacing * (self.titles.count - 1);
//        self.containerScrollView.contentSize = (CGSize){contentWidth,30};
        self.line.translatesAutoresizingMaskIntoConstraints = NO;
        [self.containerScrollView addSubview:self.line];
        NSLayoutConstraint *b = JH_Layout( self.line, JH_Bottom, self.containerScrollView, JH_Bottom, 0);
        NSLayoutConstraint *h = JH_Layout( self.line, JH_Height, nil, JH_NotAnAttribute, lineHeight);
        NSLayoutConstraint *w = JH_Layout( self.line, JH_Width, nil, JH_NotAnAttribute, [self.widthArr[0] floatValue]);
        CGFloat _l = [self calLeftLayout:0];
        NSLayoutConstraint *l = JH_Layout( self.line, JH_Leading, self.containerScrollView, JH_Leading, _l);
        NSArray *arr3 = @[b,h,w,l];
        JH_AddLayouts(self, arr3);
        self.lineLeft = l;
        self.lineWidth = w;
    }
    return self;
}
-(CGFloat)calLeftLayout:(NSInteger)index{
    CGFloat left = 0;
    if (index == 0) {
        left = self.margin;
    }else if (index == self.titles.count - 1) {
        left = self.containerScrollView.contentSize.width - self.margin - [self.widthArr[self.titles.count -1]floatValue];
    }else {
        for (int i = 0; i< index+1; i++) {
            CGFloat _l = (i == 0) ? self.margin : 2 * self.spacing + [self.widthArr[i-1]floatValue];
            left = left + _l;
        }
    }
    return left;
}
-(void)changeToIndex:(NSInteger)index{
    self.lineLeft.constant = [self calLeftLayout:index];
    self.lineWidth.constant = [self.widthArr[index]floatValue];
}
-(void)changeTitleColorToIndex:(NSInteger)index{
    JHButton *old = self.tabs[self.index];
    JHButton *new = self.tabs[index];
    NSMutableAttributedString *str_old = MutableStringAttr(self.titles[self.index], self.unSelectedAttr);
    [old setAttributedTitle:str_old forState:UIControlStateNormal];
    NSMutableAttributedString *str_new = MutableStringAttr(self.titles[index], self.selectedAttr);
    [new setAttributedTitle:str_new forState:UIControlStateNormal];
    self.index = index;
}
-(void)scrollChangeToIndex:(NSInteger)index{
    [self changeToIndex:index];
    [self fixScrollPositionToIndex:index];
    [self changeTitleColorToIndex:index];
}
-(void)fixScrollPositionToIndex:(NSInteger)index{
    CGFloat x = [self.containerScrollView convertPoint:self.tabs[index].frame.origin toView:self.superview].x;
    CGFloat left = [self calLeftLayout:index];
    CGFloat m = index == 0 ? self.margin : self.spacing;
    if(x<0){
        [self.containerScrollView setContentOffset:(CGPoint){left-m,0} animated:YES];
    }else if (x+[self.widthArr[index]floatValue] > self.width){
        [self.containerScrollView setContentOffset:(CGPoint){left + [self.widthArr[index]floatValue] - self.width + m,0} animated:YES];
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
