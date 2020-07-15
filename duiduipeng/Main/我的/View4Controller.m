//
//  View4Controller.m
//  duiduipeng
//
//  Created by CYC on 2020/3/31.
//  Copyright © 2020 Hello. All rights reserved.
//

#import "View4Controller.h"
#import "ProcotolViewController.h"
#import "FeedBackController.h"
#import "MyDiamondsController.h"
#import "EditInfoController.h"
#import "ComeVIPController.h"

@interface View4Controller ()

@end

@implementation View4Controller

#pragma mark ========================================生命周期========================================
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = cWhiteColor;
    
    [self creatUIAction];
}

#pragma mark - 创建UI
- (void)creatUIAction {
    
    {
        // 导航栏右边的添加按钮
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(0, 0, 80, 44);
        [button setTitle:@"修改资料" forState:UIControlStateNormal];
        [button setTitleColor:cLabColC forState:UIControlStateNormal];
        button.titleLabel.font = cPfRegular(18);
        cBtnSelector(button, editInfoAction)
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    }
    
    {
        UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, cScreenWidth, cScreenHeight - cNavHeight - cTabHeight)];
        scrollView.alwaysBounceVertical = YES;
        scrollView.showsVerticalScrollIndicator = NO;
        [self.view addSubview:scrollView];
        
        
        CGFloat height = 0;
        
        {
            UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(20, 30, cScreenWidth - 20 - 20 - 70, 30)];
            label1.textAlignment = NSTextAlignmentLeft;
            label1.textColor = cLabColA;
            label1.font = cPfSemibold(24);
            [scrollView addSubview:label1];
            
            NSString *text = [NSString stringWithFormat:@"用户%@ ", [kUser.account substringFromIndex:kUser.account.length - 4]];
            NSTextAttachment * attach= [[NSTextAttachment alloc] init];
            attach.image = [UIImage imageNamed:@"非VIP"];
            attach.bounds = CGRectMake(0, -5, 67, 28);
            NSAttributedString *att = [NSAttributedString attributedStringWithAttachment:attach];
            NSMutableAttributedString *mutableAtt  = [[NSMutableAttributedString alloc] initWithString:text];
            [mutableAtt appendAttributedString:att];
            label1.attributedText = mutableAtt;
            
            UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(20, label1.c_bottom, label1.c_width, 30)];
            label2.textAlignment = NSTextAlignmentLeft;
            label2.textColor = cLabColC;
            label2.font = cPfRegular(14);
            label2.text = @"你不主动，怎么会有故事？";
            [scrollView addSubview:label2];
            
            UIImageView *icon = [[UIImageView alloc] initWithFrame:CGRectMake(cScreenWidth - 20 - 70, label1.c_top, 70, 70)];
            icon.image = [UIImage imageNamed:@"用户头像"];
            icon.contentMode = UIViewContentModeScaleAspectFit;
            cViewRadius(icon, 35)
            [scrollView addSubview:icon];
            height = icon.c_bottom;
        }
        
        {
            UIImageView *icon = [[UIImageView alloc] initWithFrame:CGRectMake(0, height + 10, cScreenWidth, 80)];
            icon.image = [UIImage imageNamed:@"升级VIP"];
            icon.contentMode = UIViewContentModeScaleAspectFit;
            [scrollView addSubview:icon];
            height = icon.c_bottom + 30;
            
            UIButton *button = [[UIButton alloc] initWithFrame:icon.frame];
            cBtnSelector(button, comeVIPAction)
            [scrollView addSubview:button];
        }
        
        for (NSInteger i = 0; i < 4; i++) {
            
            UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, height, cScreenWidth, 60)];
            [scrollView addSubview:button];
            height = button.c_bottom;
            
            UIImageView *icon1 = [[UIImageView alloc] initWithFrame:CGRectMake(15, (button.c_height - 20)/2, 20, 20)];
            icon1.contentMode = UIViewContentModeScaleAspectFit;
            [button addSubview:icon1];
            
            UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(icon1.c_right + 15, 0, 200, button.c_height)];
            label1.textAlignment = NSTextAlignmentLeft;
            label1.textColor = cLabColA;
            label1.font = cPfRegular(14);
            [button addSubview:label1];
            
            UIImageView *icon2 = [[UIImageView alloc] initWithFrame:CGRectMake(button.c_width - 15 - 15, (button.c_height - 15)/2, 15, 15)];
            icon2.image = [UIImage imageNamed:@"jinru"];
            icon2.contentMode = UIViewContentModeScaleAspectFit;
            [button addSubview:icon2];
            
            if (i == 0) {
                icon1.image = cImage(@"我的钻石");
                label1.text = @"我的钻石";
                cBtnSelector(button, button1Action:)
                
            } else if (i == 1) {
                icon1.image = cImage(@"问题反馈");
                label1.text = @"问题反馈";
                cBtnSelector(button, button2Action:)
                
            } else if (i == 2) {
                icon1.image = cImage(@"隐私协议");
                label1.text = @"隐私协议";
                cBtnSelector(button, button3Action:)
                
            } else if (i == 3) {
                icon1.image = cImage(@"退出登录");
                label1.text = @"退出登录";
                cBtnSelector(button, button4Action:)
                
            }
            
        }
        
        
        scrollView.contentSize = CGSizeMake(cScreenWidth, height);
        
    }
    
}




#pragma mark ========================================动作响应=============================================

#pragma mark - 修改资料
- (void)editInfoAction {
    
    [self.navigationController pushViewController:[EditInfoController new] animated:YES];
    
}

#pragma mark - 升级VIP
- (void)comeVIPAction {
    
    [self.navigationController pushViewController:[ComeVIPController new] animated:YES];
    
}

#pragma mark - 我的钻石
- (void)button1Action:(UIButton *)button {
    
    [self.navigationController pushViewController:[MyDiamondsController new] animated:YES];
    
}

#pragma mark - 问题反馈
- (void)button2Action:(UIButton *)button {
    
    [self.navigationController pushViewController:[FeedBackController new] animated:YES];
    
}

#pragma mark - 隐私协议
- (void)button3Action:(UIButton *)button {
    
    [self.navigationController pushViewController:[ProcotolViewController new] animated:YES];
    
}

#pragma mark - 退出登录
- (void)button4Action:(UIButton *)button {
    
    // 弹框提示是否执行
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil
                                                                   message:@"确定要退出登录？"
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消"
                                                     style:UIAlertActionStyleCancel
                                                   handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alert addAction:cancel];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定"
                                              style:UIAlertActionStyleDefault
                                            handler:^(UIAlertAction * _Nonnull action) {
        
        [kUser loginOut];
        [kDelegate goToLogin];
        
    }]];
    
    [self presentViewController:alert animated:YES completion:nil];
    
}

#pragma mark ========================================网络请求=============================================


#pragma mark ========================================代理方法=============================================





















@end
