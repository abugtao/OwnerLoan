//
//  BYFileTool.h
//  OwnerLoan
//
//  Created by user on 2018/5/4.
//  Copyright © 2018年 user. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BYFileTool : NSObject
/**
 获取网络请求日志存储路径
 */
+(NSString *)getRequestArrayPath;
//保存请求日志
+(void)saveRequestLogWith:(NSString *)str;
@end
