//
//  NSString+MD5.m
//  AES加密和解密
//
//  Created by yu hua on 2017/11/27.
//  Copyright © 2017年 Chongqing Huayu Network Education Technology Co., Ltd. All rights reserved.
//

#import "NSString+MD5.h"

@implementation NSString (MD5)

+(NSString *) md5:(NSString *) input {
    const char *cStr = [input UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5( cStr, strlen(cStr), digest ); // This is the md5 call
    
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    
    return  output;
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
        NSString *string=[NSString stringWithFormat:@"%@=%@",key,dict[key]];
        [orderValueArray addObject:string];
    }
    
    NSString *sortedString=[orderValueArray componentsJoinedByString:@"&"];
    return sortedString;
}
    

@end
