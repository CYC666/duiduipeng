//
//  FansController.m
//  duiduipeng
//
//  Created by CYC on 2020/6/5.
//  Copyright © 2020 Hello. All rights reserved.
//

#import "FansController.h"

@interface FansController ()

@end

@implementation FansController

#pragma mark ========================================生命周期========================================
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"我的粉丝";
    self.view.backgroundColor = Background_Color;
    
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
        
        UIImageView *icon = [[UIImageView alloc] initWithFrame:CGRectMake((cScreenWidth - 200)/2, 100, 200, 200)];
        icon.image = [UIImage imageNamed:@"暂无数据"];
        icon.contentMode = UIViewContentModeScaleAspectFit;
        [scrollView addSubview:icon];
        height = icon.c_bottom;
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, icon.c_bottom + 20, cScreenWidth, 20)];
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = cLabColC;
        label.font = cPfRegular(14);
        label.text = @"您暂时还没有粉丝";
        [scrollView addSubview:label];
        
        height = label.c_bottom;
        
        
        scrollView.contentSize = CGSizeMake(cScreenWidth, height);
        
    }
    
}




#pragma mark ========================================动作响应=============================================


#pragma mark ========================================网络请求=============================================


#pragma mark ========================================代理方法=============================================





















@end
