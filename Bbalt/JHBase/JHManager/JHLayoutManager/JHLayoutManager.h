//
//  JHLayoutManager.h
//  Bbalt
//
//  Created by bory on 2019/1/31.
//  Copyright © 2019年 hans. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

#define JH_Left NSLayoutAttributeLeft
#define JH_Right NSLayoutAttributeRight
#define JH_Top NSLayoutAttributeTop
#define JH_Bottom NSLayoutAttributeBottom
#define JH_Leading NSLayoutAttributeLeading
#define JH_Trailing NSLayoutAttributeTrailing
#define JH_Width NSLayoutAttributeWidth
#define JH_Height NSLayoutAttributeHeight
#define JH_CenterX NSLayoutAttributeCenterX
#define JH_CenterY NSLayoutAttributeCenterY
#define JH_Baseline NSLayoutAttributeLastBaseline
#define JH_NotAnAttribute NSLayoutAttributeNotAnAttribute

#define JH_SafeArea(view) [[JHLayoutManager share] safeArea:view]

#define JH_Layout(item1,attr1,item2,attr2,const) P_JHLayout(item1,attr1,NSLayoutRelationEqual,item2,attr2,1,const)
#define P_JHLayout(item1,attr1,relation,item2,attr2,mutip,const) [NSLayoutConstraint constraintWithItem:item1 attribute:attr1 relatedBy:relation toItem:item2 attribute:attr2 multiplier:mutip constant:const]

#define JH_AddLayouts(view, arr) [view addConstraints: arr]
#define JH_AddLayout(view, layout) [view addConstraint: layout]

#define JH_EqualSizeLayouts(item1,item2) [[JHLayoutManager share] equalSizeLayoutItem:item1 ToItem:item2]
#define JH_EqualRowLayouts(items,item) [[JHLayoutManager share] equalRowLayoutItems:items ToItem:item]
#define JH_CenterLayouts(item1,item2,size) [[JHLayoutManager share] centerLayoutSize:size Item:item1 ToItem:item2]
@interface JHLayoutManager : NSObject
+(instancetype)share;
-(nullable id)safeArea:(UIView*)view;
-(NSArray*)equalSizeLayoutItem:(UIView*)item1
                ToItem:(UIView*)item2;
-(NSArray*)equalRowLayoutItems:(NSArray*)items
                        ToItem:(UIView*)item;
-(NSArray*)centerLayoutSize:(CGSize)size
                       Item:(UIView*)item1
                     ToItem:(UIView*)item2;

@end

NS_ASSUME_NONNULL_END
