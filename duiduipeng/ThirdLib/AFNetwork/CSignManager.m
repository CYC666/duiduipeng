//
//  SignManager.m
//  skZone
//
//  Created by sm on 2019/4/16.
//  Copyright © 2019 MAC. All rights reserved.
//

// 签名助手

#import "CSignManager.h"
#import "NSString+MD5.h"

@implementation CSignManager




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
////    NSString *sortedString = [NSString orderValueArrayWithDictionary:mutableDict];
//    NSString *sortedString = [self orderValueArrayWithDictionary:mutableDict];
//
//    // 开始签名
//    NSString *md5Str=[NSString md5:sortedString];
//    NSString *signStr=[NSString md5:[NSString stringWithFormat:@"%@%@",md5Str,PHP_Secret_Key2]];
//
//    // 将签名添加到请求参数中
//    [mutableDict setObject:signStr forKey:@"sign"];
//
//    return mutableDict;
    
}


+(NSString*)orderValueArrayWithDictionary:(NSDictionary*)dict {
    
    NSMutableArray *orderValueArray=[[NSMutableArray alloc]init];
    //取出字典中所有key
    NSArray *keyArray=[dict allKeys];
    //将key排序
    NSArray *sortedArray=[keyArray sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        return [obj1 compare:obj2 options:NSNumericSearch];//正序
    }];
    
    //根据key的顺序提取相应的value
    for (NSString *key in sortedArray) {
        
        NSString *string;
        id value = dict[key];
        if ([value isKindOfClass:[NSArray class]]) {
            // 转成字符串
            NSArray *list = (NSArray *)value;
            
            
//            NSMutableArray *subValueList = [NSMutableArray array];
//            for (NSString *subValue in list) {
//                [subValueList addObject:[NSString stringWithFormat:@"%@=%@", key, NULL_String(subValue)]];
//            }
//            string = [subValueList componentsJoinedByString:@"&"];

            string=[NSString stringWithFormat:@"%@=%@",key,[list componentsJoinedByString:@","]];
        } else {
            string=[NSString stringWithFormat:@"%@=%@",key,value];
        }
        
        
        [orderValueArray addObject:string];
    }
    
    NSString *sortedString=[orderValueArray componentsJoinedByString:@"&"];
    return sortedString;
}





@end
