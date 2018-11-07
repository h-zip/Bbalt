//
//  JHBaseVC.m
//  Ubtms-boss
//
//  Created by hjh on 17/6/22.
//  Copyright © 2017年 com. All rights reserved.
//

#import "JHBaseVC.h"

@interface JHBaseVC ()<UIGestureRecognizerDelegate>

@end

@implementation JHBaseVC


-(void)hideNavigationBar{
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}
-(void)appearNavigationBar{
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}
-(void)configNavigationBarAlpba:(float)alpha{
//    if (![self.navigationController.class isSubclassOfClass:[JHBaseNaviC class]]) {
//        return;
//    }
//    JHBaseNaviC* navi = (JHBaseNaviC*)self.navigationController;
//    [navi configNavigationBarAlpha:alpha];
    //[[[self.navigationController.navigationBar subviews] objectAtIndex:0] setAlpha:alpha];
    // 导航栏背景透明度设置
    UIView *barBackgroundView = [[self.navigationController.navigationBar subviews] objectAtIndex:0];// _UIBarBackground
    UIImageView *backgroundImageView = [[barBackgroundView subviews] objectAtIndex:0];// UIImageView
    if (self.navigationController.navigationBar.isTranslucent) {
        if (backgroundImageView != nil && backgroundImageView.image != nil) {
            barBackgroundView.alpha = alpha;
        } else {
            UIView *backgroundEffectView = [[barBackgroundView subviews] objectAtIndex:1];// UIVisualEffectView
            if (backgroundEffectView != nil) {
                backgroundEffectView.alpha = alpha;
            }
        }
    } else {
        barBackgroundView.alpha = alpha;
    }
    if (alpha==0) {
        self.navigationController.navigationBar.clipsToBounds = YES;
    }else if(alpha==1){
        self.navigationController.navigationBar.clipsToBounds = NO;
    }
}
-(void)configNavigationBarBgImage:(UIImage* _Nonnull)bgImage{
    //self.navigationController.navigationBar.translucent = NO;
    [self.navigationController.navigationBar setBackgroundImage:[bgImage resizableImageWithCapInsets:(UIEdgeInsets){0,0,20,0} resizingMode:UIImageResizingModeStretch] forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
}
-(void)configNavigationBarTitleStyle:(NSDictionary* _Nonnull)style{
    self.navigationController.navigationBar.titleTextAttributes = style;
}
-(void)configNavigationLeftBarBtnItemImage:(UIImage *)image Target:(id)target action:(SEL)action{
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:image style:UIBarButtonItemStylePlain target:target action:action];
    
}
-(void)configNavigationRightBarBtnItemImage:(UIImage *)image Target:(id)target action:(SEL)action{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:image style:UIBarButtonItemStylePlain target:target action:action];
}
-(void)hiddenNavigationBackBarBtnItem{
    [self.navigationItem setHidesBackButton:YES];
}
-(void)changeNavigationBackBarBtnItemWithCustomImage:(UIImage*)image{
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.navigationController.navigationBar.backIndicatorImage = image;
    self.navigationController.navigationBar.backIndicatorTransitionMaskImage = image;
}
-(void)configNavigationBackBarBtnItemWithCustomImage:(UIImage*)image{
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.navigationController.navigationBar.backIndicatorImage = image;
    self.navigationController.navigationBar.backIndicatorTransitionMaskImage = image;
    self.navigationItem.leftItemsSupplementBackButton = YES;
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc]init];
    self.navigationItem.backBarButtonItem.title = @"";
}
-(void)cancelNaviBackItemTitle{
    self.navigationItem.leftItemsSupplementBackButton = YES;
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc]init];
    self.navigationItem.backBarButtonItem.title = @"";
}
-(void)configNavigationLeftBarBtnItemWithCustomView:(UIView*)view{
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:view];
}
-(void)configNavigationRightBarBtnItemWithCustomView:(UIView*)view{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:view];
}
-(void)configNavigationLeftBarBtnItemWithCustomViews:(NSArray*)views{
    NSMutableArray * arr = [@[]mutableCopy];
    for (int i = 0; i<views.count; i++) {
        if ([views[i] isKindOfClass:NSClassFromString(@"UIBarButtonItem")]) {
            arr[i] = views[i];
        }else{
            UIBarButtonItem * item = [[UIBarButtonItem alloc]initWithCustomView:views[i]];
            
            arr[i] = item;
        }
    }
    self.navigationItem.leftBarButtonItems = [arr copy];
}
-(void)configNavigationRightBarBtnItemWithCustomViews:(NSArray*)views{
    NSMutableArray * arr = [@[]mutableCopy];
    for (int i = 0; i<views.count; i++) {
        if ([views[i] isKindOfClass:NSClassFromString(@"UIBarButtonItem")]) {
            arr[i] = views[i];
        }else{
            UIBarButtonItem * item = [[UIBarButtonItem alloc]initWithCustomView:views[i]];
            
            arr[i] = item;
        }
    }
    self.navigationItem.rightBarButtonItems = [arr copy];
    
}
//- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
//    return YES;
//}
-(void)initCustomNavi{
    CGRect frame = (CGRect){0,0,kSCREEN_W,kTopHeight};
    self.customNavi = [[UIView alloc]initWithFrame:frame];
    self.customNavi.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.customNavi];
}

-(void)hideCustomNavi{
    self.customNavi.hidden = YES;
}

-(void)showCustomNavi{
    self.customNavi.hidden = NO;
}

-(void)setCustomNaviAlpha:(CGFloat)alpha{
    self.customNavi.backgroundColor = [[UIColor whiteColor]colorWithAlphaComponent:alpha];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.pageSize = 6;
    self.pageIndex = 0;
    [self.navigationController setNavigationBarHidden:YES];
    [self initCustomNavi];
}
-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    [self.view bringSubviewToFront:self.customNavi];
}
-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}
-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];

}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self handleFirstResponder];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)handleFirstResponder{

    [self.view endEditing:YES];

}
+(instancetype)initFromXIB{
    return [[self alloc]initWithNibName:NSStringFromClass([self class]) bundle:nil];
}
@end
