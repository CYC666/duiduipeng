//
//  NSString+MD5.h
//  AES加密和解密
//
//  Created by yu hua on 2017/11/27.
//  Copyright © 2017年 Chongqing Huayu Network Education Technology Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>
@interface NSString (MD5)

+(NSString*)md5:(NSString*)input;
+(NSString*)orderValueArrayWithDictionary:(NSDictionary*)dict;  // 键值对排序
    
@end
