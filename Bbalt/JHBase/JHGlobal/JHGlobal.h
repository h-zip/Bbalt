//
//  JHGlobal.h
//  Bbalt
//
//  Created by bory on 2019/1/21.
//  Copyright © 2019年 hans. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@interface JHFontSize: NSObject
/** 10px */
@property(nonatomic,assign)CGFloat ss;
/** 11px */
@property(nonatomic,assign)CGFloat s;
/** 12px */
@property(nonatomic,assign)CGFloat m;
/** 13px */
@property(nonatomic,assign)CGFloat l;
/** 14px */
@property(nonatomic,assign)CGFloat ll;
@end
@interface JHColor: NSObject
/** #00d0cc-alpha 1 */
@property(nonatomic,strong)UIColor *red_light_0;
/** #00d0cc-alpha 1 */
@property(nonatomic,strong)UIColor *red_light_1;
/** #00d0cc-alpha 1 */
@property(nonatomic,strong)UIColor *red_dark_0;
/** #00d0cc-alpha 1 */
@property(nonatomic,strong)UIColor *red_dark_1;
@end
@interface JHFont: NSObject
/** system-ss-regular */
@property(nonatomic,strong)UIFont *system_ss_regular;
/** PingFang-ss-semibold */
@property(nonatomic,strong)UIFont *pingfang_ss_semibold;
@end

@interface JHAttributes: NSObject
/** PingFang-ss-semibold-#00d0cc-alpha 1 */
@property(nonatomic,strong)NSDictionary *pingfang_red_light_0;
@end
@interface JHSafeArea: NSObject
@property(nonatomic,assign)UIEdgeInsets insets;
@end
@interface JHGlobal : NSObject
+(instancetype)share;
@property(nonatomic,strong)JHFontSize *fontsizes;
@property(nonatomic,strong)JHColor *colors;
@property(nonatomic,strong)JHFont *fonts;
@property(nonatomic,strong)JHAttributes *attributes;
@property(nonatomic,strong)JHSafeArea *safeareas;
@end
NS_ASSUME_NONNULL_END
