//
//  BYDeviceTool.h
//  OwnerLoan
//
//  Created by user on 2018/5/3.
//  Copyright © 2018年 user. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BYDeviceTool : NSObject
//判断相机权限
+(BOOL)hasPowerOfCamera;

//判断相册权限
+(BOOL)hasPowerOfLibrary;
@end
