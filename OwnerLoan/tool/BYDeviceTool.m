//
//  BYDeviceTool.m
//  OwnerLoan
//
//  Created by user on 2018/5/3.
//  Copyright © 2018年 user. All rights reserved.
//

#import "BYDeviceTool.h"
#import <AVFoundation/AVFoundation.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import <Photos/Photos.h>
#define BY_CAMERAPOWER_MSG @"请在iPhone的“设置-隐私-相机”选项中，允许业主贷访问你的手机相机"
#define BY_LIBRARYPOWER_MSG @"请在iPhone的“设置-隐私-照片”选项中，允许业主贷访问你的手机照片"


@implementation BYDeviceTool
//判断相机权限
+(BOOL)hasPowerOfCamera{

    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];// 获取对摄像头的访问权限。
    
    if(authStatus == AVAuthorizationStatusRestricted || authStatus == AVAuthorizationStatusDenied){
        [BYDeviceTool dealPowerWithMessage:BY_CAMERAPOWER_MSG];
        return NO;
    }else if(authStatus == AVAuthorizationStatusAuthorized){
        return YES;
    }else if (authStatus == AVAuthorizationStatusNotDetermined){
        [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
            if (granted) {
                NSLog(@"Authorized");
            }else{
                NSLog(@"Denied or Restricted");
            }
        }];
        
        return NO;
    }
    
    return NO;
}

//判断相册权限
+(BOOL)hasPowerOfLibrary{
    
    PHAuthorizationStatus photoAuthorStatus = [PHPhotoLibrary authorizationStatus];
    if (photoAuthorStatus == PHAuthorizationStatusRestricted || photoAuthorStatus == PHAuthorizationStatusDenied) {
        [BYDeviceTool dealPowerWithMessage:BY_LIBRARYPOWER_MSG];
        return NO;
    }else if(photoAuthorStatus == PHAuthorizationStatusAuthorized){
        return YES;
    }else if (photoAuthorStatus ==PHAuthorizationStatusNotDetermined){
        [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
            if (status == PHAuthorizationStatusAuthorized) {
                NSLog(@"Authorized");
            }else{
                NSLog(@"Denied or Restricted");
            }
        }];
        return NO;
    }
    
    return NO;
//    ALAuthorizationStatus authStatus = [ALAssetsLibrary authorizationStatus];
//    if(authStatus == ALAuthorizationStatusRestricted || authStatus == ALAuthorizationStatusDenied) {
//
//        return NO;
//    }else{
//        return YES;
//    }
    
    
    
}



+(void)dealPowerWithMessage:(NSString *)message{
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"提醒" message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    UIAlertAction *ensureAction = [UIAlertAction actionWithTitle:@"设置" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSURL * url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
        if([[UIApplication sharedApplication] canOpenURL:url]) {
            NSURL*url =[NSURL URLWithString:UIApplicationOpenSettingsURLString];
            [[UIApplication sharedApplication] openURL:url];
        }
    }];
    [alertVC addAction:cancelAction];
    [alertVC addAction:ensureAction];
    
    [[BYCommon shareBYCommon].rootVC presentViewController:alertVC animated:YES completion:NULL];
}
@end
