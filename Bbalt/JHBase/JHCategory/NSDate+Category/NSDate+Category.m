//
//  NSDate+Category.m
//  Ubtms-boss
//
//  Created by hjh on 17/8/3.
//  Copyright © 2017年 com. All rights reserved.
//

#import "NSDate+Category.h"

@implementation NSDate (Category)
/* 日期字符串‘formate' 转换为 NSDate */
+ (NSDate*)dateString:(NSString*)dateString
         formatString:(NSString*)formateString{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:formateString];
    NSDate *retDate = [formatter dateFromString:dateString];
    
    return retDate;
}

+ (NSDate*)dateFromString:(NSString*)dateString
         formatString:(NSString*)formateString{
    
   NSString* formate= [formateString substringToIndex:(dateString.length-1)];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:formate];
    NSDate *retDate = [formatter dateFromString:dateString];
    
    return retDate;
}


+(NSString*)currentDateWithFormatString:(NSString*)formateString{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:formateString];
    
    return [formatter stringFromDate:[NSDate date]];
}
+(NSString*)currentYear{
    
    return [NSDate currentDateWithFormatString:@"yyyy"];
}
+(NSString*)currentMonth{
    
    return [NSDate currentDateWithFormatString:@"MM"];
}
+(NSString*)currentDay{
    
    return [NSDate currentDateWithFormatString:@"dd"];
}
+(NSString*)currentHour{
    
    return [NSDate currentDateWithFormatString:@"HH"];
}
+(NSString*)currentMin{
    
    return [NSDate currentDateWithFormatString:@"mm"];
}
+(NSString*)currentSecond{
    
    return [NSDate currentDateWithFormatString:@"ss"];
}
-(NSString*)formatByDate:(NSDate*)date{
//    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//    [formatter setDateFormat:@"yyyy年MM月dd日 HH时mm分ss秒"];
//    NSString *string = [formatter stringFromDate:date];
    
//    NSDateFormatter *inputFormatter= [[NSDateFormatter alloc] init];
//    [inputFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"] ];
//    [inputFormatter setDateFormat:@"yyyy年MM月dd日 HH时mm分ss秒"];
//    NSDate*inputDate = [inputFormatter dateFromString:string];
    //NSLog(@"startDate= %@", inputDate);
    
    NSDate*inputDate = date;
    NSDateFormatter *outputFormatter= [[NSDateFormatter alloc] init];
    [outputFormatter setLocale:[NSLocale currentLocale]];
    [outputFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    //get date str
    NSString *str= [outputFormatter stringFromDate:inputDate];
    //str to nsdate
    NSDate *strDate = [outputFormatter dateFromString:str];
    //修正8小时的差时
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate: strDate];
    NSDate *endDate = [strDate  dateByAddingTimeInterval: interval];
    //NSLog(@"endDate:%@",endDate);
    NSString *lastTime = [self compareDate:endDate];
    //NSLog(@"lastTime = %@",lastTime);
    return lastTime;
}
- (NSString *)formatByString:(NSString *)string{
    NSDateFormatter *inputFormatter= [[NSDateFormatter alloc] init];
    [inputFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"] ];
    [inputFormatter setDateFormat:@"yyyy年MM月dd日 HH时mm分ss秒"];
    NSDate*inputDate = [inputFormatter dateFromString:string];
    //NSLog(@"startDate= %@", inputDate);
    
    NSDateFormatter *outputFormatter= [[NSDateFormatter alloc] init];
    [outputFormatter setLocale:[NSLocale currentLocale]];
    [outputFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    //get date str
    NSString *str= [outputFormatter stringFromDate:inputDate];
    //str to nsdate
    NSDate *strDate = [outputFormatter dateFromString:str];
    //修正8小时的差时
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate: strDate];
    NSDate *endDate = [strDate  dateByAddingTimeInterval: interval];
    //NSLog(@"endDate:%@",endDate);
    NSString *lastTime = [self compareDate:endDate];
    NSLog(@"lastTime = %@",lastTime);
    return str;
}

-(NSString *)compareDate:(NSDate *)date{
    
    NSTimeInterval secondsPerDay = 24 * 60 * 60;
    
    //修正8小时之差
    NSDate *date1 = [NSDate date];
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate: date1];
    NSDate *localeDate = [date1  dateByAddingTimeInterval: interval];
    
    //NSLog(@"nowdate=%@\nolddate = %@",localeDate,date);
    NSDate *today = localeDate;
    NSDate *yesterday,*beforeOfYesterday;
    //今年
    NSString *toYears;
    
    toYears = [[today description] substringToIndex:4];
    
    yesterday = [today dateByAddingTimeInterval: -secondsPerDay];
    beforeOfYesterday = [yesterday dateByAddingTimeInterval: -secondsPerDay];
    
    // 10 first characters of description is the calendar date:
    NSString *todayString = [[today description] substringToIndex:10];
    NSString *yesterdayString = [[yesterday description] substringToIndex:10];
    NSString *beforeOfYesterdayString = [[beforeOfYesterday description] substringToIndex:10];
    
    NSString *dateString = [[date description] substringToIndex:10];
    NSString *dateYears = [[date description] substringToIndex:4];
    
    NSString *dateContent;
    if ([dateYears isEqualToString:toYears]) {//同一年
        //今 昨 前天的时间
        NSString *time = [[date description] substringWithRange:(NSRange){11,5}];
        //其他时间
        NSString *time2 = [[date description] substringWithRange:(NSRange){5,11}];
        if ([dateString isEqualToString:todayString]){
            dateContent = [NSString stringWithFormat:@"今天 %@",time];
            return dateContent;
        } else if ([dateString isEqualToString:yesterdayString]){
            dateContent = [NSString stringWithFormat:@"昨天 %@",time];
            return dateContent;
        }else if ([dateString isEqualToString:beforeOfYesterdayString]){
            dateContent = [NSString stringWithFormat:@"前天 %@",time];
            return dateContent;
        }else{
            return time2;
        }
    }else{
        return dateString;
    }
}
+(NSString*)getCurrentWeekDate:(NSDate*)date Index:(NSInteger)index{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *comp = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday  | NSCalendarUnitDay fromDate:date];
    // 获取今天是周几
    NSInteger weekDay = [comp weekday];
    // 获取几天是几号
    NSInteger day = [comp day];
    NSLog(@"%ld----%ld",(long)weekDay,(long)day);
    
    // 计算当前日期和本周的星期一和星期天相差天数
    //long firstDiff,lastDiff;
    //    weekDay = 1;
    long Diff;
    if (weekDay == 1)
    {
        Diff = -6 + index;
        //firstDiff = -6;
        //lastDiff = 0;
    }
    else
    {
        Diff = [calendar firstWeekday] - weekDay + 1 +index;
        //firstDiff = [calendar firstWeekday] - weekDay + 1;
        //lastDiff = 8 - weekDay;
    }
    NSLog(@"Diff: %ld",Diff);
    
    // 在当前日期(去掉时分秒)基础上加上差的天数
    
    [comp setDay:day + Diff];
    NSDate *DayOfWeek = [calendar dateFromComponents:comp];
    
