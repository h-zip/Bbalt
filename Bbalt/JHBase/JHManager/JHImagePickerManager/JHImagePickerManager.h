//
//  JHImagePickerManager.h
//  Xinxy
//
//  Created by bory on 2017/12/1.
//  Copyright © 2017年 hans. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import<AVFoundation/AVCaptureDevice.h>
#import <AVFoundation/AVMediaFormat.h>
#import<Photos/PHPhotoLibrary.h>
#import<CoreLocation/CoreLocation.h>
#import "UIImage+Resize.h"
typedef void (^FinishSelectBlock)(UIImagePickerController *picker,UIImage *image);
typedef void (^CancelBlock)(UIImagePickerController *picker);
@interface JHImagePickerManager : NSObject
@property(nonatomic,copy)FinishSelectBlock finishSelectBlock;
@property(nonatomic,copy)CancelBlock cancelBlock;
+(instancetype)shareInstanceWithFinishSelectBlock:(FinishSelectBlock)FinishSelectBlock
                                      CancelBlock:(CancelBlock)cancelBlock;

-(void)openPhotoLibVC:(UIViewController *)vc CanEdit:(BOOL)canEdit;
-(void)opennCamera:(UIViewController *)vc CanEdit:(BOOL)canEdit;
@end
