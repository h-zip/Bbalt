//
//  JHCollectionViewPackage.m
//  Bbalt
//
//  Created by bory on 2019/2/14.
//  Copyright © 2019年 hans. All rights reserved.
//

#import "JHCollectionViewPackage.h"

@implementation JHCollectionViewPackage
-(JHCollectionView*)collectionView {
    return (JHCollectionView*)self.mainView;
}
-(instancetype)initWithStyle:(JHPackageType)style{
    self = [super init];
    if (self) {
        _collectionView = JH_baseCollectionView();
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        self.mainView = _collectionView;
    }
    return self;
}
-(void)reload{
    [self.collectionView reloadData];
}
#pragma mark - ------------------UICollectionViewDelegate------------------
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (self.itemSelectBlock) self.itemSelectBlock(collectionView,indexPath);
}
#pragma mark - ------------------UICollectionViewDataSource------------------
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return self.sectionNumBlock ? self.sectionNumBlock(collectionView) : 0;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.itemNumBlock ? self.itemNumBlock(collectionView,section) : 0;
}
// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    return self.cellBlock ? self.cellBlock(collectionView,indexPath) : nil;
}
// The view that is returned must be retrieved from a call to -dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    return self.reusableViewBlock ? self.reusableViewBlock(collectionView,indexPath,kind) : nil;
}
#pragma mark - ------------------UICollectionViewDelegateFlowLayout------------------
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return self.itemSizeBlock ? self.itemSizeBlock(collectionView, collectionViewLayout, indexPath) : CGSizeZero;
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return self.sectionInsetsBlock ? self.sectionInsetsBlock(collectionView, collectionViewLayout, section) : UIEdgeInsetsZero;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return self.sectionLineSpaceBlock ? self.sectionLineSpaceBlock(collectionView, collectionViewLayout, section) : 0;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return self.sectionInteritemSpaceBlock ? self.sectionInteritemSpaceBlock(collectionView, collectionViewLayout, section) : 0;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return self.sectionHeaderSizeBlock ? self.sectionHeaderSizeBlock(collectionView, collectionViewLayout, section) : CGSizeZero;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    return self.sectionFooterSizeBlock ? self.sectionFooterSizeBlock(collectionView, collectionViewLayout, section) : CGSizeZero;
}
@end
