//
//  BYFileTool.m
//  OwnerLoan
//
//  Created by user on 2018/5/4.
//  Copyright © 2018年 user. All rights reserved.
//

#import "BYFileTool.h"

@implementation BYFileTool
/**
 获取网络请求日志存储路径
 
 @return 路径
 */
+(NSString *)getRequestArrayPath{
    
    NSArray *sandboxpath= NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    //获取完整路径
    NSString *documentsDirectory = [sandboxpath objectAtIndex:0];
    NSString *plistPath = [documentsDirectory stringByAppendingPathComponent:@"BYRequestArray.plist"];
    
    return plistPath;
}
//保存请求日志
+(void)saveRequestLogWith:(NSString *)str{
    NSArray *array = [NSArray arrayWithContentsOfFile:[BYFileTool getRequestArrayPath]];
    NSMutableArray *requestArray = nil;
    if (array.count) {
        requestArray = [[NSMutableArray alloc] initWithArray:array];
    }else{
        requestArray = [[NSMutableArray alloc] init];
    }
    
    if (requestArray.count>10) {
        [requestArray removeLastObject];
    }
    [requestArray insertObject:str atIndex:0];
    [requestArray writeToFile:[BYFileTool getRequestArrayPath] atomically:YES];
}
@end
