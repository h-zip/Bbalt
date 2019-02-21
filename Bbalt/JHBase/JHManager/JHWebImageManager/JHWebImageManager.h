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

- (nullable id <SDWebImageOperation>)loadImageWithURL:(nullable NSString *)url
                                             progress:(nullable SDWebImageDownloaderProgressBlock)progressBlock
                                            completed:(nullable SDInternalCompletionBlock)completedBlock;

- (void)diskImageExistsForURL:(nullable NSString *)url
                   completion:(nullable SDWebImageCheckCacheCompletionBlock)completionBlock;

- (NSString*)cathePathForURL:(nullable NSString *)url;

- (NSString*)catheKeyForURL:(nullable NSString *)url;

- (void)storeImage:(nullable UIImage *)image
            forURL:(nullable NSString *)url
            toDisk:(BOOL)toDisk
        completion:(nullable SDWebImageNoParamsBlock)completionBlock;

- (void)removeImageforURL:(nullable NSString *)url
                   fromDisk:(BOOL)fromDisk
               completion:(nullable SDWebImageNoParamsBlock)completionBlock;
@end

NS_ASSUME_NONNULL_END
