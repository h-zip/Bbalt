//
//  JHBrowserManager.m
//  Bbalt
//
//  Created by bory on 2019/2/15.
//  Copyright © 2019年 hans. All rights reserved.
//

#import "JHBrowserManager.h"

@implementation JHBrowserManager
+(instancetype)share{
    static JHBrowserManager *_JHBrowserManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _JHBrowserManager = [[self alloc]init];
    });
    return _JHBrowserManager;
}
-(NSMutableArray<JHSingleBrowserView*>*)singleBrowserArr{
    if (!_singleBrowserArr) {
        _singleBrowserArr = [@[]mutableCopy];
    }
    return _singleBrowserArr;
}
-(NSArray*)srcArr{
    if (!_srcArr) {
        _srcArr = @[];
    }
    return _srcArr;
}
-(instancetype)init{
    if (self = [super init]) {
        self.containerView = [self defaultContainerView];
        self.containerScrollView = [JHFactoryInstance baseScrollView];
        self.containerScrollView.delegate = self;
        self.progressLayer = [self defaultProgressLayer];
        self.progressView = [self defaultProgressView];
        
        [self.progressView.layer addSublayer:self.progressLayer];
        
        [self.containerView addSubview:self.containerScrollView];
        NSArray* arr1 = JH_EqualSizeLayouts(self.containerScrollView, self.containerView);
        JH_AddLayouts(self.containerView, arr1);
        
        [self.containerView addSubview:self.progressView];
        NSArray *arr2 = JH_CenterLayouts(self.progressView, self.containerView, CGSizeMake(40, 40));
        JH_AddLayouts(self.containerView, arr2);
    }
    return self;
}

-(UIView*)defaultContainerView{
    UIView *v = [UIView new];
    return v;
}
-(UIView*)defaultProgressView{
    UIView *v = [UIView new];
    v.hidden = YES;
    return v;
}
-(CAShapeLayer*)defaultProgressLayer{
    CAShapeLayer *progressLayer = [CAShapeLayer layer];
    progressLayer.frame = CGRectMake(0, 0, 40, 40);
    progressLayer.cornerRadius = 20;
    progressLayer.backgroundColor = [UIColor colorWithWhite:0.000 alpha:0.5].CGColor;
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectInset(progressLayer.bounds, 7, 7) cornerRadius:(40 / 2 - 7)];
    progressLayer.path = path.CGPath;
    progressLayer.fillColor = [UIColor clearColor].CGColor;
    progressLayer.strokeColor = [UIColor whiteColor].CGColor;
    progressLayer.lineWidth = 4;
    progressLayer.lineCap = kCALineCapRound;
    progressLayer.strokeStart = 0;
    progressLayer.strokeEnd = 0;
    return progressLayer;
}
-(void)showWithPicSrcs:(NSArray*)srcs
                InView:(UIView*)view{
    [self dismiss];
    self.srcArr = srcs;
    self.singleBrowserArr = [@[]mutableCopy];
    for (int i = 0; i<srcs.count; i++) {
        JHSingleBrowserView *v = [[JHSingleBrowserView alloc]initWithMin:JHZoom_Min Max:JHZoom_Max];
        [self.singleBrowserArr addObject:v];
        [self.containerScrollView addSubview:v];
        @WeakObj(self);
        @WeakObj(v);
        v.singleTapBlock = ^(UIGestureRecognizer *gr) {
            @StrongObj(self);
            [self dismiss];
        };
        v.doubleTapBlock = ^(UIGestureRecognizer *gr) {
            @StrongObj(v);
            CGFloat current = v.scrollView.zoomScale;
            CGFloat d = (v.scrollView.maximumZoomScale - v.scrollView.minimumZoomScale);
            CGFloat t = current >= d/2 ? (current - d/2) : (current + d/2);
            [v.scrollView setZoomScale:t animated:YES];
            
        };
    }
    NSArray *arr1 = JH_EqualRowLayouts(self.singleBrowserArr, self.containerScrollView);
    JH_AddLayouts(self.containerScrollView, arr1);
    [view addSubview:self.containerView];
    NSArray* arr2 = JH_EqualSizeLayouts(self.containerView, view);
    JH_AddLayouts(view, arr2);
    [self showWithIndex:0];
}
-(void)dismiss{
    [self.containerView removeFromSuperview];
    self.srcArr = @[];
    for (UIView *v in self.singleBrowserArr) {
        [v removeFromSuperview];
    }
}
-(void)showWithIndex:(NSInteger)index{
    self.progressView.hidden = NO;
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    self.progressLayer.strokeEnd = 0.01;
    [CATransaction commit];
    [JHWebImageInstance loadImageWithURL:self.srcArr[index] progress:^(NSInteger receivedSize, NSInteger expectedSize, NSURL * _Nullable targetURL) {
        CGFloat progress = receivedSize / (float)expectedSize;
        progress = progress < 0.01 ? 0.01 : progress > 1 ? 1 : progress;
        if (isnan(progress)) progress = 0;
        self.progressLayer.strokeEnd = progress;
    } completed:^(UIImage * _Nullable image, NSData * _Nullable data, NSError * _Nullable error, SDImageCacheType cacheType, BOOL finished, NSURL * _Nullable imageURL) {
        self.progressView.hidden = YES;
        self.singleBrowserArr[index].imageView.image = image;
        CGFloat tw = image.size.width;
        CGFloat th = image.size.height;
        if (image.size.width >= image.size.height && image.size.width >= self.containerScrollView.frame.size.width) {
            CGFloat aspratio = image.size.width/self.containerScrollView.frame.size.width;
            th = image.size.height/aspratio;
            tw = self.containerScrollView.frame.size.width;
        }else if(image.size.width < image.size.height && image.size.height >= self.containerScrollView.frame.size.height){
            CGFloat aspratio = image.size.height/self.containerScrollView.frame.size.height;
            tw = image.size.width/aspratio;
            th = self.containerScrollView.frame.size.height;
        }
        self.singleBrowserArr[index].imageView.bounds = (CGRect){0,0,tw,th};
        [self.singleBrowserArr[index] beCenter];
    }];
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSInteger index = (NSInteger)(scrollView.contentOffset.x/scrollView.frame.size.width);
    if (!self.singleBrowserArr[index].imageView.image) {
        [self showWithIndex:index];
    }
}
@end
