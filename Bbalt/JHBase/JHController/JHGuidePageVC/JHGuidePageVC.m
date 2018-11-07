//
//  JHGuidePageVC.m
//  Test
//
//  Created by bory on 2018/5/9.
//  Copyright © 2018年 hans. All rights reserved.
//

#import "JHGuidePageVC.h"

@interface JHGuidePageVC ()

@end

@implementation JHGuidePageVC
-(NSArray*)guidePages{
    if (!_guidePages) {
        _guidePages = @[@"",@"",@""];
    }
    return _guidePages;
}
-(UIPageControl*)pageCotrol{
    if (!_pageCotrol) {
        _pageCotrol = [[UIPageControl alloc]initWithFrame:(CGRect){(kSCREEN_W-60)/2,kSCREEN_H-25-5,60,25}];
        //_pageCotrol.center = (CGPoint){self.center.x,frame.size.height-15};
        _pageCotrol.numberOfPages = self.guidePages.count;
        _pageCotrol.hidesForSinglePage = YES;
        _pageCotrol.currentPageIndicatorTintColor = [UIColor whiteColor];
        _pageCotrol.pageIndicatorTintColor = [UIColor blackColor];
        //[self addSubview:self.pageControl];
    }
    return _pageCotrol;
}
-(UIScrollView*)scrollView{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc]initWithFrame:(CGRect){0,0,kSCREEN_W,kSCREEN_H}];
        _scrollView.delegate = self;
        _scrollView.contentSize = (CGSize){(self.guidePages.count+1) * _scrollView.frame.size.width,_scrollView.frame.size.height};
        _scrollView.bounces = NO;
        _scrollView.pagingEnabled = YES;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
        for (int i = 0; i<self.guidePages.count; i++) {
            UIView* view = [[UIView alloc]initWithFrame:(CGRect){i*_scrollView.frame.size.width,0,_scrollView.frame.size.width,_scrollView.frame.size.height}];
            UIImageView *imageView = [[UIImageView alloc]initWithFrame:(CGRect){0,0,view.frame.size.width,view.frame.size.height}];
            imageView.image = [UIImage imageNamed:self.guidePages[i]];
            [view addSubview:imageView];
            [_scrollView addSubview:view];
        }
        JHLoginVC *vc = [JHLoginVC initFromXIB];
        [self addChildViewController:vc];
        vc.view.frame = (CGRect){self.guidePages.count*_scrollView.frame.size.width,0,_scrollView.frame.size.width,_scrollView.frame.size.height};
        [_scrollView addSubview:vc.view];
        
    }
    return _scrollView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.scrollView];
    [self.view addSubview:self.pageCotrol];
    // Do any additional setup after loading the view from its nib.
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    if (scrollView.contentOffset.x/scrollView.frame.size.width == self.guidePages.count) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"first_enter"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        AppDelegateInstance.window.rootViewController = [JHLoginVC initFromXIB];
    }else{
        self.pageCotrol.currentPage = scrollView.contentOffset.x/scrollView.frame.size.width;
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