//    [comp setDay:day + lastDiff];
//    NSDate *lastDayOfWeek = [calendar dateFromComponents:comp];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *Day = [formatter stringFromDate:DayOfWeek];
    //NSString *lastDay = [formatter stringFromDate:lastDayOfWeek];
    NSLog(@"%@",Day);
    
    return Day;
}
+(NSString*)getCurrentWeekDateStr:(NSString*)dateStr Index:(NSInteger)index{
    NSDateFormatter *formatter= [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *date = [formatter dateFromString:dateStr];
    NSString* str = [NSDate getCurrentWeekDate:date Index:index];
    return str;
}
+(NSString*)getLastWeekDate:(NSDate*)date Index:(NSInteger)index{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *comp = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday  | NSCalendarUnitDay fromDate:date];
    // 获取今天是周几
    NSInteger weekDay = [comp weekday];
    // 获取几天是几号
    NSInteger day = [comp day];
    NSLog(@"%ld----%ld",(long)weekDay,(long)day);
    
    // 计算当前日期和本周的星期一和星期天相差天数
    //long firstDiff,lastDiff;
    //    weekDay = 1;
    long Diff;
    if (weekDay == 1)
    {
        Diff = -6 + index;
        //firstDiff = -6;
        //lastDiff = 0;
    }
    else
    {
        Diff = [calendar firstWeekday] - weekDay + 1 +index;
        //firstDiff = [calendar firstWeekday] - weekDay + 1;
        //lastDiff = 8 - weekDay;
    }
    NSLog(@"Diff: %ld",Diff);
    
    // 在当前日期(去掉时分秒)基础上加上差的天数
    
    [comp setDay:day + Diff-7];
    NSDate *DayOfWeek = [calendar dateFromComponents:comp];
    
    //    [comp setDay:day + lastDiff];
    //    NSDate *lastDayOfWeek = [calendar dateFromComponents:comp];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *Day = [formatter stringFromDate:DayOfWeek];
    //NSString *lastDay = [formatter stringFromDate:lastDayOfWeek];
    NSLog(@"%@",Day);
    
    return Day;
}
+(NSString*)getLastWeekDateStr:(NSString*)dateStr Index:(NSInteger)index{
    NSDateFormatter *formatter= [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *date = [formatter dateFromString:dateStr];
    NSString* str = [NSDate getLastWeekDate:date Index:index];
    return str;
}
+(NSString*)getNextWeekDate:(NSDate*)date Index:(NSInteger)index{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *comp = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday  | NSCalendarUnitDay fromDate:date];
    // 获取今天是周几
    NSInteger weekDay = [comp weekday];
    // 获取几天是几号
    NSInteger day = [comp day];
    NSLog(@"%ld----%ld",(long)weekDay,(long)day);
    
    // 计算当前日期和本周的星期一和星期天相差天数
    //long firstDiff,lastDiff;
    //    weekDay = 1;
    long Diff;
    if (weekDay == 1)
    {
        Diff = -6 + index;
        //firstDiff = -6;
        //lastDiff = 0;
    }
    else
    {
        Diff = [calendar firstWeekday] - weekDay + 1 +index;
        //firstDiff = [calendar firstWeekday] - weekDay + 1;
        //lastDiff = 8 - weekDay;
    }
    NSLog(@"Diff: %ld",Diff);
    
    // 在当前日期(去掉时分秒)基础上加上差的天数
    
    [comp setDay:day + Diff+7];
    NSDate *DayOfWeek = [calendar dateFromComponents:comp];
    
    //    [comp setDay:day + lastDiff];
    //    NSDate *lastDayOfWeek = [calendar dateFromComponents:comp];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *Day = [formatter stringFromDate:DayOfWeek];
    //NSString *lastDay = [formatter stringFromDate:lastDayOfWeek];
    NSLog(@"%@",Day);
    
    return Day;
}
+(NSString*)getNextWeekDateStr:(NSString*)dateStr Index:(NSInteger)index{
    NSDateFormatter *formatter= [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *date = [formatter dateFromString:dateStr];
    NSString* str = [NSDate getNextWeekDate:date Index:index];
    return str;
}

+ (NSArray *)getMonthBeginAndEndWith:(NSString *)dateStr{
    
    NSDateFormatter *format=[[NSDateFormatter alloc] init];
    [format setDateFormat:@"yyyy-MM"];
    NSDate *newDate=[format dateFromString:dateStr];
    double interval = 0;
    NSDate *beginDate = nil;
    NSDate *endDate = nil;
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    [calendar setFirstWeekday:2];//设定周一为周首日
    BOOL ok = [calendar rangeOfUnit:NSCalendarUnitMonth startDate:&beginDate interval:&interval forDate:newDate];
    //分别修改为 NSDayCalendarUnit NSWeekCalendarUnit NSYearCalendarUnit
    if (ok) {
        endDate = [beginDate dateByAddingTimeInterval:interval-1];
    }else {
        return @[];
    }
    NSDateFormatter *myDateFormatter = [[NSDateFormatter alloc] init];
    [myDateFormatter setDateFormat:@"YYYY.MM.dd"];
    NSString *beginString = [myDateFormatter stringFromDate:beginDate];
    NSString *endString = [myDateFormatter stringFromDate:endDate];
    //NSString *s = [NSString stringWithFormat:@"%@-%@",beginString,endString];
    return @[beginString,endString];
}
@end
