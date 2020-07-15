//
//  CNetwork.h
//  skZone
//
//  Created by sm on 2019/4/17.
//  Copyright © 2019 MAC. All rights reserved.
//

// PHP

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^IdBlock)(id obj);
typedef void(^ListBlock)(NSArray *array);
typedef void(^DicBlock)(NSDictionary *dic);

@interface CNetwork : NSObject

//========================================后台接口========================================
+ (void)JAVA_GET:(NSDictionary *)dic method:(NSString *)method enable:(BOOL)enable success:(IdBlock)success failse:(IdBlock)failse;
+ (void)JAVA_POST:(NSDictionary *)dic method:(NSString *)method enable:(BOOL)enable success:(IdBlock)success failse:(IdBlock)failse;


@end

NS_ASSUME_NONNULL_END
