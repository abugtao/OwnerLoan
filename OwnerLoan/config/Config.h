//
//  Config.h
//  OwnerLoan
//
//  Created by user on 2018/5/2.
//  Copyright © 2018年 user. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifdef DEBUG


//#define kDefaultIp @"http://mobiletest.tongbaotu.cn/api/"
#define kDefaultIp @"https://mobile.tongbaotu.com/api/"
//#define kDefaultIp @"http://mobile.tongbaotu.new/api/"
//#define kDefaultIp @"http://mobiletest.tongbaotu.net/api/"  //云

#define API_BASE_URL   [[Config shareInstance] hostIp]


#else
#define kDefaultIp @"https://mobile.tongbaotu.com/api/"
//#define kDefaultIp @"http://mobile.tongbaotu.new/api/"
//#define kDefaultIp @"http://mobiletest.tongbaotu.net/api/"  //云

#define API_BASE_URL  kDefaultIp

#endif



@interface Config : NSObject


@property (copy,nonatomic)NSString *hostIp;

+ (id)shareInstance;

@end
