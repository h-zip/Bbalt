#import <UIKit/UIKit.h>

@interface RLocalizableStrings: NSObject
/**
key: "_100d0cc"

en: "#00D0CC"
*/
- (NSString*)_100d0cc;
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
- (UIImage*)commonLoading1;
@end


@interface R: NSObject
+ (RStrings*)string;
+ (RImages*)image;
@end


