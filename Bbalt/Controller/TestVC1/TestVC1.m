//
//  TestVC1.m
//  Bbalt
//
//  Created by bory on 2019/1/14.
//  Copyright © 2019年 hans. All rights reserved.
//

#import "TestVC1.h"
#import <WebKit/WKWebView.h>
#import "BaseService.h"
@interface TestVC1 ()
@property (nonatomic,strong)WKWebView *webView;
@end

@implementation TestVC1

#pragma mark - ------------------Setter Getter Methods------------------

#pragma mark - ------------------LifeCycle------------------
-(void)viewDidLoad {
    [super viewDidLoad];
//    [BaseService loginWithDic:@{} Ret:^(BOOL success, id response) {
//        JHBaseResultModel* m = [JHBaseResultModel modelWithJSON:response];
//        NSError *error = m.R;
//        NSHTTPURLResponse * r = [m.R userInfo][@"com.alamofire.serialization.response.error.response"];
//        NSLog(@"%ld-%@",(long)r.statusCode,[NSHTTPURLResponse localizedStringForStatusCode:r.statusCode]);
//    }];
//    UILabel *l = [[UILabel alloc]init];
//    UIButton *b = [[UIButton alloc]init];
//    self.webView = [[WKWebView alloc]initWithFrame:(CGRect){0,kTopHeight,kSCREEN_W,kSCREEN_H}];
//    UIScrollView *scrollView = self.webView.subviews[0];
//    @WeakObj(scrollView);
//    MJRefreshNormalHeader *mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
//        NSLog(@"1111");
//        @StrongObj(scrollView);
//        if (@available(iOS 10.0, *)) {
////            NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:2 repeats:NO block:^(NSTimer * _Nonnull timer) {
////                [scrollView.mj_header endRefreshing];
////            }];
//        } else {
//            // Fallback on earlier versions
//        }
//    }];
//    scrollView.mj_header = mj_header;
//    [self.view addSubview:self.webView];
//    NSURL *url = [NSURL URLWithString:@"http://192.168.0.122:8080"];
//    NSURLRequest * request = [NSURLRequest requestWithURL:url];
//    [self.webView loadRequest:request];
}
-(void)dealloc{
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}
-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}
-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
}
-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
}

#pragma mark - ------------------Public Methods------------------

#pragma mark - ------------------Private Methods------------------

#pragma mark - ------------------Key-Value Observer------------------

#pragma mark - ------------------UITableViewDelegate,UITableViewDataSource------------------

#pragma mark - ------------------UICollectionViewDelegate,UICollectionViewDataSource------------------

#pragma mark - ------------------UIScrollViewDelegate------------------

@end
