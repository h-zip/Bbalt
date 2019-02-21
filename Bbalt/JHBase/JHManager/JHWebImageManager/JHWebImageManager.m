//
//  JHWebImageManager.m
//  Bbalt
//
//  Created by bory on 2019/1/28.
//  Copyright © 2019年 hans. All rights reserved.
//

#import "JHWebImageManager.h"
@interface JHWebImageManager()
@property(nonatomic,strong)SDWebImageManager *manager;
@end
@implementation JHWebImageManager
+(instancetype)share{
    static JHWebImageManager *_JHWebImageManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _JHWebImageManager = [[self alloc]init];
    });
    return _JHWebImageManager;
}
-(instancetype)init{
    if (self = [super init]) {
        self.manager = [SDWebImageManager sharedManager];
    }
    return self;
}
-(void)configImageView:(UIImageView*)imageView
               WithUrl:(NSString*)url
             completed:(nullable SDExternalCompletionBlock)completedBlock{
    imageView.image = [UIImage new];
    imageView.sd_imageTransition = [SDWebImageTransition fadeTransition];
    [imageView sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage new] options:0 completed:completedBlock];
}
- (nullable id <SDWebImageOperation>)loadImageWithURL:(nullable NSString *)url
                                             progress:(nullable SDWebImageDownloaderProgressBlock)progressBlock
                                            completed:(nullable SDInternalCompletionBlock)completedBlock{
    NSURL *u = [NSURL URLWithString:url];
    return [self.manager loadImageWithURL:u options:0 progress:progressBlock completed:completedBlock];
}
- (void)diskImageExistsForURL:(nullable NSString *)url
                   completion:(nullable SDWebImageCheckCacheCompletionBlock)completionBlock{
    NSURL *u = [NSURL URLWithString:url];
    [self.manager diskImageExistsForURL:u completion:completionBlock];
    
}
-(NSString*)cathePathForURL:(nullable NSString *)url{
    NSURL *u = [NSURL URLWithString:url];
    NSString *cacheImageKey = [self.manager cacheKeyForURL:u];
    NSString *cacheImagePath = [[SDImageCache sharedImageCache] defaultCachePathForKey:cacheImageKey];
    return cacheImagePath;
}
-(NSString*)catheKeyForURL:(nullable NSString *)url{
    NSURL *u = [NSURL URLWithString:url];
    NSString *cacheImageKey = [self.manager cacheKeyForURL:u];
    return cacheImageKey;
}
- (void)storeImage:(nullable UIImage *)image
            forURL:(nullable NSString *)url
            toDisk:(BOOL)toDisk
        completion:(nullable SDWebImageNoParamsBlock)completionBlock{
    NSString *k = [self catheKeyForURL:url];
    [self.manager.imageCache storeImage:image forKey:k toDisk:toDisk completion:completionBlock];
}
- (void)removeImageforURL:(nullable NSString *)url
                   fromDisk:(BOOL)fromDisk
               completion:(nullable SDWebImageNoParamsBlock)completionBlock{
    NSString *k = [self catheKeyForURL:url];
    [self.manager.imageCache removeImageForKey:k fromDisk:fromDisk withCompletion:completionBlock];
}
@end
