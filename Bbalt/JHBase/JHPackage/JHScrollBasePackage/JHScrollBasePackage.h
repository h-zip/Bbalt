//
//  JHScrollBasePackage.h
//  Bbalt
//
//  Created by bory on 2019/2/15.
//  Copyright © 2019年 hans. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSInteger,JHPackageType) {
    JHPackageTypeTablePlain,
    JHPackageTypeTableGrouped,
    JHPackageTypeCollection
};
NS_ASSUME_NONNULL_BEGIN

@interface JHScrollBasePackage : NSObject
@property(nonatomic,strong)UIScrollView *mainView;
-(instancetype)initWithStyle:(JHPackageType)style;
-(void)initRefreshHeaderWithBlock:(void (^)(void))block;
-(void)initRefreshFooterWithBlock:(void (^)(void))block;
-(void)reload;
@end

NS_ASSUME_NONNULL_END
