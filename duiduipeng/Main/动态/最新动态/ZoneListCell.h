//
//  ZoneListCell.h
//  duiduipeng
//
//  Created by CYC on 2020/6/4.
//  Copyright © 2020 Hello. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZoneListCell : UITableViewCell

@property (strong, nonatomic) NSDictionary *model;

@property (strong, nonatomic) UIImageView *icon1;   // 头像
@property (strong, nonatomic) UIImageView *icon2;   // 动态图
@property (strong, nonatomic) UILabel *label1;      // 昵称
@property (strong, nonatomic) UILabel *label2;      // 签名
@property (strong, nonatomic) UILabel *label3;      // 动态内容
@property (strong, nonatomic) UIButton *button1;    // 评论
@property (strong, nonatomic) UIButton *button2;    // 点赞

@end

NS_ASSUME_NONNULL_END
