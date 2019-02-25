//
//  JHTabsView.h
//  Bbalt
//
//  Created by bory on 2019/2/25.
//  Copyright © 2019年 hans. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
#define JH_Tabs(titles,margin,lineColor,lineHeight,selectedAttr,unSelectedAttr) [[JHTabsView alloc]initWithTitles:titles Margin:margin LineColor:lineColor LineHeight:lineHeight SelectedAttr:selectedAttr UnSelectedAttr:unSelectedAttr]
@interface JHTabsView : UIView
@property(nonatomic,strong)NSMutableArray<JHButton*> *tabs;
@property(nonatomic,strong)NSArray *titles;
@property(nonatomic,strong)UIView *line;
@property(nonatomic,strong)UIColor *lineColor;
@property(nonatomic,assign)CGFloat lineHeight;
@property(nonatomic,strong)NSDictionary *selectedAttr;
@property(nonatomic,strong)NSDictionary *unSelectedAttr;
@property(nonatomic,strong)NSMutableArray *widthArr;
@property(nonatomic,assign)CGFloat margin;
@property(nonatomic,assign)CGFloat spacing;

@property(nonatomic,strong)NSLayoutConstraint *lineLeft;
@property(nonatomic,strong)NSLayoutConstraint *lineWidth;

@property(nonatomic,assign)NSInteger index;

@property(nonatomic,copy)TabTapBlock tabTapBlock;
-(instancetype)initWithTitles:(NSArray*)titles
                       Margin:(CGFloat)margin
                    LineColor:(UIColor*)lineColor
                   LineHeight:(CGFloat)lineHeight
                 SelectedAttr:(NSDictionary*)selectedAttr
               UnSelectedAttr:(NSDictionary*)unSelectedAttr;
@end

NS_ASSUME_NONNULL_END
