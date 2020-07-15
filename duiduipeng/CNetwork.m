//
//  CNetwork.m
//  skZone
//
//  Created by sm on 2019/4/17.
//  Copyright © 2019 MAC. All rights reserved.
//

#import "CNetwork.h"
#import <AFNetworking.h>
#import "SignManager.h"



@implementation CNetwork



#pragma mark ========================================JAVA基础接口=============================================

+ (void)JAVA_GET:(NSDictionary *)dic method:(NSString *)method enable:(BOOL)enable success:(IdBlock)success failse:(IdBlock)failse {
    
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:@"text/javascript",@"text/plain",@"text/xml",@"",@"text/html",@"text/json",@"image/jpeg",@"application/json",@"application/javascript",@"application/x-www-form-urlencoded", nil];
    manager.requestSerializer=[AFJSONRequestSerializer serializer];
//    NSString *token = [NSString stringWithFormat:@"%@", [kUserDefault objectForKey:RC_Token]];
//    [manager.requestSerializer setValue:token forHTTPHeaderField:@"token"];
    NSString *url = [NSString stringWithFormat:@"%@%@", KPURL, method];
    NSDictionary *parameters = [SignManager signWithDictionary:dic];
    
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        if (!enable) {
            cWindow.userInteractionEnabled = NO;
        }
        
    });
    
    [manager GET:url parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            success(responseObject);
            
            NSLog(@"\n🙂🙂🙂🙂🙂🙂🙂🙂🙂🙂🙂🙂🙂🙂🙂🙂🙂🙂🙂🙂🙂👇请求参数👇🙂🙂🙂🙂🙂🙂🙂🙂🙂🙂🙂🙂🙂🙂🙂🙂🙂🙂🙂🙂🙂\n%@\n%@\n", url, [CTool getNslogString:parameters]);
            NSLog(@"\n%@\n🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰👆请求成功👆🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰\n", [CTool getNslogString:responseObject]);
            cWindow.userInteractionEnabled = YES;
            
        });
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            failse(error);
            
            NSLog(@"\n🙂🙂🙂🙂🙂🙂🙂🙂🙂🙂🙂🙂🙂🙂🙂🙂🙂🙂🙂🙂🙂👇请求参数👇🙂🙂🙂🙂🙂🙂🙂🙂🙂🙂🙂🙂🙂🙂🙂🙂🙂🙂🙂🙂🙂\n%@\n%@\n", url, [CTool getNslogString:parameters]);
            NSLog(@"\n%@\n😭😭😭😭😭😭😭😭😭😭😭😭😭😭😭😭😭😭😭😭😭👆请求失败👆😭😭😭😭😭😭😭😭😭😭😭😭😭😭😭😭😭😭😭😭😭\n", [CTool getNslogString:error]);
            cWindow.userInteractionEnabled = YES;
            
        });
        
    }];
    
    
}


+ (void)JAVA_POST:(NSDictionary *)dic method:(NSString *)method enable:(BOOL)enable success:(IdBlock)success failse:(IdBlock)failse {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:@"text/javascript",@"text/plain",@"text/xml",@"",@"text/html",@"text/json",@"image/jpeg",@"application/json",@"application/javascript",@"application/x-www-form-urlencoded", nil];
    manager.requestSerializer=[AFJSONRequestSerializer serializer];
    [manager.requestSerializer setValue:@"Accept-Language: zh-Hans-CN;q=1, en-CN;q=0.9" forHTTPHeaderField:@"Accept-Language"];
    [manager.requestSerializer setValue:@"Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1aWQiOjgwOTE2NjAsInR0bCI6MTU5MTI2MDg3NywiZXhwIjoxOTAyMjk3Mjc3fQ.WDDw1LADW11FyOyZIE-1y0uxJ9G8XGrdszOPO0sWdXg" forHTTPHeaderField:@"Authorization"];
    NSString *url = [NSString stringWithFormat:@"%@%@", KPURL, method];
    NSDictionary *parameters = [SignManager signWithDictionary:dic];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        if (!enable) {
            cWindow.userInteractionEnabled = NO;
        }
        
    });
    [manager POST:url parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            success(responseObject);
            
            NSLog(@"\n🙂🙂🙂🙂🙂🙂🙂🙂🙂🙂🙂🙂🙂🙂🙂🙂🙂🙂🙂🙂🙂👇请求参数👇🙂🙂🙂🙂🙂🙂🙂🙂🙂🙂🙂🙂🙂🙂🙂🙂🙂🙂🙂🙂🙂\n%@\n%@\n", url, [CTool getNslogString:parameters]);
            NSLog(@"\n%@\n🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰👆请求成功👆🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰\n", [CTool getNslogString:responseObject]);
            cWindow.userInteractionEnabled = YES;
            
        });
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            failse(error);
            
            NSLog(@"\n🙂🙂🙂🙂🙂🙂🙂🙂🙂🙂🙂🙂🙂🙂🙂🙂🙂🙂🙂🙂🙂👇请求参数👇🙂🙂🙂🙂🙂🙂🙂🙂🙂🙂🙂🙂🙂🙂🙂🙂🙂🙂🙂🙂🙂\n%@\n%@\n", url, [CTool getNslogString:parameters]);
            NSLog(@"\n%@\n😭😭😭😭😭😭😭😭😭😭😭😭😭😭😭😭😭😭😭😭😭👆请求失败👆😭😭😭😭😭😭😭😭😭😭😭😭😭😭😭😭😭😭😭😭😭\n", [CTool getNslogString:error]);
            cWindow.userInteractionEnabled = YES;
            
        });
        
    }];
    
}














@end
