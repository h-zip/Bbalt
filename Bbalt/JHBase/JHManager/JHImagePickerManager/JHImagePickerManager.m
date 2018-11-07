//
//  JHImagePickerManager.m
//  Xinxy
//
//  Created by bory on 2017/12/1.
//  Copyright © 2017年 hans. All rights reserved.
//

#import "JHImagePickerManager.h"
@interface JHImagePickerManager()<UINavigationControllerDelegate,UIImagePickerControllerDelegate>
@end
@implementation JHImagePickerManager
+(instancetype)shareInstanceWithFinishSelectBlock:(FinishSelectBlock)finishSelectBlock
                                      CancelBlock:(CancelBlock)cancelBlock{
    static JHImagePickerManager *_imagePickerManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _imagePickerManager = [[self alloc]init];
    });
    _imagePickerManager.finishSelectBlock = finishSelectBlock;
    _imagePickerManager.cancelBlock = cancelBlock;
    
    return _imagePickerManager;
}
-(UIImagePickerController*)pickerFromPhotoLib:(BOOL)allowEdit{
    UIImagePickerController * imagepicker = nil;
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeSavedPhotosAlbum]){

        imagepicker = [[UIImagePickerController alloc] init];
        imagepicker.delegate = self;
        imagepicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        imagepicker.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
        imagepicker.allowsEditing = allowEdit;
    }
    return imagepicker;
    //[self presentModalViewController:imagepicker animated:YES];
}
-(UIImagePickerController*)pickerFromCameraSource:(BOOL)allowEdit{
    UIImagePickerController * imagepicker = nil;
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
        
        imagepicker = [[UIImagePickerController alloc] init];
        imagepicker.delegate = self;
        imagepicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        imagepicker.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
        imagepicker.allowsEditing = allowEdit;
       
    }
    return imagepicker;
}
-(void)openPhotoLibVC:(UIViewController *)vc CanEdit:(BOOL)canEdit{
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeSavedPhotosAlbum]){
        //相册权限
        
        PHAuthorizationStatus author = [PHPhotoLibrary authorizationStatus];
        
        if (author == PHAuthorizationStatusRestricted || author == PHAuthorizationStatusDenied){
            //无权限 引导去开启
            [JHHudManager showAlertWithTitle:@"提示" Message:@"您没有打开相册的权限,请前往设置权限" BtnStr:@"设置" Completeion:^{
                NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
                if ([[UIApplication sharedApplication] canOpenURL:url]) {
                    [[UIApplication sharedApplication] openURL:url];
                }
            } Controller:vc];
        }else if(author == PHAuthorizationStatusNotDetermined){
            [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
                if (status == PHAuthorizationStatusAuthorized) {
                    
                    UIImagePickerController *imagepicker = [[UIImagePickerController alloc] init];
                    imagepicker.delegate = self;
                    imagepicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                    imagepicker.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
                    imagepicker.allowsEditing = canEdit;
                    [vc presentViewController:imagepicker animated:YES completion:nil];
                    
                } else if (status == PHAuthorizationStatusDenied || PHAuthorizationStatusRestricted) {
                    [JHHudManager showAlertWithTitle:@"提示" Message:@"您没有打开相册的权限,请前往设置权限" BtnStr:@"设置" Completeion:^{
                        NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
                        if ([[UIApplication sharedApplication] canOpenURL:url]) {
                            [[UIApplication sharedApplication] openURL:url];
                        }
                    } Controller:vc];
                }
            }];
        }else if(author == PHAuthorizationStatusAuthorized){
            UIImagePickerController *imagepicker = [[UIImagePickerController alloc] init];
            imagepicker.delegate = self;
            imagepicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            imagepicker.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
            imagepicker.allowsEditing = canEdit;
            [vc presentViewController:imagepicker animated:YES completion:nil];
        }
    }else{
        [JHHudManager showAlertWithTitle:@"提示" Message:@"不支持该硬件" Controller:vc];
    }
}
-(void)opennCamera:(UIViewController *)vc CanEdit:(BOOL)canEdit{
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
        //相机权限
        AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
        if (authStatus ==AVAuthorizationStatusRestricted ||//此应用程序没有被授权访问的照片数据。可能是家长控制权限
            authStatus ==AVAuthorizationStatusDenied)  //用户已经明确否认了这一照片数据的应用程序访问
        {
            // 无权限 引导去开启
            [JHHudManager showAlertWithTitle:@"提示" Message:@"您没有打开相机的权限,请前往设置权限" BtnStr:@"设置" Completeion:^{
                NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
                if ([[UIApplication sharedApplication] canOpenURL:url]) {
                    [[UIApplication sharedApplication] openURL:url];
                }
            } Controller:vc];
        }else if(authStatus == AVAuthorizationStatusNotDetermined){
            [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
                if (granted) {
                    UIImagePickerController *imagepicker = [[UIImagePickerController alloc] init];
                    imagepicker.delegate = self;
                    imagepicker.sourceType = UIImagePickerControllerSourceTypeCamera;
                    imagepicker.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
                    imagepicker.allowsEditing = canEdit;
                    [vc presentViewController:imagepicker animated:YES completion:nil];
                } else {
                    [JHHudManager showAlertWithTitle:@"提示" Message:@"您没有打开相机的权限,请前往设置权限" BtnStr:@"设置" Completeion:^{
                        NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
                        if ([[UIApplication sharedApplication] canOpenURL:url]) {
                            [[UIApplication sharedApplication] openURL:url];
                        }
                    } Controller:vc];
                }
            }];
        }else if(authStatus == AVAuthorizationStatusAuthorized){
            UIImagePickerController *imagepicker = [[UIImagePickerController alloc] init];
            imagepicker.delegate = self;
            imagepicker.sourceType = UIImagePickerControllerSourceTypeCamera;
            imagepicker.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
            imagepicker.allowsEditing = canEdit;
            [vc presentViewController:imagepicker animated:YES completion:nil];
        }
    }else{
        [JHHudManager showAlertWithTitle:@"提示" Message:@"不支持该硬件" Controller:vc];
    }
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    if (self.finishSelectBlock) {
        UIImage *image = nil;
        if (picker.allowsEditing) {
            image = [info valueForKey:UIImagePickerControllerEditedImage];
        }else{
            image = [[info valueForKey:UIImagePickerControllerOriginalImage] normalizedImage];
        }
        self.finishSelectBlock(picker,image);
    }
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    if (self.cancelBlock) {
        self.cancelBlock(picker);
    }
}
@end
