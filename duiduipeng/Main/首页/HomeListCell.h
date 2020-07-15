//
//  HomeListCell.h
//  duiduipeng
//
//  Created by CYC on 2020/6/4.
//  Copyright © 2020 Hello. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HomeListCell : UITableViewCell

@property (strong, nonatomic) UIImageView *icon;
@property (strong, nonatomic) UILabel *label1;  // 年龄
@property (strong, nonatomic) UILabel *label2;  // 名字
@property (strong, nonatomic) UILabel *label3;  // 签名
@property (strong, nonatomic) UILabel *label4;  // 价格

@property (strong, nonatomic) NSDictionary *model;

@end

NS_ASSUME_NONNULL_END
