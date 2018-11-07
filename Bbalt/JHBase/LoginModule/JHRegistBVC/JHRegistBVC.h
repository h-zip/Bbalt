//
//  JHRegistBVC.h
//  Xinxy
//
//  Created by bory on 2018/4/26.
//  Copyright © 2018年 hans. All rights reserved.
//

#import "JHBaseVC.h"
#import "JHButton.h"
#import "JHTextField.h"
#import "NSString+Verification.h"
@interface JHRegistBVC : JHBaseVC
@property (weak, nonatomic) IBOutlet JHTextField *PswTF;
@property (weak, nonatomic) IBOutlet JHTextField *confirmTF;
@property (weak, nonatomic) IBOutlet JHButton *sendBtn;

@property (nonatomic,strong)NSString *psw;
@property (nonatomic,strong)NSString *confirmPsw;

@property(nonatomic,strong)NSString* phone;
@property(nonatomic,strong)NSString* verificate;
@end
