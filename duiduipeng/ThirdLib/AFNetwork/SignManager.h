//
//  SignManager.h
//  skZone
//
//  Created by sm on 2019/4/16.
//  Copyright © 2019 MAC. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SignManager : NSObject


// 传入一个字典，输出一个前闽侯的字典
+ (NSDictionary *)signWithDictionary:(NSDictionary *)dic;





@end

NS_ASSUME_NONNULL_END
