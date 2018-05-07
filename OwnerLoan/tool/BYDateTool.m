//
//  BYDateTool.m
//  OwnerLoan
//
//  Created by user on 2018/5/4.
//  Copyright © 2018年 user. All rights reserved.
//

#import "BYDateTool.h"

@implementation BYDateTool
//date 按照传入的格式转 str
+ (NSString *)stringToDate:(NSDate *) date andFormatStr:(NSString *) formatStr {
    NSString *_foramtStr = @"";
    NSDateFormatter *format = [[NSDateFormatter alloc]init];
    [format setDateFormat:formatStr];
    _foramtStr = [format stringFromDate:date];
    return _foramtStr;
}
@end
