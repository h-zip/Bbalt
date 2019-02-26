//
//  JHPickerVC.m
//  Xinxy
//
//  Created by bory on 2018/5/2.
//  Copyright © 2018年 hans. All rights reserved.
//

#import "JHPickerVC.h"

@interface JHPickerVC ()<UIPickerViewDelegate,UIPickerViewDataSource>

@end

@implementation JHPickerVC
-(NSArray<NSArray*>*)dataArr{
    if (!_dataArr) {
        _dataArr = @[];
    }
    return _dataArr;
}
-(NSMutableArray*)returnArr{
    if (!_returnArr) {
        _returnArr = [@[]mutableCopy];
    }
    return _returnArr;
}


-(NSMutableArray*)cityArr{
    if (!_cityArr) {
        _cityArr = [@[]mutableCopy];
        
    }
    return _cityArr;
}
-(NSMutableArray*)arr0{
    if (!_arr0) {
        _arr0 = [@[]mutableCopy];
    }
    return _arr0;
}
-(NSMutableArray*)arr1{
    if (!_arr1) {
        _arr1 = [@[]mutableCopy];
    }
    return _arr1;
}-(NSMutableArray*)arr2{
    if (!_arr2) {
        _arr2 = [@[]mutableCopy];
    }
    return _arr2;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self configSubviews];
    // Do any additional setup after loading the view from its nib.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}
