//
//  HTRequest.h
//  afnetworkingDemo
//
//  Created by zht on 15/10/28.
//  Copyright © 2015年 zht. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>

#import "HTResponse.h"

@interface HTRequest : NSObject

//@property (nonatomic,strong) AFHTTPRequestOperation *operation;
//@property (nonatomic,strong) AFHTTPRequestOperationManager *opreationManager;

@property (strong,nonatomic) AFHTTPSessionManager * opreationManager;

//post
- (void)execute:(NSString*) uri params:(NSDictionary *)params  succCallback:(void (^)(HTResponse * response))succcallback failCallback:(void(^)(HTResponse *response))failcallback;

//get
- (void)executeOfGet:(NSString*) uri params:(NSDictionary *)params  succCallback:(void (^)(HTResponse * response))succcallback failCallback:(void(^)(HTResponse *response))failcallback;


- (void)cancelRequest;


@end
