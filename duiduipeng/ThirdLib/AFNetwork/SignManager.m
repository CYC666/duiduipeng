//
//  SignManager.m
//  skZone
//
//  Created by sm on 2019/4/16.
//  Copyright © 2019 MAC. All rights reserved.
//

// 签名助手

#import "SignManager.h"
#import "NSString+MD5.h"

@implementation SignManager




// 传入一个字典，输出一个带签名的字典
+ (NSDictionary *)signWithDictionary:(NSDictionary *)dic {
    
    return dic;
//    // 获取当前时间戳
//    NSDate *currentDate = [NSDate date];
//    NSString *dateStr = [NSString stringWithFormat:@"%ld",(long)[currentDate timeIntervalSince1970]];
//
//    // 请求参数
//    NSMutableDictionary *mutableDict = [dic mutableCopy];
//
//    // 添加ts时间戳参数
//    [mutableDict setObject:dateStr forKey:@"ts"];
//
//    // 签名之前，需要将参数排序，以便与后台一致
//    NSString *sortedString = [NSString orderValueArrayWithDictionary:mutableDict];
//
//    // 开始签名
//    NSString *md5Str=[NSString md5:sortedString];
//    NSString *signStr=[NSString md5:[NSString stringWithFormat:@"%@%@",md5Str,PHP_Secret_Key]];
//
//    // 将签名添加到请求参数中
//    [mutableDict setObject:signStr forKey:@"sign"];
//
//    return mutableDict;
    
}




@end
