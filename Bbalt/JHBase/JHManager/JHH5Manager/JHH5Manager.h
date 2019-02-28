//
//  JHH5Manager.h
//  Bbalt
//
//  Created by bory on 2019/2/28.
//  Copyright © 2019年 hans. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
#define JH_H5ZipPath [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"H5.zip"]
#define JH_H5FolderPath [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject]
#define JH_H5FolderNamePath [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"www"]
#define JH_H5IndexPath [JH_H5FolderNamePath stringByAppendingPathComponent:@"index.html"]
@interface JHH5Manager : NSObject
+(instancetype)share;
-(void)downloadH5FileWithURL:(NSString*)url
           completionHandler:(void (^)(void))completionHandler;
-(BOOL)unzipFileAtPath:(NSString *)path
                 toDestination:(NSString *)destination
             completionHandler:(void (^_Nullable)(NSString *path, BOOL succeeded, NSError * _Nullable error))completionHandler;
@end

NS_ASSUME_NONNULL_END
