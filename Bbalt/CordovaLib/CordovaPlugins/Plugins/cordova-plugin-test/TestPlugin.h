//
//  DZFPlugin.h
//  DZFPluginDemo
//
//  Created by 钱海超 on 16/7/1.
//
//

#import <Cordova/CDV.h>

@interface TestPlugin : CDVPlugin
/**
 *  test1
 */
- (void)test1:(CDVInvokedUrlCommand *)command;
/**
 *  test2
 */
- (void)test2:(CDVInvokedUrlCommand *)command;
@end
