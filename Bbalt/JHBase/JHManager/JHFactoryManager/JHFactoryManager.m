//
//  JHFactoryManager.m
//  Bbalt
//
//  Created by bory on 2019/2/14.
//  Copyright © 2019年 hans. All rights reserved.
//

#import "JHFactoryManager.h"

@implementation JHFactoryManager
+(instancetype)share{
    static JHFactoryManager *_JHFactoryManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _JHFactoryManager = [[self alloc]init];
    });
    return _JHFactoryManager;
}
-(instancetype)init{
    if (self = [super init]) {
    }
    return self;
}
-(JHTableView*)baseTableViewWithStyle:(UITableViewStyle)style{
    JHTableView *tableView = [[JHTableView alloc]initWithFrame:CGRectZero style:style];
    if (@available(iOS 11.0, *)) {
        tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    tableView.estimatedRowHeight = 0;
    tableView.estimatedSectionFooterHeight = 0;
    tableView.estimatedSectionHeaderHeight = 0;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    return tableView;
}
-(JHCollectionView*)baseCollectionView{
    JHCollectionView *collectionView = [[JHCollectionView alloc]init];
    if (@available(iOS 11.0, *)) {
        collectionView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    return collectionView;
}
-(JHScrollView *)zoomScrollViewWithMin:(CGFloat)min
                                   Max:(CGFloat)max{
    JHScrollView *scrollView = [[JHScrollView alloc]init];
    if (@available(iOS 11.0, *)) {
        scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.scrollEnabled = YES;
    scrollView.pagingEnabled = YES;
    scrollView.minimumZoomScale = min;
    scrollView.maximumZoomScale = max;
    scrollView.backgroundColor = [UIColor blackColor];
    return scrollView;
}
@end
