//
//  View1Controller.m
//  duiduipeng
//
//  Created by CYC on 2020/3/31.
//  Copyright © 2020 Hello. All rights reserved.
//

#import "View2Controller.h"
#import "ZoneListController.h"
#import "ZoneSecretController.h"

@interface View2Controller ()

@end

@implementation View2Controller

- (instancetype)init {
    self = [super init];
    if (self) {
        
        self.menuItemWidth = 100;
        self.menuViewStyle = WMMenuViewStyleLine;
        self.titleSizeSelected = 24;
        self.titleSizeNormal = 24;
        self.titleFontName = @"PingFangSC-Medium";
        self.titleColorSelected = cLabColA;
        self.titleColorNormal = cLabColC;
        self.menuHeight = 40;
        self.progressHeight = 4;
        self.progressWidth = 50;
        self.viewFrame = CGRectMake(0, cNavStart, cScreenWidth, cScreenHeight - cNavStart - cTabHeight);
        self.itemsMargins = @[@20,@10,@(cScreenWidth - 20 - 100 - 10 - 100)];
        self.progressColor = Publie_Color;
        self.menuBGColor = cWhiteColor;
        self.progressViewIsNaughty = YES;
        self.progressViewCornerRadius = 2;
        
    }
    return self;
}

- (NSArray<NSString *> *)titles {
    return @[@"最新动态", @"私密空间"];
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.navigationController.navigationBar.hidden = YES;
    
}

#pragma mark ========================================动作响应=============================================


#pragma mark ========================================网络请求=============================================



#pragma mark ========================================代理方法=============================================

- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController {
    return self.titles.count;
}

- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index {
    return self.titles[index];
}


- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index {
    

    if (index == 0) {
        
        ZoneListController *ctrl = [ZoneListController new];
        return ctrl;
    } else {
        
        ZoneSecretController *ctrl = [ZoneSecretController new];
        return ctrl;
    }
    
}

- (void)pageController:(WMPageController *)pageController didEnterViewController:(__kindof UIViewController *)viewController withInfo:(NSDictionary *)info {
    
    
    
    
}

@end
