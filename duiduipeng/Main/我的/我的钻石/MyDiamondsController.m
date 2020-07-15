//
//  MyDiamondsController.m
//  duiduipeng
//
//  Created by CYC on 2020/6/5.
//  Copyright © 2020 Hello. All rights reserved.
//

#import "MyDiamondsController.h"
#import "ContactVIPController.h"

@interface MyDiamondsController ()

@end

@implementation MyDiamondsController

#pragma mark ========================================生命周期========================================
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"我的钻石";
    self.view.backgroundColor = cWhiteColor;
    
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
            UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, cScreenWidth, 100)];
            [scrollView addSubview:view];
            height = view.c_bottom;
            
            UIImageView *icon = [[UIImageView alloc] initWithFrame:view.bounds];
            icon.image = [UIImage imageNamed:@"钻石背景"];
            icon.contentMode = UIViewContentModeScaleToFill;
            [view addSubview:icon];
            
            UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, view.c_width, 40)];
            label1.textAlignment = NSTextAlignmentCenter;
            label1.textColor = cWhiteColor;
            label1.font = DINBold(35);
            label1.text = @"0";
            [view addSubview:label1];
            
            UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(0, label1.c_bottom, view.c_width, 20)];
            label2.textAlignment = NSTextAlignmentCenter;
            label2.textColor = cWhiteColor;
            label2.font = cPfRegular(16);
            label2.text = @"剩余钻石";
            [view addSubview:label2];
        }
        
        {
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, height + 20, cScreenWidth - 40, 20)];
            label.textAlignment = NSTextAlignmentLeft;
            label.textColor = cLabColA;
            label.font = cPfRegular(14);
            label.text = @"支付方式";
            [scrollView addSubview:label];

            UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(20, label.c_bottom + 10, 150, 60)];
            [button setImage:[UIImage imageNamed:@"支付宝支付"] forState:UIControlStateNormal];
            button.imageView.contentMode = UIViewContentModeScaleAspectFit;
            [scrollView addSubview:button];
            height = button.c_bottom;
        }
        
        {
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, height + 20, cScreenWidth - 40, 20)];
            label.textAlignment = NSTextAlignmentLeft;
            label.textColor = cLabColA;
            label.font = cPfRegular(14);
            label.text = @"充值金额";
            [scrollView addSubview:label];
            
            

            CGFloat width = (cScreenWidth - 60)/2;
            for (NSInteger i = 0; i < 10; i++) {
                UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(20 + (width + 20)*(i%2), label.c_bottom + 20 + (70 + 15)*(i/2), width, 70)];
                button.backgroundColor = cLabColA;
                cViewRadius(button, 10)
                button.tag = 100 + i;
                cBtnSelector(button, buttonAction:)
                [scrollView addSubview:button];
                height = button.c_bottom;
                
                UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(0, button.c_height/2 - 15, button.c_width, 20)];
                label1.textAlignment = NSTextAlignmentCenter;
                label1.textColor = cWhiteColor;
                label1.font = cPfMedium(18);
                [button addSubview:label1];
                
                UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(0, label1.c_bottom + 5, button.c_width, 15)];
                label2.textAlignment = NSTextAlignmentCenter;
                label2.textColor = cWhiteColor;
                label2.font = cPfMedium(12);
                [button addSubview:label2];
                
                UILabel *label3 = [[UILabel alloc] initWithFrame:CGRectMake(button.c_width - 80, 0, 80, 18)];
                label3.textAlignment = NSTextAlignmentCenter;
                label3.textColor = cWhiteColor;
                label3.font = cPfRegular(10);
                [button addSubview:label3];
                
                UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:label3.bounds
                                                               byRoundingCorners:UIRectCornerTopRight | UIRectCornerBottomLeft
                                                                     cornerRadii:CGSizeMake(9, 9)];
                CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
                maskLayer.frame = label3.bounds;
                maskLayer.path = maskPath.CGPath;
                label3.layer.mask = maskLayer;
                
                if (i == 0) {
                    label1.text = @"50钻";
                    label2.text = @"5元";
                    label3.text = @"首充体验";
                    label3.backgroundColor = Publie_Color;
                    
                } else if (i == 1) {
                    label1.text = @"100钻";
                    label2.text = @"10元";
                    label3.hidden = YES;
                    
                } else if (i == 2) {
                    label1.text = @"200钻";
                    label2.text = @"20元";
                    label3.hidden = YES;
                    
                } else if (i == 3) {
                    label1.text = @"500钻";
                    label2.text = @"50元";
                    label3.hidden = YES;
                    
                } else if (i == 4) {
                    label1.text = @"1000钻";
                    label2.text = @"98元";
                    label3.hidden = YES;
                    
                } else if (i == 5) {
                    label1.text = @"2000钻";
                    label2.text = @"186元";
                    label3.text = @"最受欢迎";
                    label3.backgroundColor = [UIColor magentaColor];
                    
                } else if (i == 6) {
                    label1.text = @"5000钻";
                    label2.text = @"450元";
                    label3.text = @"最划算";
                    label3.backgroundColor = [UIColor greenColor];
                    
                } else if (i == 7) {
                    label1.text = @"10000钻";
                    label2.text = @"900元";
                    label3.hidden = YES;
                    
                } else if (i == 8) {
                    label1.text = @"20000钻";
                    label2.text = @"1800元";
                    label3.hidden = YES;
                    
                } else if (i == 9) {
                    label1.text = @"99999999钻";
                    label2.text = @"9998元";
                    label3.text = @"土豪专用";
                    label3.backgroundColor = [UIColor orangeColor];
                    button.backgroundColor = cHexColor(0xd0b18c);
                }
            }
        }
        
        {
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, height + 20, cScreenWidth - 40, 20)];
            label.textAlignment = NSTextAlignmentLeft;
            label.textColor = cLabColB;
            label.font = cPfRegular(14);
            label.text = @"钻石用于视频、赠送礼物、查看联系方式、发起表演指令";
            [scrollView addSubview:label];
            height = label.c_bottom;
        }
        
        {
            // 模态弹出的情况下，添加天币按钮
            if (self.navigationController == nil) {
                
                UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake((cScreenWidth - 50)/2, height + 60, 50, 50)];
                [button setImage:[UIImage imageNamed:@"关闭"] forState:UIControlStateNormal];
                cBtnSelector(button, backAction)
                [scrollView addSubview:button];
                height = button.c_bottom + 40;
            }
        }
        
        scrollView.contentSize = CGSizeMake(cScreenWidth, height);
        
    }
    
}



#pragma mark ========================================动作响应=============================================
#pragma mark - 购买
- (void)buttonAction:(UIButton *)button {
    
//    NSInteger tag = button.tag - 100;
    
    
    // 模态弹出的情况下，添加天币按钮
    if (self.navigationController == nil) {
        
        ContactVIPController *ctrl = [ContactVIPController new];
        ctrl.modalPresentationStyle = UIModalPresentationFullScreen;
        [self presentViewController:ctrl animated:YES completion:nil];
    } else {
        
        [self.navigationController pushViewController:[ContactVIPController new] animated:YES];
    }
    
}


#pragma mark - 模态弹出的退出动作
- (void)backAction {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}


#pragma mark ========================================网络请求=============================================


#pragma mark ========================================代理方法=============================================





















@end
