//
//  JHDecimalManager.h
//  Bbalt
//
//  Created by bory on 2019/1/29.
//  Copyright © 2019年 hans. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

#define D_ToNum(str) [NSDecimalNumber decimalNumberWithString:str]
#define D_ToStr(num) [NSString stringWithFormat:@"%@",num]
#define D_Add(num_a,num_b) [num_a decimalNumberByAdding:num_b]
#define D_Subtract(num_a,num_b) [num_a decimalNumberBySubtracting:num_b]
#define D_Multiply(num_a,num_b) [num_a decimalNumberByMultiplyingBy:num_b]
#define D_Divid(num_a,num_b) [num_a decimalNumberByDividingBy:num_b]
#define D_MultiplyByPowerOf10(num,power) [num decimalNumberByMultiplyingByPowerOf10:power]
#define D_RaiseToPower(num,power) [num decimalNumberByRaisingToPower:power]
#define D_RoundPlain(num) [num decimalNumberByRoundingAccordingToBehavior:[JHDecimalManager share].roundPlainHandler]

@interface JHDecimalManager : NSObject
@property(nonatomic,strong)NSDecimalNumberHandler *roundPlainHandler;
+(instancetype)share;
@end

NS_ASSUME_NONNULL_END
