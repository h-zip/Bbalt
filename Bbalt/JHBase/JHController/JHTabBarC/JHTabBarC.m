//
//  JHTabBarC.m
//  Ubtms-boss
//
//  Created by hjh on 17/6/26.
//  Copyright © 2017年 com. All rights reserved.
//

#import "JHTabBarC.h"

@interface JHTabBarC ()
@end



@implementation JHTabBarC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self initTabBarStyle];
    self.delegate = (JHAppDelegate*)AppDelegateInstance;
    
    // Do any additional setup after loading the view from its nib.
}
-(void)initTabBarStyle{
    UINavigationController *navi1 = JHNaviInstance.navi1;
    //navi1.navigationBar.titleTextAttributes=NormalTitleTextAttributes;

    UINavigationController *navi2 = JHNaviInstance.navi2;
    //navi2.navigationBar.titleTextAttributes=NormalTitleTextAttributes;

    UINavigationController *navi3 = JHNaviInstance.navi3;
    //navi3.navigationBar.titleTextAttributes=NormalTitleTextAttributes;

    UINavigationController *navi4 = JHNaviInstance.navi4;
    //navi4.navigationBar.titleTextAttributes=NormalTitleTextAttributes;
    
    self.viewControllers =@[navi1,navi2,navi3,navi4];
    self.titleAry = @[@"",@"",@"",@""];
    self.selectedImageAry = @[@"",@"",@"",@""];
    self.imageAry = @[@"",@"",@"",@""];

    //self.tintColor = ScrollColorThree;
    //self.selectedTintColor = ScrollColorOne;
    
//    self.tabBar.backgroundColor=[UIColor redColor];
//    self.backgroundImage = [UIImage imageNamed:@"ScrollImage2.jpg"];
//        self.selectionIndicatorImage = [UIImage imageNamed:@"tabbar_selected_bg_orange"];
//        CGFloat screenW=[[UIScreen mainScreen]bounds].size.width;
//        self.myTabBar.backgroundImage=[self reSizeImage:self.backgroundImage toSize:(CGSize){screenW,49}];
//    self.tabBar.selectionIndicatorImage = [UIImage reSizeImage:self.selectionIndicatorImage toSize:CGSizeMake(screenW/self.titleAry.count, 49)];
    
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:10],NSForegroundColorAttributeName : self.tintColor} forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:10],NSForegroundColorAttributeName : self.selectedTintColor} forState:UIControlStateSelected];
    
    UIView *bgView = [[UIView alloc]initWithFrame:self.tabBar.bounds];
    bgView.backgroundColor = [UIColor whiteColor];
    [[UITabBar appearance]insertSubview:bgView atIndex:0];
    
    for (int i=0; i<self.tabBar.items.count;i++) {
        
        UITabBarItem *item = (UITabBarItem*)self.tabBar.items[i];
        item.title = self.titleAry[i];
        item.titlePositionAdjustment = (UIOffset){0,0};
        item.image = [[UIImage imageNamed:self.imageAry[i]]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        item.selectedImage = [[UIImage imageNamed:self.selectedImageAry[i]]  imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//        item.image = [[UIImage reSizeImage:[UIImage imageNamed:self.imageAry[i]] toSize:(CGSize){30,30}]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//        
//        item.selectedImage = [[UIImage reSizeImage:[UIImage imageNamed:self.selectedImageAry[i]] toSize:(CGSize){30,30}] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
