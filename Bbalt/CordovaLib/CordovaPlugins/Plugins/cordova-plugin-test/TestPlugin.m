//
//  DZFPlugin.m
//  DZFPluginDemo
//
//  Created by 钱海超 on 16/7/1.
//
//

#import "TestPlugin.h"
//#import "LoginViewController.h"

@implementation TestPlugin

/**
 *  test1
 */
- (void)test1:(CDVInvokedUrlCommand *)command {
  CDVPluginResult *pluginResult = nil;
  NSString *echo = [command.arguments objectAtIndex:0];

  if (echo != nil && [echo length] > 0) {
    pluginResult =
      [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
  } else {
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
  }

  [self.commandDelegate sendPluginResult:pluginResult
                              callbackId:command.callbackId];



}
/**
 *  退出登录
 */
- (void)test2:(CDVInvokedUrlCommand *)command {
//  CDVPluginResult *pluginResult = nil;
//  NSString *echo = [command.arguments objectAtIndex:0];
//
//  if (echo != nil && [echo length] > 0) {
//
//    LoginViewController *loginVC = [[LoginViewController alloc] init];
//    UINavigationController *nav =
//        [[UINavigationController alloc] initWithRootViewController:loginVC];
//    [self presentViewController:nav animated:YES completion:nil];
//
//    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK
//                                     messageAsString:echo];
//  } else {
//    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
//  }
//
//  [self.commandDelegate sendPluginResult:pluginResult
//                              callbackId:command.callbackId];

    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"js调ios原生代码" message:@"退出登录" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
    [alert show];
}

@end
