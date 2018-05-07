//
//  Config.m
//  OwnerLoan
//
//  Created by user on 2018/5/2.
//  Copyright © 2018年 user. All rights reserved.
//

#import "Config.h"
#define HOSTIP @"hostIP"

@implementation Config
+ (instancetype)shareInstance{
    static Config *myconfig = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        myconfig = [[super allocWithZone:NULL] init];
    });
    return myconfig;
}



- (instancetype)init{
    self = [super init];
    if (self) {
        NSUserDefaults *userD = [NSUserDefaults standardUserDefaults];
        NSString *ip = [userD objectForKey:HOSTIP];
        
        self.hostIp = ip.length? ip:kDefaultIp;
        
    }
    
    return self;
}



- (void)setHostIp:(NSString *)hostIp{
    if ([hostIp rangeOfString:@"http://"].location == NSNotFound) {
        _hostIp = [NSString stringWithFormat:@"http://%@",hostIp];
    }else{
        _hostIp = hostIp;
    }
    _hostIp = hostIp;
    NSUserDefaults *userD = [NSUserDefaults standardUserDefaults];
    [userD setObject:_hostIp forKey:HOSTIP];
    [userD synchronize];
}
@end
