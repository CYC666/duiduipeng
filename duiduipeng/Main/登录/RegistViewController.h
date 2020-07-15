//
//  RegistViewController.h
//  NewsProject
//
//  Created by CYC on 2020/5/26.
//  Copyright © 2020 oig. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^RegistViewControllerBlock)(NSString *account);

@interface RegistViewController : UIViewController

@property (copy, nonatomic) RegistViewControllerBlock selectBlock;

@end

NS_ASSUME_NONNULL_END
