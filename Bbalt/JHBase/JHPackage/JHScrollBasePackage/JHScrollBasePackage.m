//
//  JHScrollBasePackage.m
//  Bbalt
//
//  Created by bory on 2019/2/15.
//  Copyright © 2019年 hans. All rights reserved.
//

#import "JHScrollBasePackage.h"

@implementation JHScrollBasePackage
-(instancetype)initWithStyle:(JHPackageType)style{
    self = [super init];
    return self;
}
-(void)initRefreshHeaderWithBlock:(void (^)(void))block{
    MJRefreshNormalHeader *mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:block];
    mj_header.lastUpdatedTimeLabel.hidden = YES;
    self.mainView.mj_header = mj_header;
}
-(void)initRefreshFooterWithBlock:(void (^)(void))block{
    MJRefreshAutoNormalFooter *mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:block];
    self.mainView.mj_footer = mj_footer;
}
-(void)reload{
    
}
@end
