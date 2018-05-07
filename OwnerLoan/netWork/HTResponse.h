//
//  HTResponse.h
//  afnetworkingDemo
//
//  Created by zht on 15/10/28.
//  Copyright © 2015年 zht. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HTResponse : NSObject

@property(copy, nonatomic) NSString *status;
@property(strong, nonatomic) NSError *error;
@property (copy,nonatomic) NSString * url;
@property (nonatomic,strong) id object;
@property (assign,nonatomic) BOOL boolArg;
@property (assign,nonatomic) NSInteger totalPage;
@property (copy,nonatomic)NSString *messsage;

@property (assign,nonatomic) NSInteger totalCount;

@end
