//
//  ComeVIPController.m
//  duiduipeng
//
//  Created by CYC on 2020/6/5.
//  Copyright © 2020 Hello. All rights reserved.
//

#import "ComeVIPController.h"
#import "ContactVIPController.h"

@interface ComeVIPController ()

@end

@implementation ComeVIPController

#pragma mark ========================================生命周期========================================
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"升级VIP";
    self.view.backgroundColor = cHexColor(0x0c0a07);
    
    [self creatUIAction];
}

#pragma mark - 创建UI
- (void)creatUIAction {
    
    {
        UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, cScreenWidth, cScreenHeight - cNavHeight)];
        scrollView.alwaysBounceVertical = YES;
        scrollView.showsVerticalScrollIndicator = NO;
        [self.view addSubview:scrollView];
        
        
        CGFloat height = 0;
        
        {
            UIImageView *icon = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, cScreenWidth, cScreenWidth * 2456/1242.0)];
            icon.image = [UIImage imageNamed:@"升级VIP详情"];
            icon.contentMode = UIViewContentModeScaleAspectFit;
            [scrollView addSubview:icon];
            height = icon.c_bottom;
            
            __weak typeof(self) weakSelf = self;
            [icon addAction:^(NSInteger tag) {
                [weakSelf buttonAction];
            }];
        }
        
        
        scrollView.contentSize = CGSizeMake(cScreenWidth, height);
        
    }
    
}




#pragma mark ========================================动作响应=============================================

#pragma mark - 购买
- (void)buttonAction {
    
    [self.navigationController pushViewController:[ContactVIPController new] animated:YES];
    
}

#pragma mark ========================================网络请求=============================================


#pragma mark ========================================代理方法=============================================





















@end
