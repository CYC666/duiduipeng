//
//  DataManager.h
//  duiduipeng
//
//  Created by 曹老师 on 2020/2/22.
//  Copyright © 2020 MAC. All rights reserved.
//

#import <Foundation/Foundation.h>
@class MessageModel;

NS_ASSUME_NONNULL_BEGIN

@interface DataManager : NSObject

+ (DataManager *)shareManager;


#pragma mark - 存储单个
- (void)insertMessageToDB:(MessageModel *)model;

#pragma mark - 储存多个
- (void)insertMessageListToDB:(NSMutableArray *)messageList complete:(void (^)(BOOL))result;

#pragma mark - 获取单个
- (MessageModel *)getMessageByMessageId:(NSString *)messageId;

#pragma mark - 获取所有
- (NSArray *)getAllMessage;

#pragma mark - 删除单个
- (void)deleteMessageToDB:(NSString *)messageId;

#pragma mark - 删除所有
- (BOOL)clearMessageFromDB;

@end

@interface MessageModel : NSObject

@property (copy, nonatomic) NSString *avatar;
@property (copy, nonatomic) NSString *nickname;
@property (copy, nonatomic) NSString *uid;
@property (copy, nonatomic) NSString *photo_url;
@property (copy, nonatomic) NSString *video_url;
@property (copy, nonatomic) NSString *time;
@property (copy, nonatomic) NSString *content;
@property (copy, nonatomic) NSString *unRead;


@end

NS_ASSUME_NONNULL_END
