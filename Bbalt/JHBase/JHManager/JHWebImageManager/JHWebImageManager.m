//
//  JHWebImageManager.m
//  Bbalt
//
//  Created by bory on 2019/1/28.
//  Copyright © 2019年 hans. All rights reserved.
//

#import "JHWebImageManager.h"
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
@end
