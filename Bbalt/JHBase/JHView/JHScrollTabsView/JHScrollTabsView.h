//
//  JHScrollTabsView.h
//  Bbalt
//
//  Created by bory on 2019/2/26.
//  Copyright © 2019年 hans. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
#define JH_ScrollTabs(titles,margin,spacing,lineColor,lineHeight,selectedAttr,unSelectedAttr) [[JHScrollTabsView alloc]initWithTitles:titles Margin:margin Spacing:spacing LineColor:lineColor LineHeight:lineHeight SelectedAttr:selectedAttr UnSelectedAttr:unSelectedAttr]
@interface JHScrollTabsView : UIView
@property(nonatomic,strong)JHScrollView *containerScrollView;
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
                      Spacing:(CGFloat)spacing
                    LineColor:(UIColor*)lineColor
                   LineHeight:(CGFloat)lineHeight
                 SelectedAttr:(NSDictionary*)selectedAttr
               UnSelectedAttr:(NSDictionary*)unSelectedAttr;

//-(void)scrollChangeToIndex:(NSInteger)index;
@end

NS_ASSUME_NONNULL_END
