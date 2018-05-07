//
//  CommonService.h
//  OwnerLoan
//
//  Created by user on 2018/5/2.
//  Copyright © 2018年 user. All rights reserved.
//

#import "HTRequest.h"

@interface CommonService : HTRequest
- (void)requestLoginWithParam:(NSDictionary *)params succCallback:(void (^)(HTResponse * response))succcallback failCallback:(void(^)(HTResponse *response))failcallback;
@end
