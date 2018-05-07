//
//  BYDateTool.h
//  OwnerLoan
//
//  Created by user on 2018/5/4.
//  Copyright © 2018年 user. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BYDateTool : NSObject
//date 按照传入的格式转 str 
+ (NSString *)stringToDate:(NSDate *) date andFormatStr:(NSString *) formatStr;
@end
