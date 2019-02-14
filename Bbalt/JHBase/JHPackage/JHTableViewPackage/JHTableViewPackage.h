//
//  JHTableViewPackage.h
//  Bbalt
//
//  Created by bory on 2019/2/14.
//  Copyright © 2019年 hans. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface JHTableViewPackage : NSObject<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)JHTableView *tableView;

@property(nonatomic,copy)SectionNumBlock sectionNumBlock;
@property(nonatomic,copy)RowNumBlock rowNumBlock;
@property(nonatomic,copy)RowHeightBlock rowHeightBlock;
@property(nonatomic,copy)CellBlock cellBlock;
@property(nonatomic,copy)SectionHeaderHeightBlock sectionHeaderHeightBlock;
@property(nonatomic,copy)SectionHeaderBlock sectionHeaderBlock;
@property(nonatomic,copy)SectionFooterHeightBlock sectionFooterHeightBlock;
@property(nonatomic,copy)SectionFooterBlock sectionFooterBlock;
@property(nonatomic,copy)RowSelectBlock rowSelectBlock;
-(instancetype)initWithStyle:(UITableViewStyle)style;
-(void)initTableHeader:(UIView*)header;
-(void)initTableFooter:(UIView*)footer;
-(void)initRefreshHeaderWithBlock:(void (^)(void))block;
-(void)initRefreshFooterWithBlock:(void (^)(void))block;
-(void)reload;
@end

NS_ASSUME_NONNULL_END
