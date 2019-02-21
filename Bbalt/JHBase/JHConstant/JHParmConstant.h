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

typedef void(^BtnTapBlock)(UIButton *sender);
typedef void(^GestureBlock)(UIGestureRecognizer *gr);

typedef NSInteger (^SectionNumBlock_C)(UICollectionView *collectionView);
typedef NSInteger (^ItemNumBlock_C)(UICollectionView *collectionView,NSInteger section);
typedef CGSize (^ItemSizeBlock_C)(UICollectionView *collectionView,UICollectionViewLayout *layout,NSIndexPath *indexPath);
typedef UICollectionViewCell* (^CellBlock_C)(UICollectionView *collectionView,NSIndexPath *indexPath);

typedef UICollectionReusableView* (^ReusableViewBlock_C)(UICollectionView *collectionView,NSIndexPath *indexPath,NSString *kind);
typedef CGSize (^SectionHeaderSizeBlock_C)(UICollectionView *collectionView,UICollectionViewLayout *layout,NSInteger section);
typedef CGSize (^SectionFooterSizeBlock_C)(UICollectionView *collectionView,UICollectionViewLayout *layout,NSInteger section);

typedef UIEdgeInsets (^SectionInsetsBlock_C)(UICollectionView *collectionView,UICollectionViewLayout *layout,NSInteger section);
typedef CGFloat (^SectionLineSpaceBlock_C)(UICollectionView *collectionView,UICollectionViewLayout *layout,NSInteger section);
typedef CGFloat (^SectionInteritemSpaceBlock_C)(UICollectionView *collectionView,UICollectionViewLayout *layout,NSInteger section);

typedef void(^ItemSelectBlock_C)(UICollectionView *collectionView,NSIndexPath *indexPath);

#define PageIndex @"PageIndex"
#define PageSize @"PageSize"

#endif /* JHParmConstant_h */
