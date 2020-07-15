//
//  EditInfoController.m
//  duiduipeng
//
//  Created by CYC on 2020/6/5.
//  Copyright © 2020 Hello. All rights reserved.
//

#import "EditInfoController.h"
#import "ComeVIPController.h"

@interface EditInfoController ()

@end

@implementation EditInfoController

#pragma mark ========================================生命周期========================================
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"修改资料";
    self.view.backgroundColor = cWhiteColor;
    
    [self creatUIAction];
}

#pragma mark - 创建UI
- (void)creatUIAction {
    
    {
        UIView *line= [[UIView alloc] initWithFrame:CGRectMake(0,  0, cScreenWidth, 1)];
        line.backgroundColor = Background_Color;
        [self.view addSubview:line];
    }
    
    {
        UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, cScreenWidth, cScreenHeight - cNavHeight)];
        scrollView.alwaysBounceVertical = YES;
        scrollView.showsVerticalScrollIndicator = NO;
        [self.view addSubview:scrollView];
        
        
        CGFloat height = 0;
        
        for (NSInteger i = 0; i < 8; i++) {
            
            UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, height, cScreenWidth, 50)];
            cBtnSelector(button, buttonAction:)
            [scrollView addSubview:button];
            height = button.c_bottom;
            
            UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, 80, button.c_height)];
            label1.textAlignment = NSTextAlignmentLeft;
            label1.textColor = cLabColA;
            label1.font = cPfRegular(14);
            [button addSubview:label1];
            
            UIImageView *icon1 = [[UIImageView alloc] initWithFrame:CGRectMake(button.c_width - 15 - 15, (button.c_height - 15)/2, 15, 15)];
            icon1.image = [UIImage imageNamed:@"jinru"];
            icon1.contentMode = UIViewContentModeScaleAspectFit;
            [button addSubview:icon1];
            
            UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(icon1.c_left - 15 - 100, 0, 100, button.c_height)];
            label2.textAlignment = NSTextAlignmentRight;
            label2.textColor = cLabColC;
            label2.font = cPfRegular(12);
            [button addSubview:label2];
            
            UIView *line= [[UIView alloc] initWithFrame:CGRectMake(15, button.c_height - 1, button.c_width - 30, 1)];
            line.backgroundColor = Background_Color;
            [button addSubview:line];
            
            if (i == 0) {
                label1.text = @"头像";
                label2.text = @"";
                
                UIImageView *icon2 = [[UIImageView alloc] initWithFrame:CGRectMake(icon1.c_left - 15 - 30, (button.c_height - 30)/2, 30, 30)];
                icon2.image = [UIImage imageNamed:@"用户头像"];
                cViewRadius(icon2, 15)
                icon2.contentMode = UIViewContentModeScaleAspectFit;
                [button addSubview:icon2];
                
            } else if (i == 1) {
                label1.text = @"昵称";
                label2.text = [NSString stringWithFormat:@"用户%@", [kUser.account substringFromIndex:kUser.account.length - 4]];
                label2.textColor = cLabColA;
            } else if (i == 2) {
                label1.text = @"生日";
                label2.text = @"待完善";
            } else if (i == 3) {
                label1.text = @"身高";
                label2.text = @"待完善";
            } else if (i == 4) {
                label1.text = @"体重";
                label2.text = @"待完善";
            } else if (i == 5) {
                label1.text = @"职业";
                label2.text = @"待完善";
            } else if (i == 6) {
                label1.text = @"常住地";
                label2.text = @"待完善";
            } else if (i == 7) {
                label1.text = @"个性签名";
                label2.text = @"待完善";
            }
        }
        
        {
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(15, height + 10, cScreenWidth - 40, 40)];
            label.textAlignment = NSTextAlignmentLeft;
            label.textColor = cLabColC;
            label.font = cPfRegular(12);
            label.text = @"注意：性别一旦确认将无法再次修改，请勿频繁更换头像和昵称。";
            label.numberOfLines = 2;
            [scrollView addSubview:label];
            height = label.c_bottom;
        }
        
        scrollView.contentSize = CGSizeMake(cScreenWidth, height);
        
    }
    
    // 服务器集中管理
    // 私有云
    
}


- (void)buttonAction:(UIButton *)button {
    
    // 弹框提示是否执行
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"你目前不是VIP"
                                                                   message:@"升级VIP可以编辑个人资料"
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消"
                                                     style:UIAlertActionStyleCancel
                                                   handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alert addAction:cancel];
    [alert addAction:[UIAlertAction actionWithTitle:@"升级VIP"
                                              style:UIAlertActionStyleDefault
                                            handler:^(UIAlertAction * _Nonnull action) {
        
        [self.navigationController pushViewController:[ComeVIPController new] animated:YES];
        
    }]];
    
    [self presentViewController:alert animated:YES completion:nil];
    
}


#pragma mark ========================================动作响应=============================================


#pragma mark ========================================网络请求=============================================


#pragma mark ========================================代理方法=============================================





















@end