-(void)dealloc{
    
}
- (NSInteger)getSumOfDaysInYear:(NSString* )year Month:(NSString* )month{
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    
    [formatter setDateFormat:@"yyyy-MM"]; // 年-月
    
    NSString * dateStr = [NSString stringWithFormat:@"%@-%@",year,month];
    
    NSDate * date = [formatter dateFromString:dateStr];
    
    //
    NSCalendar * calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSRange range = [calendar rangeOfUnit:NSCalendarUnitDay
                                   inUnit: NSCalendarUnitMonth
                                  forDate:date];
    return range.length;
}
-(void)initYMD{
    NSMutableArray *yArr = [@[]mutableCopy];
    int year = [[NSDate currentYear]intValue];
    
    for (int i = year-100; i<year; i++) {
        yArr[i-year+100] = [NSString stringWithFormat:@"%d年",i+1];
    }
    NSArray *mArr = @[@"01月",@"02月",@"03月",@"04月",@"05月",@"06月",@"07月",@"08月",@"09月",@"10月",@"11月",@"12月"];
//    NSArray *dArr = @[@"01日",@"02日",@"03日",@"04日",@"05日",@"06日",@"07日",@"08日",@"09日",@"10日",@"11日",@"12日",@"13日",@"14日",@"15日",@"16日",@"17日",@"18日",@"19日",@"20日",@"21日",@"22日",@"23日",@"24日",@"25日",@"26日",@"27日",@"28日",@"29日",@"30日",@"31日"];
    NSMutableArray *dArr = [@[]mutableCopy];
    NSInteger range = [self getSumOfDaysInYear:[NSString stringWithFormat:@"%d",year] Month:@"01"];
    for (int i = 0; i<range; i++) {
        if(i<9){
            dArr[i] = [NSString stringWithFormat:@"0%d日",i+1];
        }else{
            dArr[i] = [NSString stringWithFormat:@"%d日",i+1];
        }
        
    }
    self.arr0 = yArr;
    self.arr1 = [mArr mutableCopy];
    self.arr2 = dArr;
    self.dataArr = @[self.arr0,self.arr1,self.arr2];
    self.returnArr = [@[@(50),@(0),@(0)]mutableCopy];
    
}
-(void)initYMDHMS{
    NSMutableArray *yArr = [@[]mutableCopy];
    int year = [[NSDate currentYear]intValue];
    
    for (int i = year; i<year+100; i++) {
        yArr[i-year] = [NSString stringWithFormat:@"%d年",i];
    }
    NSArray *mArr = @[@"01月",@"02月",@"03月",@"04月",@"05月",@"06月",@"07月",@"08月",@"09月",@"10月",@"11月",@"12月"];
    //    NSArray *dArr = @[@"01日",@"02日",@"03日",@"04日",@"05日",@"06日",@"07日",@"08日",@"09日",@"10日",@"11日",@"12日",@"13日",@"14日",@"15日",@"16日",@"17日",@"18日",@"19日",@"20日",@"21日",@"22日",@"23日",@"24日",@"25日",@"26日",@"27日",@"28日",@"29日",@"30日",@"31日"];
    NSMutableArray *dArr = [@[]mutableCopy];
    NSInteger range = [self getSumOfDaysInYear:[NSString stringWithFormat:@"%d",year] Month:@"01"];
    for (int i = 0; i<range; i++) {
        if(i<9){
            dArr[i] = [NSString stringWithFormat:@"0%d日",i+1];
        }else{
            dArr[i] = [NSString stringWithFormat:@"%d日",i+1];
        }
    }
    NSArray *hArr = @[@"00时",@"01时",@"02时",@"03时",@"04时",@"05时",@"06时",@"07时",@"08时",@"09时",@"10时",@"11时",@"12时",@"13时",@"14时",@"15时",@"16时",@"17时",@"18时",@"19时",@"20时",@"21时",@"22时",@"23时"];
    NSArray *fArr = @[@"00分",@"01分",@"02分",@"03分",@"04分",@"05分",@"06分",@"07分",@"08分",@"09分",@"10分",@"11分",@"12分",@"13分",@"14分",@"15分",@"16分",@"17分",@"18分",@"19分",@"20分",@"21分",@"22分",@"23分",@"24分",@"12分",@"25分",@"26分",@"27分",@"28分",@"29分",@"30分",@"31分",@"32分",@"33分",@"34分",@"35分",@"36分",@"37分",@"38分",@"39分",@"40分",@"41分",@"42分",@"43分",@"44分",@"45分",@"46分",@"47分",@"48分",@"49分",@"50分",@"51分",@"52分",@"53分",@"54分",@"55分",@"56分",@"57分",@"58分",@"59分"];
    NSArray *sArr = @[@"00秒",@"01秒",@"02秒",@"03秒",@"04秒",@"05秒",@"06秒",@"07秒",@"08秒",@"09秒",@"10秒",@"11秒",@"12秒",@"13秒",@"14秒",@"15秒",@"16秒",@"17秒",@"18秒",@"19秒",@"20秒",@"21秒",@"22秒",@"23秒",@"24秒",@"12秒",@"25秒",@"26秒",@"27秒",@"28秒",@"29秒",@"30秒",@"31秒",@"32秒",@"33秒",@"34秒",@"35秒",@"36秒",@"37秒",@"38秒",@"39秒",@"40秒",@"41秒",@"42秒",@"43秒",@"44秒",@"45秒",@"46秒",@"47秒",@"48秒",@"49秒",@"50秒",@"51秒",@"52秒",@"53秒",@"54秒",@"55秒",@"56秒",@"57秒",@"58秒",@"59秒"];
    self.arr0 = yArr;
    self.arr1 = [mArr mutableCopy];
    self.arr2 = dArr;
    self.arr3 = [hArr mutableCopy];
    self.arr4 = [fArr mutableCopy];
    self.arr5 = [sArr mutableCopy];
    self.dataArr = @[self.arr0,self.arr1,self.arr2,self.arr3,self.arr4,self.arr5];
    int month = [[NSDate currentMonth]intValue];
    int day = [[NSDate currentDay]intValue];
    int hour = [[NSDate currentHour]intValue];
    int min = [[NSDate currentMin]intValue];
    int second = [[NSDate currentSecond]intValue];
    _returnArr = [@[@(0),@(month-1),@(day-1),@(hour),@(min),@(second)]mutableCopy];
}
-(void)initCity:(NSArray*)cityArr{
    self.cityArr = [cityArr mutableCopy];
    for (int i = 0; i< self.cityArr.count; i++) {
        self.arr0[i] = self.cityArr[i][@"Name"];
    }
    for (int j = 0; j<((NSArray*)self.cityArr[0][@"Children"]).count; j++) {
        self.arr1[j] = self.cityArr[0][@"Children"][j][@"Name"];
    }
    for (int k = 0; k<((NSArray*)self.cityArr[0][@"Children"][0][@"Children"]).count; k++) {
        self.arr2[k] = self.cityArr[0][@"Children"][0][@"Children"][k][@"Name"];
    }
    self.dataArr = @[self.arr0,self.arr1,self.arr2];
    
    self.returnArr = [@[@(0),@(0),@(0)]mutableCopy];
}
-(void)configYMDWithRow:(NSInteger)row Component:(NSInteger)component{
    if (component==1 ||component==0) {
        NSMutableArray *dArr = [@[]mutableCopy];
        NSString *y = @"";
        NSString *m = @"";
        if (component == 0) {
            y = self.arr0[row];
            m = self.arr1[[self.returnArr[1]integerValue]];
        }else{
            y = self.arr0[[self.returnArr[0]integerValue]];
            m = self.arr1[row];
        }
        NSString *year = [y substringToIndex:y.length-1];
        NSString *month = [m substringToIndex:m.length-1];
        NSInteger range = [self getSumOfDaysInYear:year Month:month];
        for (int i = 0; i<range; i++) {
            if(i<9){
                dArr[i] = [NSString stringWithFormat:@"0%d日",i+1];
            }else{
                dArr[i] = [NSString stringWithFormat:@"%d日",i+1];
            }
            
        }
        self.dataArr = @[self.arr0,self.arr1,dArr];
        self.arr2 = dArr;
        [self.picker reloadComponent:2];
        [self.picker selectRow:0 inComponent:2 animated:YES];
        self.returnArr[2] = @(0);
    }
}
-(void)configYMDHMSWithRow:(NSInteger)row Component:(NSInteger)component{
    if (component==1 ||component==0) {
        NSMutableArray *dArr = [@[]mutableCopy];
        NSString *y = @"";
        NSString *m = @"";
        if (component == 0) {
            y = self.arr0[row];
            m = self.arr1[[self.returnArr[1]integerValue]];
        }else{
            y = self.arr0[[self.returnArr[0]integerValue]];
            m = self.arr1[row];
        }
        NSString *year = [y substringToIndex:y.length-1];
        NSString *month = [m substringToIndex:m.length-1];
        NSInteger range = [self getSumOfDaysInYear:year Month:month];
        for (int i = 0; i<range; i++) {
            if(i<9){
                dArr[i] = [NSString stringWithFormat:@"0%d日",i+1];
            }else{
                dArr[i] = [NSString stringWithFormat:@"%d日",i+1];
            }
            
        }
        self.dataArr = @[self.arr0,self.arr1,dArr,self.arr3,self.arr4,self.arr5];
        self.arr2 = dArr;
        [self.picker reloadComponent:2];
        [self.picker selectRow:0 inComponent:2 animated:YES];
        self.returnArr[2] = @(0);
    }
}
-(void)configCityWithRow:(NSInteger)row Component:(NSInteger)component{
    if (component==0) {
        NSMutableArray *c0Arr = [@[]mutableCopy];
        NSMutableArray *a0Arr = [@[]mutableCopy];
        for (int j = 0; j<((NSArray*)self.cityArr[[self.returnArr[0]integerValue]][@"Children"]).count; j++) {
            c0Arr[j] = self.cityArr[[self.returnArr[0]integerValue]][@"Children"][j][@"Name"];
        }
        for (int k = 0; k<((NSArray*)self.cityArr[[self.returnArr[0]integerValue]][@"Children"][0][@"Children"]).count; k++) {
            a0Arr[k] = self.cityArr[[self.returnArr[0]integerValue]][@"Children"][0][@"Children"][k][@"Name"];
        }
        
        self.dataArr = @[self.arr0,c0Arr,a0Arr];
        self.arr1 = c0Arr;
        self.arr2 = a0Arr;
        [self.picker reloadComponent:1];
        [self.picker reloadComponent:2];
        [self.picker selectRow:0 inComponent:1 animated:YES];
        [self.picker selectRow:0 inComponent:2 animated:YES];
        self.returnArr[1] = @(0);
        self.returnArr[2] = @(0);
    }else if(component==1){
        NSMutableArray *a0Arr = [@[]mutableCopy];
        for (int k = 0; k<((NSArray*)self.cityArr[[self.returnArr[0]integerValue]][@"Children"][[self.returnArr[1]integerValue]][@"Children"]).count; k++) {
            a0Arr[k] = self.cityArr[[self.returnArr[0]integerValue]][@"Children"][[self.returnArr[1]integerValue]][@"Children"][k][@"Name"];
        }
        
        self.dataArr = @[self.arr0,self.arr1,a0Arr];
        self.arr2 = a0Arr;
        [self.picker reloadComponent:2];
        [self.picker selectRow:0 inComponent:2 animated:YES];
        self.returnArr[2] = @(0);
    }
}
-(void)configSubviews{
    @WeakObj(self);
    [[self.bgBtn rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(__kindof UIControl * _Nullable x) {
        @StrongObj(self);
        [self cancelAction];
    }];
    [[self.cancelBtn rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(__kindof UIControl * _Nullable x) {
        @StrongObj(self);
        [self cancelAction];
        
    }];
    [[self.completeBtn rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(__kindof UIControl * _Nullable x) {
        @StrongObj(self);
        if (self.completeSelectBlock) {
            self.completeSelectBlock(x, self.returnArr, self.desLabel.text);
        }
    }];
    
    self.picker.delegate = self;
    self.picker.dataSource = self;
    NSString *title = @"";
    for (int i = 0; i<self.dataArr.count; i++) {
        //self.returnArr[i] = @(0);
        [self.picker selectRow:[self.returnArr[i] integerValue] inComponent:i animated:NO];
        title = [NSString stringWithFormat:@"%@%@",title,self.dataArr[i][[self.returnArr[i] integerValue]]];
    }
    self.desLabel.text = title;
}
-(void)cancelAction{
    if (self.cancelSelectBlock) {
        self.cancelSelectBlock();
    }
//    [self.view removeFromSuperview];
//    [self removeFromParentViewController];
}
-(void)configTitle{
    NSString * title = @"";
    
    for (int i = 0; i<self.dataArr.count; i++) {
        title = [NSString stringWithFormat:@"%@%@",title,self.dataArr[i][[self.returnArr[i] integerValue]]];
    }
    self.desLabel.text = title;
}
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return self.dataArr.count;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return self.dataArr[component].count;
}
- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component __TVOS_PROHIBITED{
    return self.dataArr[component][row];
}
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    
    UILabel* pickerLabel = (UILabel*)view;
    
    if (!pickerLabel){
        
        pickerLabel = [[UILabel alloc] init];
        
        // Setup label properties - frame, font, colors etc
        
        //adjustsFontSizeToFitWidth property to YES
        
        pickerLabel.adjustsFontSizeToFitWidth = YES;
        
        [pickerLabel setTextAlignment:NSTextAlignmentCenter];
        
        [pickerLabel setBackgroundColor:[UIColor clearColor]];
        
        [pickerLabel setFont:[UIFont boldSystemFontOfSize:15]];
        
    }
    
    // Fill the label text here
    
    pickerLabel.text=self.dataArr[component][row];
    
    return pickerLabel;
    
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component __TVOS_PROHIBITED{
    self.returnArr[component] = @(row);
    if (self.titleSelectBlock) {
        self.titleSelectBlock(pickerView, row, component);
    }
    if (self.type == JHPickerTypeCity) {
        [self configCityWithRow:row Component:component];
    }else if (self.type == JHPickerTypeYMD){
        [self configYMDWithRow:row Component:component];
    }else if (self.type == JHPickerTypeYMDHMS){
        [self configYMDHMSWithRow:row Component:component];
    }
    
    
    
    [self configTitle];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
