//
//  LoginViewController.m
//  NewsProject
//
//  Created by CYC on 2020/5/26.
//  Copyright © 2020 oig. All rights reserved.
//

#import "LoginViewController.h"
#import "TabbarViewController.h"
#import "RegistViewController.h"
#import "ProcotolViewController.h"

@interface LoginViewController ()

@property (weak, nonatomic) IBOutlet UITextField *field1;
@property (weak, nonatomic) IBOutlet UITextField *field2;
@property (strong, nonatomic) UIScrollView *scrollView;
@property (strong, nonatomic) CTimer *timer;
@property (assign, nonatomic) BOOL isDown;
@property (assign, nonatomic) BOOL isAgree;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"登录";
    self.navigationController.navigationBar.hidden = YES;
    
//    _field1.text = @"13700009999";
//    _field2.text = @"123456";
    
    NSString *text1 = _field1.placeholder;
    NSMutableAttributedString *string1 = [[NSMutableAttributedString alloc] initWithString:text1];
    [string1 addAttribute:NSForegroundColorAttributeName value:cWhiteColor range:NSMakeRange(0, text1.length)];
    _field1.attributedPlaceholder = string1;
    
    NSString *text2 = _field2.placeholder;
    NSMutableAttributedString *string2 = [[NSMutableAttributedString alloc] initWithString:text2];
    [string2 addAttribute:NSForegroundColorAttributeName value:cWhiteColor range:NSMakeRange(0, text2.length)];
    _field2.attributedPlaceholder = string2;
    
    // 添加底部图片
    UIScrollView *scView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, cScreenWidth, cScreenHeight)];
    _scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    [self.view insertSubview:scView atIndex:0];
    _scrollView = scView;
    
    UIImageView *icon = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, cScreenWidth, cScreenWidth * 4092 / 1024.0)];
    icon.image = [UIImage imageNamed:@"启动页"];
    icon.contentMode = UIViewContentModeScaleAspectFill;
    [scView addSubview:icon];
    
    scView.contentSize = CGSizeMake(cScreenWidth, icon.c_height);
    scView.userInteractionEnabled = NO;
    
    
    // 定时器
    _timer = [[CTimer alloc] initWithFireTime:0
                                     interval:0.05
                                       target:self
                                     selector:@selector(timerAction:)
                                      repeats:YES];
    [_timer fire];
    
    
    
}

#pragma mark - 定时器响应
- (void)timerAction:(CTimer *)timer {
    
    if (_scrollView.contentOffset.y<= 0) {
        _isDown = NO;
    } else if (_scrollView.contentOffset.y >= _scrollView.contentSize.height - cScreenHeight) {
        _isDown = YES;
    }
    
    if (_isDown) {
        _scrollView.contentOffset = CGPointMake(0, _scrollView.contentOffset.y - 1);
    } else {
        _scrollView.contentOffset = CGPointMake(0, _scrollView.contentOffset.y + 1);
    }
    
    
}


- (IBAction)loginButtonAction:(id)sender {
    
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
    
    if (cStrEmpty(_field1.text)) {
        [self.view makeToast:@"请输入账号"];
        return;
    }
    
    if (cStrEmpty(_field2.text)) {
        [self.view makeToast:@"请输入密码"];
        return;
    }
    
    
    for (NSDictionary *dic in kUser.list2) {
        
        NSString *account = [NSString stringWithFormat:@"%@", dic[@"account"]];
        NSString *password = [NSString stringWithFormat:@"%@", dic[@"password"]];
        
        if ([_field1.text isEqualToString:account] && [_field2.text isEqualToString:password]) {
            kUser.account = _field1.text;
            kUser.password = _field2.text;
        }
    }
    
    if (!cStrEmpty(kUser.account) && !cStrEmpty(kUser.password)) {
        
        [cDefault setValue:_field1.text forKey:@"account"];
        [cDefault setValue:_field2.text forKey:@"password"];
        [cDefault synchronize];
        MBPS(self.view)
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            MBPH(self.view)
            
            [self.view makeToast:@"登陆成功"];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                
                [kDelegate goToMain];
            });
            
        });
    } else {
        [self.view makeToast:@"账号或密码错误"];
    }
    
    
}

- (IBAction)procotolAction:(id)sender {
    [self.navigationController pushViewController:[ProcotolViewController new] animated:YES];
}

- (IBAction)agreeAction:(UIButton *)sender {
    
    _isAgree = !_isAgree;
    
    if (!_isAgree) {
        cBtnTitle(sender, @"☑️ 查看并同意")
    } else {
        cBtnTitle(sender, @"🔘 查看并同意")
    }
    
}

































@end
