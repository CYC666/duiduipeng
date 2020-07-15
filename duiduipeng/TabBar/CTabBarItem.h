//
//  CTabBarItem.h
//  duiduipeng
//
//  Created by 曹老师 on 2019/12/19.
//  Copyright © 2019 MAC. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CTabBarItem : UIButton


@property (strong, nonatomic) UIImageView *icon;
@property (strong, nonatomic) UILabel *label;
@property (strong, nonatomic) UILabel *numLabel;



@end

NS_ASSUME_NONNULL_END
