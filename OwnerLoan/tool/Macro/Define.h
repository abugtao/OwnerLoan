//
//  Define.h
//  OwnerLoan
//
//  Created by user on 2018/4/28.
//  Copyright © 2018年 user. All rights reserved.
//

#ifndef Define_h
#define Define_h

#define SCREEN_WDITH [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGTH [[UIScreen mainScreen] bounds].size.height
#define SYSTEM_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]
//app版本
#define APPCURRENTVERSION [[NSBundle mainBundle] infoDictionary][@"CFBundleShortVersionString"]

//判断是否是iPhone X
#define LL_iPhoneX  ((SCREEN_WDITH == 375 && SCREEN_HEIGTH == 812) ? YES:NO)
#define TOP_CONST_HEIGHT  (LL_iPhoneX ? 88.0 : 64.0)
#define BOTTOM_CONST_HEIGHT (LL_iPhoneX? 83.0 : 49.0)



//打印出来类，方法，行数，内容
#ifdef DEBUG
#define TLog(format, ...) printf("%s [Line %d] %s\n\n",__PRETTY_FUNCTION__, __LINE__,[[NSString stringWithFormat:format, ## __VA_ARGS__] UTF8String])
#else
#define TLog(format, ...)
#endif


#endif /* Define_h */
