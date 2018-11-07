//
//  JHLoginVC.h
//  Xinxy
//
//  Created by bory on 2018/4/25.
//  Copyright © 2018年 hans. All rights reserved.
//

#import "JHBaseVC.h"
#import "JHButton.h"
#import "JHTextField.h"
#import "NSString+Verification.h"
@interface JHLoginVC : JHBaseVC
@property (weak, nonatomic) IBOutlet JHTextField *accountTF;
@property (weak, nonatomic) IBOutlet JHTextField *pswTF;

@property (weak, nonatomic) IBOutlet JHButton *loginBtn;

@property (weak, nonatomic) IBOutlet JHButton *registBtn;
@property (weak, nonatomic) IBOutlet JHButton *forgotBtn;

@property(nonatomic,strong)NSString* account;
@property(nonatomic,strong)NSString* psw;
@end
