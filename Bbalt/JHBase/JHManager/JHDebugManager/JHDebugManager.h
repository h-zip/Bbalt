//
//  JHDebugManager.h
//  Ubtms-boss
//
//  Created by hjh on 17/7/24.
//  Copyright © 2017年 com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef void (^DebugCallback)(void);
@interface JHDebugManager : NSObject
+(instancetype)shareInstance;
-(BOOL)debugMode;
-(UIAlertController*)chooseHostAlertViewController;
-(void)configDebugCallback:(DebugCallback)debugCallback;
@end
