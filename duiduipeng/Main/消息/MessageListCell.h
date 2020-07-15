//
//  MessageListCell.h
//  duiduipeng
//
//  Created by CYC on 2020/6/5.
//  Copyright © 2020 Hello. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MessageListCell : UITableViewCell

@property (strong, nonatomic) MessageModel *model;


@property (strong, nonatomic) UIImageView *icon;
@property (strong, nonatomic) UILabel *label1;
@property (strong, nonatomic) UILabel *label2;
@property (strong, nonatomic) UILabel *label3;
@property (strong, nonatomic) UILabel *label4;


@end

NS_ASSUME_NONNULL_END
