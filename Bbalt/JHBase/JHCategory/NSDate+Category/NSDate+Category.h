//
//  NSDate+Category.h
//  Ubtms-boss
//
//  Created by hjh on 17/8/3.
//  Copyright © 2017年 com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Category)
+ (NSDate*)dateString:(NSString*)dateString
         formatString:(NSString*)formateString;
+ (NSDate*)dateFromString:(NSString*)dateString
             formatString:(NSString*)formateString;
+(NSString*)currentDateWithFormatString:(NSString*)formateString;
+(NSString*)currentYear;
+(NSString*)currentMonth;
+(NSString*)currentDay;
+(NSString*)currentHour;
+(NSString*)currentMin;
+(NSString*)currentSecond;
-(NSString*)formatByDate:(NSDate*)date;

+(NSString*)getCurrentWeekDate:(NSDate*)date Index:(NSInteger)index;
+(NSString*)getCurrentWeekDateStr:(NSString*)dateStr Index:(NSInteger)index;
+(NSString*)getLastWeekDate:(NSDate*)date Index:(NSInteger)index;
+(NSString*)getLastWeekDateStr:(NSString*)dateStr Index:(NSInteger)index;
+(NSString*)getNextWeekDate:(NSDate*)date Index:(NSInteger)index;
+(NSString*)getNextWeekDateStr:(NSString*)dateStr Index:(NSInteger)index;

+ (NSArray *)getMonthBeginAndEndWith:(NSString *)dateStr;
@end
