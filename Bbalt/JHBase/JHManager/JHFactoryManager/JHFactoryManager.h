//
//  JHFactoryManager.h
//  Bbalt
//
//  Created by bory on 2019/2/14.
//  Copyright © 2019年 hans. All rights reserved.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN
#define JH_baseTableView(style) [[JHFactoryManager share] baseTableViewWithStyle:style]
#define JH_baseCollectionView() [[JHFactoryManager share] baseCollectionView]
@interface JHFactoryManager : NSObject
+(instancetype)share;
-(JHTableView *)baseTableViewWithStyle:(UITableViewStyle)style;
-(JHCollectionView *)baseCollectionView;
@end

NS_ASSUME_NONNULL_END
