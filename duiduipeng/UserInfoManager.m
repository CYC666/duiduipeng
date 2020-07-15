//
//  UserInfoManager.m
//  duiduipeng
//
//  Created by sm on 2019/4/2.
//  Copyright © 2019 MAC. All rights reserved.
//

#import "UserInfoManager.h"
#import "AppDelegate.h"

static UserInfoManager *instance = nil;

@implementation UserInfoManager

#pragma mark ========================================生命周期========================================

#pragma mark - 单利初始化
+ (instancetype)shareManager {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        instance = [[UserInfoManager alloc] init];
        
    });
    
    return instance;
}

+ (id)allocWithZone:(struct _NSZone *)zone{
    @synchronized(self) {
        if (!instance) {
            instance = [super allocWithZone:zone];
        }
    }
    return instance;
}


- (NSMutableArray *)list1 {
    
    if (!_list1) {
        _list1 = [NSMutableArray array];
    }
    return _list1;
    
}

- (NSMutableArray *)list2 {
    
    if (!_list2) {
        _list2 = [NSMutableArray array];
        [_list2 addObject:@{@"account" : @"888888", @"password" : @"123456"}];
    }
    return _list2;
    
}


#pragma mark ========================================动作响应=============================================

- (void)loginOut {
    
    _account = @"";
    _password = @"";
    
    [kData clearMessageFromDB];
    
    [cDefault setValue:@"" forKey:@"account"];
    [cDefault setValue:@"" forKey:@"password"];
    [cDefault synchronize];

    
    
}

#pragma mark ========================================网络请求=============================================


#pragma mark ========================================代理方法=============================================


























@end
