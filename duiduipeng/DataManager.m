//
//  DataManager.m
//  duiduipeng
//
//  Created by 曹老师 on 2020/2/22.
//  Copyright © 2020 MAC. All rights reserved.
//

#import "DataManager.h"
#import "FMDatabase.h"
#import "FMDatabaseQueue.h"

#define MessageListTable @"MessageListTable"


@interface DataManager ()

@property(nonatomic, strong) FMDatabaseQueue *dbQueue;

@end

@implementation DataManager


+ (DataManager *)shareManager {
    static DataManager *instance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        instance = [[[self class] alloc] init];
        [instance dbQueue];
    });
    return instance;
}

#pragma mark - 创建数据库
- (FMDatabaseQueue *)dbQueue {
 
    if (!_dbQueue) {
        
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
        NSString *library = [[paths objectAtIndex:0] stringByAppendingPathComponent:@"duiduipeng"];
        _dbQueue = [FMDatabaseQueue databaseQueueWithPath:library];
        if (_dbQueue) {
            [self createUserTableIfNeed];
        }
    }
    return _dbQueue;
}

- (void)moveFile:(NSString *)fileName fromPath:(NSString *)fromPath toPath:(NSString *)toPath {
    if (![[NSFileManager defaultManager] fileExistsAtPath:toPath]) {
        [[NSFileManager defaultManager] createDirectoryAtPath:toPath
                                  withIntermediateDirectories:YES
                                                   attributes:nil
                                                        error:nil];
    }
    NSString *srcPath = [fromPath stringByAppendingPathComponent:fileName];
    NSString *dstPath = [toPath stringByAppendingPathComponent:fileName];
    [[NSFileManager defaultManager] moveItemAtPath:srcPath toPath:dstPath error:nil];
}


#pragma mark - 创建存储表
- (void)createUserTableIfNeed {
    [self.dbQueue inDatabase:^(FMDatabase *db) {
        if (![self isTableOK:MessageListTable withDB:db]) {
            NSString *createTableSQL = @"CREATE TABLE MessageListTable (id integer PRIMARY KEY autoincrement, avatar text, nickname text, uid text, photo_url text, video_url text, time text, content text, unRead text)";
            [db executeUpdate:createTableSQL];
            NSString *createIndexSQL = @"CREATE unique INDEX idx_uid ON MessageListTable(uid);";
            [db executeUpdate:createIndexSQL];
        }

//        if (![self isTableOK:friendTableName withDB:db]) {
//            NSString *createTableSQL = @"CREATE TABLE FRIENDSTABLE (id integer "
//                                       @"PRIMARY KEY autoincrement, user_id "
//                                       @"text, nick_name text, user_name text, status "
//                                       @"text, head_portrait text, friend_mark text, gender text)";
//            [db executeUpdate:createTableSQL];
//            NSString *createIndexSQL = @"CREATE unique INDEX idx_friendsId ON FRIENDSTABLE(user_id);";
//            [db executeUpdate:createIndexSQL];
//        } else if (![self isColumnExist:@"displayName" inTable:friendTableName withDB:db]) {
//            [db executeUpdate:@"ALTER TABLE FRIENDSTABLE ADD COLUMN displayName text"];
//        }


    }];
}

- (BOOL)isTableOK:(NSString *)tableName withDB:(FMDatabase *)db {
    BOOL isOK = NO;

    FMResultSet *rs = [db executeQuery:@"select count(*) as 'count' from sqlite_master where "
                                       @"type ='table' and name = ?",
                                       tableName];
    while ([rs next]) {
        NSInteger count = [rs intForColumn:@"count"];

        if (0 == count) {
            isOK = NO;
        } else {
            isOK = YES;
        }
    }
    [rs close];

    return isOK;
}

- (BOOL)isColumnExist:(NSString *)columnName inTable:(NSString *)tableName withDB:(FMDatabase *)db {
    BOOL isExist = NO;

    NSString *columnQurerySql = [NSString stringWithFormat:@"SELECT %@ from %@", columnName, tableName];
    FMResultSet *rs = [db executeQuery:columnQurerySql];
    if ([rs next]) {
        isExist = YES;
    } else {
        isExist = NO;
    }
    [rs close];

    return isExist;
}

