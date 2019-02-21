//
//  JHSingleBrowserView.m
//  Bbalt
//
//  Created by bory on 2019/2/15.
//  Copyright © 2019年 hans. All rights reserved.
//

#import "JHSingleBrowserView.h"

@implementation JHSingleBrowserView
-(instancetype)init{
    self = [super init];
    if (self) {
        self.scrollView = JH_ZoomScrollView(.2f, 5.f);
        self.scrollView.delegate = self;
        self.scrollView.contentSize = (CGSize){kSCREEN_W,kSCREEN_H};
        [self addSubview:self.scrollView];
        self.imageView = [JHImageView new];
        self.imageView.userInteractionEnabled = NO;
        [self.scrollView addSubview:self.imageView];
        NSArray *arr1 = JH_EqualSizeLayouts(self.scrollView, self);
        JH_AddLayouts(self, arr1);
    }
    return self;
}
-(instancetype)initWithMin:(CGFloat)min
                       Max:(CGFloat)max{
    self = [super init];
    if (self) {
        self.scrollView = JH_ZoomScrollView(min, max);
        self.scrollView.delegate = self;
        self.scrollView.contentSize = (CGSize){kSCREEN_W,kSCREEN_H};
        [self addSubview:self.scrollView];
        self.imageView = [JHImageView new];
        self.imageView.userInteractionEnabled = NO;
        [self.scrollView addSubview:self.imageView];
        NSArray *arr1 = JH_EqualSizeLayouts(self.scrollView, self);
        JH_AddLayouts(self, arr1);
        [self addGestureRecognizer];
    }
    return self;
}
-(void)addGestureRecognizer{
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] init];
    tap1.numberOfTapsRequired = 1;
    [self.scrollView addGestureRecognizer:tap1];
    UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc] init];
    tap2.numberOfTapsRequired = 2;
    [self.scrollView addGestureRecognizer:tap2];
    [tap1 requireGestureRecognizerToFail:tap2];
    @WeakObj(self);
    [[tap1 rac_gestureSignal]subscribeNext:^(__kindof UIGestureRecognizer * _Nullable x) {
        @StrongObj(self);
        if (self.singleTapBlock) {
            self.singleTapBlock(x);
        }
    }];
    [[tap2 rac_gestureSignal]subscribeNext:^(__kindof UIGestureRecognizer * _Nullable x) {
        @StrongObj(self);
        if (self.doubleTapBlock) {
            self.doubleTapBlock(x);
        }
    }];
}
-(UIView*)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return self.imageView;
}
- (void)scrollViewDidZoom:(UIScrollView *)scrollView{
    [self beCenter];
}
-(void)beCenter{
    UIView *subView = self.imageView;
    
    CGFloat offsetX = (self.scrollView.bounds.size.width > self.scrollView.contentSize.width)?
    (self.scrollView.bounds.size.width - self.scrollView.contentSize.width) * 0.5 : 0.0;
    
    CGFloat offsetY = (self.scrollView.bounds.size.height > self.scrollView.contentSize.height)?
    (self.scrollView.bounds.size.height - self.scrollView.contentSize.height) * 0.5 : 0.0;
    
    subView.center = CGPointMake(self.scrollView.contentSize.width * 0.5 + offsetX,
                                 self.scrollView.contentSize.height * 0.5 + offsetY);
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
