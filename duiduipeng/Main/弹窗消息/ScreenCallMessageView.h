//
//  ScreenCallMessageView.h
//  duiduipeng
//
//  Created by CYC on 2020/6/5.
//  Copyright © 2020 Hello. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^ScreenCallMessageViewBlock)(NSInteger flag);  // 0-挂断 1-接通

@interface ScreenCallMessageView : UIView


@property (strong, nonatomic) NSDictionary *model;
@property (copy, nonatomic) ScreenCallMessageViewBlock sureBlock;


@end

NS_ASSUME_NONNULL_END