- (void)closeDBForDisconnect {
    self.dbQueue = nil;
}


#pragma mark ========================================操作列表=============================================
#pragma mark - 存储单个
- (void)insertMessageToDB:(MessageModel *)model {
    NSString *insertSql = @"REPLACE INTO MessageListTable (avatar, nickname, uid, photo_url, video_url, time, content, unRead) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

    [self.dbQueue inDatabase:^(FMDatabase *db) {
        [db executeUpdate:insertSql, model.avatar, model.nickname, model.uid, model.photo_url, model.video_url, model.time, model.content, model.unRead];
    }];
}

#pragma mark - 储存多个
- (void)insertMessageListToDB:(NSMutableArray *)messageList complete:(void (^)(BOOL))result {

    if (messageList == nil || [messageList count] < 1)
        return;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
        [self.dbQueue inTransaction:^(FMDatabase *db, BOOL *rollback) {
            for (MessageModel *model in messageList) {
                NSString *insertSql = @"REPLACE INTO MessageListTable (avatar, nickname, uid, photo_url, video_url, time, content, unRead) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
                [db executeUpdate:insertSql, model.avatar, model.nickname, model.uid, model.photo_url, model.video_url, model.time, model.content, model.unRead];
            }
        }];
        result(YES);
    });
}

#pragma mark - 获取单个
- (MessageModel *)getMessageByUid:(NSString *)uid {
    __block MessageModel *model = nil;

    [self.dbQueue inDatabase:^(FMDatabase *db) {
        FMResultSet *rs = [db executeQuery:@"SELECT * FROM MessageListTable where uid = ?", uid];
        while ([rs next]) {
            model = [[MessageModel alloc] init];
            model.avatar = [rs stringForColumn:@"avatar"];
            model.nickname = [rs stringForColumn:@"nickname"];
            model.uid = [rs stringForColumn:@"uid"];
            model.photo_url = [rs stringForColumn:@"photo_url"];
            model.video_url = [rs stringForColumn:@"video_url"];
            model.time = [rs stringForColumn:@"time"];
            model.content = [rs stringForColumn:@"ƒ"];
            model.unRead = [rs stringForColumn:@"unRead"];
        }
        [rs close];
    }];
    return model;
}

#pragma mark - 获取所有
- (NSArray *)getAllMessage {
    NSMutableArray *allMessage = [NSMutableArray new];

    [self.dbQueue inDatabase:^(FMDatabase *db) {
        FMResultSet *rs = [db executeQuery:@"SELECT * FROM MessageListTable"];
        while ([rs next]) {
            MessageModel *model;
            model = [[MessageModel alloc] init];
            model = [[MessageModel alloc] init];
            model.avatar = [rs stringForColumn:@"avatar"];
            model.nickname = [rs stringForColumn:@"nickname"];
            model.uid = [rs stringForColumn:@"uid"];
            model.photo_url = [rs stringForColumn:@"photo_url"];
            model.video_url = [rs stringForColumn:@"video_url"];
            model.time = [rs stringForColumn:@"time"];
            model.content = [rs stringForColumn:@"content"];
            model.unRead = [rs stringForColumn:@"unRead"];
            [allMessage addObject:model];
        }
        [rs close];
    }];

    return allMessage;
}



#pragma mark - 删除单个
- (void)deleteMessageToDB:(NSString *)uid {
    if ([uid length] < 1)
        return;
    NSString *deleteSql =
        [NSString stringWithFormat:@"delete from %@ where %@ = '%@'", @"MessageListTable", @"uid", uid];

    [self.dbQueue inDatabase:^(FMDatabase *db) {
        [db executeUpdate:deleteSql];
    }];
}

#pragma mark - 删除所有
- (BOOL)clearMessageFromDB {
    __block BOOL result = NO;
    NSString *clearSql = [NSString stringWithFormat:@"DELETE FROM MessageListTable"];

    [self.dbQueue inDatabase:^(FMDatabase *db) {
        result = [db executeUpdate:clearSql];
    }];
    return result;
}




































@end


@implementation MessageModel



@end
