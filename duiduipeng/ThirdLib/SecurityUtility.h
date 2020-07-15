//
//  SecurityUtility.h
//  duiduipeng
//
//  Created by MAC on 2019/6/24.
//  Copyright © 2019 MAC. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SecurityUtility : NSObject

//SHA256加密
+ (NSString *)hmac:(NSString *)plaintext withKey:(NSString *)key;

//SHA256加密
+ (NSString*)sha256HashFor:(NSString *)input;

@end

NS_ASSUME_NONNULL_END
