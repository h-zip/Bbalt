#import "R.h"


@implementation RLocalizableStrings
- (NSString*)_1Red0 { return NSLocalizedStringFromTable(@"_1_red_0", @"Localizable", nil); }
- (NSString*)_2cs { return NSLocalizedStringFromTable(@"_2cs", @"Localizable", nil); }
@end


@interface RStrings ()
@property (nonatomic, strong) RLocalizableStrings* localizable;
@end

@implementation RStrings

- (RLocalizableStrings*)localizable
{
	if (!_localizable)
	{
		_localizable = [RLocalizableStrings new];
	}
	return _localizable;
}

@end


@interface RImages ()
@property (nonatomic, strong) UIImage* commonNoData;
@property (nonatomic, strong) UIImage* commonLoading2;
@property (nonatomic, strong) UIImage* commonNoWifi;
@property (nonatomic, strong) UIImage* commonSearchGray;
@property (nonatomic, strong) UIImage* commonLoading1;
@end

@implementation RImages
- (UIImage*)commonNoData { return [UIImage imageNamed:@"common_no_data"]; }
- (UIImage*)commonLoading2 { return [UIImage imageNamed:@"common_loading_2"]; }
- (UIImage*)commonNoWifi { return [UIImage imageNamed:@"common_no_wifi"]; }
- (UIImage*)commonSearchGray { return [UIImage imageNamed:@"common_search_gray"]; }
- (UIImage*)commonLoading1 { return [UIImage imageNamed:@"common_loading_1"]; }
@end


@interface R ()
@property (nonatomic, strong) RStrings* string;
@property (nonatomic, strong) RImages* image;
@end

@implementation R

+ (instancetype)sharedInstance
{	 
	static dispatch_once_t pred;
 	static id sharedInstance_ = nil;
 
 	dispatch_once(&pred, ^{
 		sharedInstance_ = [[self alloc] init];
 	});
 
 	return sharedInstance_;

}

+ (RStrings*)string { return [[R sharedInstance] string]; }
+ (RImages*)image { return [[R sharedInstance] image]; }

- (RStrings*)string
{
	if (!_string)
	{
		_string = [RStrings new];
	}
	return _string;
}

- (RImages*)image
{
	if (!_image)
	{
		_image = [RImages new];
	}
	return _image;
}

@end


