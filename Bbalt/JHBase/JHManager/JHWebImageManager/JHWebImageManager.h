//
//  JHWebImageManager.h
//  Bbalt
//
//  Created by bory on 2019/1/28.
//  Copyright © 2019年 hans. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import <SDWebImage/UIView+WebCache.h>
#import <SDWebImage/SDWebImageTransition.h>
NS_ASSUME_NONNULL_BEGIN

@interface JHWebImageManager : NSObject
+(instancetype)share;
-(void)configImageView:(UIImageView*)imageView
               WithUrl:(NSString*)url
             completed:(nullable SDExternalCompletionBlock)completedBlock;
@end

NS_ASSUME_NONNULL_END
