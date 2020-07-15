//
//  ScanViewController.h
//  Cyprium
//
//  Created by MAC on 2019/3/11.
//  Copyright © 2019 MAC. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^ScanResultBlock)(NSString *resultStr);

@interface ScanViewController : UIViewController

@property(nonatomic,copy)ScanResultBlock scanResultBlock;

@end

NS_ASSUME_NONNULL_END
