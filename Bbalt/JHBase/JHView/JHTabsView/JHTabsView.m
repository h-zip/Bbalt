//
//  JHTabsView.m
//  Bbalt
//
//  Created by bory on 2019/2/25.
//  Copyright © 2019年 hans. All rights reserved.
//

#import "JHTabsView.h"

@implementation JHTabsView
-(instancetype)initWithTitles:(NSArray*)titles
                       Margin:(CGFloat)margin
                    LineColor:(UIColor*)lineColor
                   LineHeight:(CGFloat)lineHeight
                 SelectedAttr:(NSDictionary*)selectedAttr
               UnSelectedAttr:(NSDictionary*)unSelectedAttr{
    self = [super init];
    if (self) {
        self.titles = titles;
        self.margin = margin;
        self.lineColor = lineColor;
        self.lineHeight = lineHeight;
        self.selectedAttr = selectedAttr;
        self.unSelectedAttr = unSelectedAttr;
        self.widthArr = [@[]mutableCopy];
        self.tabs = [@[]mutableCopy];
        self.line = [UIView new];
        self.line.backgroundColor = self.lineColor;
        CGFloat space = kSCREEN_W - 2 * margin;
        for (int i = 0; i < titles.count; i++) {
            NSDictionary *attr = i==0 ? self.selectedAttr : self.unSelectedAttr;
            JHButton *btn = [JHButton buttonWithType:UIButtonTypeCustom];
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
            space = space - size.width;
        }
        space = space / (titles.count -1) / 2;
        self.spacing = space;
        UIView *last = nil;
        NSMutableArray * arr = [@[]mutableCopy];
        for (int i = 0; i < titles.count; i++) {
            CGFloat w = (i==0 || i==titles.count-1) ? (space + margin  + [self.widthArr[i]floatValue]) : (2 * space  + [self.widthArr[i]floatValue]);
            JHButton *v = self.tabs[i];
            v.translatesAutoresizingMaskIntoConstraints = NO;
            [self addSubview:v];
            NSLayoutConstraint *top = JH_Layout(v, JH_Top, self, JH_Top, 0);
            NSLayoutConstraint *left = i == 0 ? JH_Layout(v, JH_Leading, self, JH_Leading, 0) : JH_Layout(v, JH_Leading, last, JH_Trailing, 0);
            NSLayoutConstraint *bottom = JH_Layout(v, JH_Bottom, self, JH_Bottom, lineHeight);
            NSLayoutConstraint *width = JH_Layout(v, JH_Width, nil, JH_NotAnAttribute, w);
            [arr addObjectsFromArray:@[top,left,bottom,width]];
            if (i == titles.count-1) {
                NSLayoutConstraint *right = JH_Layout(v, JH_Trailing, self, JH_Trailing, 0);
                [arr addObject:right];
            }
            last = v;
        }
        JH_AddLayouts(self, arr);
        self.line.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:self.line];
        NSLayoutConstraint *b = JH_Layout( self.line, JH_Bottom, self, JH_Bottom, 0);
        NSLayoutConstraint *h = JH_Layout( self.line, JH_Height, nil, JH_NotAnAttribute, lineHeight);
        NSLayoutConstraint *w = JH_Layout( self.line, JH_Width, nil, JH_NotAnAttribute, [self.widthArr[0] floatValue]);
        CGFloat _l = [self calLeftLayout:0];
        NSLayoutConstraint *l = JH_Layout( self.line, JH_Leading, self, JH_Leading, _l);
        NSArray *arr1 = @[b,h,w,l];
        JH_AddLayouts(self, arr1);
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
        left = kSCREEN_W - self.margin - [self.widthArr[self.titles.count -1]floatValue];
    }else {
        for (int i = 0; i< index+1; i++) {
            CGFloat _l = (i == 0) ? self.margin : 2 * self.spacing + [self.widthArr[i]floatValue];
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
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
