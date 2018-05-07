//
//  HTRequest.m
//  afnetworkingDemo
//
//  Created by zht on 15/10/28.
//  Copyright © 2015年 zht. All rights reserved.
//
#import "HTRequest.h"
@implementation HTRequest
- (void)execute:(NSString*) uri params:(NSDictionary *)params  succCallback:(void (^)(HTResponse * response))succcallback failCallback:(void(^)(HTResponse *response))failcallback{
    
    
//    NSDictionary *md = [TCommonUtils dictionaryEncrptParams:params];
//    NSDictionary *postParams = [NSDictionary dictionaryWithObjectsAndKeys:
//                                md, @"params",[TCommonUtils textFormbase64String:[[NSUserDefaults standardUserDefaults] objectForKey:SESSION_ID]], @"session_id",
//                                nil];
//    postParams = params;

    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:API_BASE_URL]];
    TLog(@"-url--%@%@",API_BASE_URL,uri);
    TLog(@"params---%@---",params);
//    TLog(@"doneParams ----%@----",postParams);
    self.opreationManager = manager;
    
    
    [manager POST:uri parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        HTResponse *response = [[HTResponse alloc]init];
        response.object = responseObject;
        response.messsage = [responseObject objectForKey:@"message"];
        if ([[[responseObject objectForKey:@"status"] stringValue] isEqualToString:@"10000"]) {
            TLog(@"done---url--%@%@-->%@",API_BASE_URL,uri,response.status);
            TLog(@"response---%@",responseObject);
            if(succcallback != nil)
                succcallback(response);
            
        }else{
            TLog(@"done---url--%@%@-->%@",API_BASE_URL,uri,responseObject[@"status"]);
            TLog(@"error---%@",responseObject);
            response.status = responseObject[@"status"];
            if(failcallback != nil)
                failcallback(response);
        }
#ifdef DEBUG
        
        [BYFileTool saveRequestLogWith:[NSString stringWithFormat:@" time:%@\n\n %@\n\n params:%@\n\n response:%@",[BYDateTool stringToDate:[NSDate date] andFormatStr:@"yyyy-MM-dd HH:mm:ss"],uri,params,responseObject]];
        
#else
#endif
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        HTResponse *response = [[HTResponse alloc]init];
        response.url = uri ;
        response.object = nil;
        
        response.error = error;
        if (error.code==-1001) {
//            [TCommonUtils alertWithErrorMessage:@"网络不给力，请稍后再试"];
            response.status = @"-10001";
        }
        if (error.code==-1009||error.code == -1003||error.code == -1005) {
//            [TCommonUtils alertWithErrorMessage:@"您的网络未连接，请检查网络设置"];
            response.status = @"-1009";
        }
        TLog(@"done---url--%@%@-->%@",API_BASE_URL,uri,response.status);
        TLog(@"fail---%@",error);
        
#ifdef DEBUG
        
        [BYFileTool saveRequestLogWith:[NSString stringWithFormat:@" time:%@\n\n %@\n\n params:%@\n\n error:%@",[BYDateTool stringToDate:[NSDate date] andFormatStr:@"yyyy-MM-dd HH:mm:ss"],uri,params,error]];
        
#else
#endif
        if (failcallback != nil)
            failcallback(response);
    }];
    

}

//get
- (void)executeOfGet:(NSString*) uri params:(NSDictionary *)params  succCallback:(void (^)(HTResponse * response))succcallback failCallback:(void(^)(HTResponse *response))failcallback{
//    NSDictionary *md = [TCommonUtils dictionaryEncrptParams:params];
//    NSDictionary *postParams = [NSDictionary dictionaryWithObjectsAndKeys:
//                                md, @"params",[TCommonUtils textFormbase64String:[[NSUserDefaults standardUserDefaults] objectForKey:SESSION_ID]], @"session_id",
//                                nil];
    //    postParams = params;
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:API_BASE_URL]];
    TLog(@"-url--%@%@",API_BASE_URL,uri);
    TLog(@"params---%@---",params);
//    TLog(@"doneParams ----%@----",postParams);
    self.opreationManager = manager;
    
   
    
    [manager GET:uri parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        HTResponse *response = [[HTResponse alloc]init];
        response.object = responseObject;
        response.messsage = [responseObject objectForKey:@"message"];
        if ([[[responseObject objectForKey:@"status"] stringValue] isEqualToString:@"10000"]) {
            TLog(@"done---url--%@%@-->%@",API_BASE_URL,uri,response.status);
            TLog(@"response---%@",responseObject);
            if(succcallback != nil)
                succcallback(response);
            
        }else{
            TLog(@"done---url--%@%@-->%@",API_BASE_URL,uri,responseObject[@"status"]);
            TLog(@"error---%@",responseObject);
            response.status = responseObject[@"status"];
            if(failcallback != nil)
                failcallback(response);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        HTResponse *response = [[HTResponse alloc]init];
        response.url = uri ;
        response.object = nil;
        
        response.error = error;
        if (error.code==-1001) {
//            [TCommonUtils alertWithErrorMessage:@"网络不给力，请稍后再试"];
            response.status = @"-10001";
        }
        if (error.code==-1009||error.code == -1003||error.code == -1005) {
//            [TCommonUtils alertWithErrorMessage:@"您的网络未连接，请检查网络设置"];
            response.status = @"-1009";
        }
        TLog(@"done---url--%@%@-->%@",API_BASE_URL,uri,response.status);
        TLog(@"fail---%@",error);
        if (failcallback != nil)
            failcallback(response);
    }];
}

- (void)cancelRequest{
    [self.opreationManager.operationQueue cancelAllOperations];
}

@end
