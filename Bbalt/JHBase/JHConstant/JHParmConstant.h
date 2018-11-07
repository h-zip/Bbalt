//
//  JHParmConstant.h
//  Test
//
//  Created by bory on 2018/5/8.
//  Copyright © 2018年 hans. All rights reserved.
//

#ifndef JHParmConstant_h
#define JHParmConstant_h

typedef NSInteger (^SectionNumBlock)(UITableView *tableView);
typedef NSInteger (^RowNumBlock)(UITableView *tableView,NSInteger section);
typedef CGFloat (^RowHeightBlock)(UITableView *tableView,NSIndexPath *indexPath);
typedef UITableViewCell* (^CellBlock)(UITableView *tableView,NSIndexPath *indexPath);

typedef CGFloat (^SectionHeaderHeightBlock)(UITableView *tableView,NSInteger section);
typedef UIView* (^SectionHeaderBlock)(UITableView *tableView,NSInteger section);

typedef CGFloat (^SectionFooterHeightBlock)(UITableView *tableView,NSInteger section);
typedef UIView* (^SectionFooterBlock)(UITableView *tableView,NSInteger section);

typedef UIView* (^TableHeaderBlock)(void);
typedef UIView* (^TableFooterBlock)(void);

typedef void(^RowSelectBlock)(UITableView *tableView,NSIndexPath *indexPath);

#define PageIndex @"PageIndex"
#define PageSize @"PageSize"

#endif /* JHParmConstant_h */
