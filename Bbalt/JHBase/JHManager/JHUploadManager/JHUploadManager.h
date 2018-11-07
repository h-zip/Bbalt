//
//  JHUploadManager.h
//  Xinxy
//
//  Created by bory on 2017/12/1.
//  Copyright © 2017年 hans. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^ResponseBlock)(NSString *key, NSDictionary *resp);
typedef void (^ErrorBlock)(NSError *error);
@interface JHUploadManager : NSObject
+(instancetype)shareInstance;
- (void)putData:(NSData *)data
      WithToken:(NSString*)token
  ResponseBlock:(ResponseBlock)responseBlock
     ErrorBlock:(ErrorBlock)errorBlock;
@end
