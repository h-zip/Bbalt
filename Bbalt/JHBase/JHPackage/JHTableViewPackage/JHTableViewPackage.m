//
//  JHTableViewPackage.m
//  Bbalt
//
//  Created by bory on 2019/2/14.
//  Copyright © 2019年 hans. All rights reserved.
//

#import "JHTableViewPackage.h"

@implementation JHTableViewPackage
-(JHTableView*)tableView {
    return (JHTableView*)self.mainView;
}
-(instancetype)initWithStyle:(JHPackageType)style{
    self = [super init];
    if (self) {
        _tableView = JH_baseTableView((NSInteger)style);
        _tableView.delegate = self;
        _tableView.dataSource = self;
        self.mainView = _tableView;
    }
    return self;
}
-(void)initTableHeader:(UIView*)header{
    UIView *view = [[UIView alloc]initWithFrame:header.frame];
    [view addSubview:header];
    self.tableView.tableHeaderView = view;
}
-(void)initTableFooter:(UIView*)footer{
    UIView *view = [[UIView alloc]initWithFrame:footer.frame];
    [view addSubview:footer];
    self.tableView.tableFooterView = view;
}
-(void)reload{
    [self.tableView reloadData];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    NSInteger num = 0;
    if (self.sectionNumBlock) {
        num = self.sectionNumBlock(tableView);
    }
    return num;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSInteger num = 0;
    if (self.rowNumBlock) {
        num = self.rowNumBlock(tableView, section);
    }
    return num;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat height = 0;
    if (self.rowHeightBlock) {
        height = self.rowHeightBlock(tableView, indexPath);
    }
    return height;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = nil;
    if (self.cellBlock) {
        cell = self.cellBlock(tableView, indexPath);
    }
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    CGFloat height = 0;
    if (self.sectionHeaderHeightBlock) {
        height = self.sectionHeaderHeightBlock(tableView, section);
    }
    return height;
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * header = nil;
    if (self.sectionHeaderBlock) {
        header = self.sectionHeaderBlock(tableView, section);
    }
    return header;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    CGFloat height = 0;
    if (self.sectionFooterHeightBlock) {
        height = self.sectionFooterHeightBlock(tableView, section);
    }
    return height;
}

-(UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView * footer = nil;
    if (self.sectionFooterBlock) {
        footer = self.sectionFooterBlock(tableView, section);
    }
    return footer;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.rowSelectBlock) {
        self.rowSelectBlock(tableView, indexPath);
    }
}
@end
