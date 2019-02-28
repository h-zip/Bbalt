//
//  JHH5Manager.m
//  Bbalt
//
//  Created by bory on 2019/2/28.
//  Copyright © 2019年 hans. All rights reserved.
//

#import "JHH5Manager.h"
#import "SSZipArchive.h"
@implementation JHH5Manager
+(instancetype)share{
    static JHH5Manager *_JHH5Manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _JHH5Manager = [[self alloc]init];
    });
    return _JHH5Manager;
}
-(instancetype)init{
    if (self = [super init]) {
    }
    return self;
}
-(void)downloadH5FileWithURL:(NSString*)url
           completionHandler:(void (^)(void))completionHandler{
    NSURL*URL = [NSURL URLWithString:CombileUrl(url)];
    //默认配置
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration ephemeralSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    //请求
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    NSURLSessionDownloadTask* downloadTask = [manager downloadTaskWithRequest:request progress:nil destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        return [NSURL fileURLWithPath:JH_H5ZipPath];
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        [manager invalidateSessionCancelingTasks:NO];
        NSLog(@"%@",[filePath path]);
        void (^unzipBlock)(void) = ^void () {
            BOOL success = [self unzipFileAtPath:JH_H5ZipPath toDestination:JH_H5FolderPath completionHandler:^(NSString * _Nonnull path, BOOL succeeded, NSError * _Nullable error) {
                if (succeeded) {
                    [[NSFileManager defaultManager]removeItemAtPath:JH_H5ZipPath error:nil];
                    completionHandler();
                }
            }];
            NSLog(@"%d",success);
        };
        if ([[NSFileManager defaultManager]fileExistsAtPath:JH_H5FolderNamePath]) {
            [self removeFolderCompletionHandler:^{
                unzipBlock();
            }];
        }else{
            unzipBlock();
        }
    }];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [downloadTask resume];
    });
}
-(BOOL)unzipFileAtPath:(NSString *)path
         toDestination:(NSString *)destination
     completionHandler:(void (^_Nullable)(NSString *path, BOOL succeeded, NSError * _Nullable error))completionHandler{
    return [SSZipArchive unzipFileAtPath:path toDestination:destination progressHandler:nil completionHandler:completionHandler];
}
-(void)removeFolderCompletionHandler:(void (^)(void))completionHandler{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *documentsDirectory = JH_H5FolderNamePath;
    
    NSArray *contents = [fileManager contentsOfDirectoryAtPath:documentsDirectory error:NULL];
    NSEnumerator *e = [contents objectEnumerator];
    NSString *filename;
    while ((filename = [e nextObject])) {
        [fileManager removeItemAtPath:[documentsDirectory stringByAppendingPathComponent:filename] error:NULL];
    }
    completionHandler();
}
@end
