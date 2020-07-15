//
//  UserInfoManager.h
//  duiduipeng
//
//  Created by sm on 2019/4/2.
//  Copyright © 2019 MAC. All rights reserved.
//

#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN

@interface UserInfoManager : NSObject



@property (copy, nonatomic) NSString *account;
@property (copy, nonatomic) NSString *password;
@property (copy, nonatomic) NSString *name;
@property (strong, nonatomic) NSMutableArray *list1;    // 收藏
@property (strong, nonatomic) NSMutableArray *list2;    // 注册的用户


+ (instancetype)shareManager;


// 退出登录
- (void)loginOut;


@end

NS_ASSUME_NONNULL_END
