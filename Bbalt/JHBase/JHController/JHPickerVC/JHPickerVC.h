//
//  JHPickerVC.h
//  Xinxy
//
//  Created by bory on 2018/5/2.
//  Copyright © 2018年 hans. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ReactiveObjC/ReactiveObjC.h>
#import "NSDate+Category.h"
typedef NS_ENUM(NSInteger,JHPickerType){
    JHPickerTypeOther,
    JHPickerTypeCity,
    JHPickerTypeYMD,
    JHPickerTypeYMDHMS
};
typedef void (^TitleSelectBlock)(UIPickerView *picker,NSInteger row,NSInteger component);
typedef void (^CompleteSelectBlock)(UIButton *sender,NSMutableArray *arr);
typedef void (^CancelSelectBlock)(void);
@interface JHPickerVC : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *bgBtn;
@property (weak, nonatomic) IBOutlet UIButton *cancelBtn;
@property (weak, nonatomic) IBOutlet UIButton *completeBtn;
@property (weak, nonatomic) IBOutlet UILabel *desLabel;
@property (weak, nonatomic) IBOutlet UIPickerView *picker;
@property (weak, nonatomic) IBOutlet UIView *bgBar;

@property(nonatomic,assign)JHPickerType type;
@property(nonatomic,strong)NSArray<NSArray*> *dataArr;
@property(nonatomic,strong)NSMutableArray *returnArr;
@property(nonatomic,copy)TitleSelectBlock titleSelectBlock;
@property(nonatomic,copy)CompleteSelectBlock completeSelectBlock;
@property(nonatomic,copy)CancelSelectBlock cancelSelectBlock;

@property(nonatomic,strong)NSMutableArray *cityArr;
@property(nonatomic,strong)NSMutableArray *arr0;
@property(nonatomic,strong)NSMutableArray *arr1;
@property(nonatomic,strong)NSMutableArray *arr2;
@property(nonatomic,strong)NSMutableArray *arr3;
@property(nonatomic,strong)NSMutableArray *arr4;
@property(nonatomic,strong)NSMutableArray *arr5;

-(void)initCity:(NSArray*)cityArr;
-(void)initYMD;
-(void)initYMDHMS;
@end
