//
//  JHCollectionBaseVC.h
//  Bbalt
//
//  Created by bory on 2019/2/14.
//  Copyright © 2019年 hans. All rights reserved.
//
#import "JHBaseVC.h"

NS_ASSUME_NONNULL_BEGIN

@interface JHCollectionBaseVC : JHBaseVC<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property(nonatomic,copy)SectionNumBlock_C sectionNumBlock;
@property(nonatomic,copy)ItemNumBlock_C itemNumBlock;
@property(nonatomic,copy)ItemSizeBlock_C itemSizeBlock;
@property(nonatomic,copy)CellBlock_C cellBlock;

@property(nonatomic,copy)ReusableViewBlock_C reusableViewBlock;
@property(nonatomic,copy)SectionHeaderSizeBlock_C sectionHeaderSizeBlock;
@property(nonatomic,copy)SectionFooterSizeBlock_C sectionFooterSizeBlock;

@property(nonatomic,copy)SectionInsetsBlock_C sectionInsetsBlock;
@property(nonatomic,copy)SectionLineSpaceBlock_C sectionLineSpaceBlock;
@property(nonatomic,copy)SectionInteritemSpaceBlock_C sectionInteritemSpaceBlock;

@property(nonatomic,copy)ItemSelectBlock_C itemSelectBlock;
@end

NS_ASSUME_NONNULL_END
