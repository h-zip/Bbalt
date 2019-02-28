//
//  JHConstant.h
//  Test
//
//  Created by bory on 2018/5/7.
//  Copyright © 2018年 hans. All rights reserved.
//

#ifndef JHConstant_h
#define JHConstant_h


#define JPushKey @"xxxxxxxxxxxxxxxxxxxxxxxx"
#define BuglyKey @"xxxxxxxxxx"
#define Ali_RESULT_NOTIFICATION @"Ali_RESULT_NOTIFICATION"

//单例
#define AppDelegateInstance [UIApplication sharedApplication].delegate
#define JHNaviInstance [JHNaviManager share]
#define JHJPushInstance [JHJPushManager share]
#define JHShareInstance [JHShareManager share]
#define JHUserInstance [JHUserManager share]
#define JHWebImageInstance [JHWebImageManager share]
#define JHDecimalInstance [JHDecimalManager share]
#define JHGlobalInstance [JHGlobal share]
#define JHLayoutInstance [JHLayoutManager share]
#define JHFactoryInstance [JHFactoryManager share]
#define JHBrowserInstance [JHBrowserManager share]
#define JHDebugInstance [JHDebugManager share]
#define JHH5Instance [JHH5Manager share]
//尺寸
#define kSCREEN_H    [[UIScreen mainScreen] bounds].size.height
#define kSCREEN_W    [[UIScreen mainScreen] bounds].size.width
#define kTopSafeInsert JHGlobalInstance.safeareas.insets.top
#define kBottomSafeInsert JHGlobalInstance.safeareas.insets.bottom
#define kDevice_Is_iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
#define kStatusBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height //状态栏高度
#define kNavBarHeight 44.0
#define kTabBarHeight ([[UIApplication sharedApplication] statusBarFrame].size.height>20?83:49) //底部tabbar高度
#define kTopHeight (kTopSafeInsert + kNavBarHeight) //整个导航栏高度
#define kBottomHeight kBottomSafeInsert
// 弱引用相关
#define WeakObj(o) autoreleasepool{} __weak typeof(o) o##Weak = o;
#define StrongObj(o) autoreleasepool{} __strong typeof(o) o = o##Weak;

//TODO
#define STRINGIFY(S) #S
#define DEFER_STRINGIFY(S) STRINGIFY(S)
#define PRAGMA_MESSAGE(MSG) _Pragma(STRINGIFY(message(MSG)))
#define FORMATTED_MESSAGE(MSG) "[TODO-" DEFER_STRINGIFY(__COUNTER__) "] " MSG " \n" \
DEFER_STRINGIFY(__FILE__) " line " DEFER_STRINGIFY(__LINE__)
#define KEYWORDIFY try {} @catch (...) {}
// 最终使用下面的宏
#define TODO(MSG) KEYWORDIFY PRAGMA_MESSAGE(FORMATTED_MESSAGE(MSG))

//Image
#define RImage(name) [[R image]name]

//String
#define RString(string) [[[R string]localizable]string]

//MutableString
#define MutableString(string) [[NSMutableAttributedString alloc]initWithString:string]
#define MutableStringAttr(string,attr) [[NSMutableAttributedString alloc]initWithString:string attributes:attr]
#endif /* JHConstant_h */
