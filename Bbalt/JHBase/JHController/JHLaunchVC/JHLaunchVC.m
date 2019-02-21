//
//  JHLaunchVC.m
//  Test
//
//  Created by bory on 2018/5/9.
//  Copyright © 2018年 hans. All rights reserved.
//

#import "JHLaunchVC.h"

@interface JHLaunchVC ()

@end

@implementation JHLaunchVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self route];
    // Do any additional setup after loading the view from its nib.
}
-(void)route{
    if ([[JHUserManager share]firstEnter]) {
        AppDelegateInstance.window.rootViewController = [[JHGuidePageVC alloc]init];
        
    }else{
        
        if ([[JHUserManager share]needLoginHandle]) {
            
            AppDelegateInstance.window.rootViewController = JHNaviInstance.loginNavi;
        }else{
            AppDelegateInstance.window.rootViewController = [[JHTabBarC alloc]init];
        }
        
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
