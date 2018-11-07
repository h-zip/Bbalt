//
//  JHRegistAVC.h
//  Xinxy
//
//  Created by bory on 2018/4/26.
//  Copyright © 2018年 hans. All rights reserved.
//

#import "JHBaseVC.h"
#import "JHButton.h"
#import "JHTextField.h"
#import "NSString+Verification.h"
@interface JHRegistAVC : JHBaseVC
@property (weak, nonatomic) IBOutlet JHTextField *phoneTF;
@property (weak, nonatomic) IBOutlet JHButton *verificateBtn;
@property (weak, nonatomic) IBOutlet JHTextField *verificateTF;
@property (weak, nonatomic) IBOutlet JHButton *nextBtn;

@property(nonatomic,strong)NSString* phone;
@property(nonatomic,strong)NSString* verificate;
@end
