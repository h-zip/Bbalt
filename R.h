#import <UIKit/UIKit.h>

@interface RLocalizableStrings: NSObject
/**
key: "_1_red_0"

en: "#00D0CC"
*/
- (NSString*)_1Red0;
/**
key: "_2cs"

en: "test"
*/
- (NSString*)_2cs;
@end


@interface RStrings: NSObject
- (RLocalizableStrings*)localizable;
@end


@interface RImages: NSObject
- (UIImage*)commonNoData;
- (UIImage*)commonLoading2;
- (UIImage*)commonNoWifi;
- (UIImage*)commonSearchGray;
- (UIImage*)commonLoading1;
@end


@interface R: NSObject
+ (RStrings*)string;
+ (RImages*)image;
@end


