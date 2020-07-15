//
//  AppDelegate.m
//  duiduipeng
//
//  Created by MAC on 2019/3/4.
//  Copyright © 2019 MAC. All rights reserved.
//

#import "AppDelegate.h"
#import <IQKeyboardManager/IQKeyboardManager.h>
#import "TabBarViewController.h"
#import "BaseRTNavigationController.h"
#import "LoginViewController.h"



@interface AppDelegate ()


@end

@implementation AppDelegate





#pragma mark ========================================生命周期========================================


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    

    // 初始化window
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    
    // 初始化键盘
    [IQKeyboardManager sharedManager].enable = YES;
    [IQKeyboardManager sharedManager].shouldResignOnTouchOutside = YES;
    [IQKeyboardManager sharedManager].toolbarManageBehaviour = IQAutoToolbarBySubviews;
    
    //适配iOS11
    if (@available(ios 11.0,*)) {
        UIScrollView.appearance.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        UITableView.appearance.estimatedRowHeight = 0;
        UITableView.appearance.estimatedSectionFooterHeight = 0;
        UITableView.appearance.estimatedSectionHeaderHeight = 0;
    }
    
//    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
//    self.window.rootViewController = [[WebViewController alloc] init];
//    [self.window makeKeyAndVisible];
    
    
    NSString *account = [cDefault objectForKey:@"account"];
    if (cStrEmpty(account)) {
        [self goToLogin];
    } else {
        kUser.account = account;
        [self goToMain];
    }
    

    
    return YES;
}

#pragma mark - 设置为主页面
- (void)goToMain {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        self.window.rootViewController = [[TabBarViewController alloc] init];
        [self.window makeKeyAndVisible];
    });
    
}


#pragma mark - 设置为登录页
- (void)goToLogin {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        self.window.rootViewController = [[BaseRTNavigationController alloc] initWithRootViewController:[LoginViewController new]];
        [self.window makeKeyAndVisible];
    });
    
}




#pragma mark ========================================网络请求=============================================

#pragma mark ========================================代理方法=============================================

#pragma mark ========================================通知=============================================









@end
