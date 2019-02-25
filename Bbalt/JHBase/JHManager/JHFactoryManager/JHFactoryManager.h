//
//  JHFactoryManager.h
//  Bbalt
//
//  Created by bory on 2019/2/14.
//  Copyright © 2019年 hans. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JHTabsView.h"
NS_ASSUME_NONNULL_BEGIN
#define JH_baseTableView(style) [[JHFactoryManager share] baseTableViewWithStyle:style]
#define JH_baseCollectionView() [[JHFactoryManager share] baseCollectionView]
#define JH_baseScrollView() [[JHFactoryManager share] baseScrollView]
#define JH_ZoomScrollView(min,max) [[JHFactoryManager share] zoomScrollViewWithMin:min Max:max]
#define JH_baseTabsView(titles) [[JHFactoryManager share] baseTabsViewWithTitles:titles]
@interface JHFactoryManager : NSObject
+(instancetype)share;
-(JHTableView *)baseTableViewWithStyle:(UITableViewStyle)style;
-(JHCollectionView *)baseCollectionView;
-(JHScrollView *)zoomScrollViewWithMin:(CGFloat)min
                                   Max:(CGFloat)max;
-(JHScrollView *)baseScrollView;
-(JHTabsView *)baseTabsViewWithTitles:(NSArray*)titles;
@end

NS_ASSUME_NONNULL_END
