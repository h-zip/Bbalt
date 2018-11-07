//
//  JHTabBarC.h
//  Ubtms-boss
//
//  Created by hjh on 17/6/26.
//  Copyright © 2017年 com. All rights reserved.
//

#import "JHBaseTabBarC.h"
#import "JHAppDelegate.h"
@interface JHTabBarC : JHBaseTabBarC
@property (nonatomic,strong) NSArray *imageAry;//未选中的item中间的图片 大小使用 30*30   30*30
@property (nonatomic,strong) NSArray *selectedImageAry;//选中的item中间的图片 大小使用 30*30   30*30
@property (nonatomic,strong) NSArray *titleAry;//item的文字
@property (nonatomic,strong) UIColor *tintColor;//未选中的item的字体的颜色
@property (nonatomic,strong) UIColor *selectedTintColor;//选中的item的字体的颜色
@property (nonatomic,strong) UIImage *backgroundImage;//tabbar的背景图片 大小使用 1*44   2*88
@property (nonatomic,strong) UIImage *selectionIndicatorImage;//选中的item的背景色 大小使用 1*44   2*88
@end
