//
//  CommonService.m
//  OwnerLoan
//
//  Created by user on 2018/5/2.
//  Copyright © 2018年 user. All rights reserved.
//

#import "CommonService.h"

@implementation CommonService
- (void)requestLoginWithParam:(NSDictionary *)params succCallback:(void (^)(HTResponse * response))succcallback failCallback:(void(^)(HTResponse *response))failcallback{
    
    
    [self execute:API_COSTOMER_LOGIN params:params succCallback:^(HTResponse *response) {
        if (succcallback !=nil) {
            succcallback(response);
        }
    } failCallback:^(HTResponse *response) {
        if (failcallback !=nil) {
            failcallback(response);
            
        }
        
    }];
}
@end
