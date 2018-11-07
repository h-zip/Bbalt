//
//  JHTableListVC.h
//  Xinxy
//
//  Created by bory on 2018/4/26.
//  Copyright © 2018年 hans. All rights reserved.
//

#import "JHTableBaseVC.h"

#import "JHBaseModel.h"

@interface JHTableListVC : JHTableBaseVC

@property(nonatomic,strong)JHBaseModel *classModel;
@property(nonatomic,strong)NSArray *dataArr;


@end
