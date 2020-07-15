//
//  TabBarViewController.m
//  HelloWorld
//
//  Created by MAC on 2019/3/1.
//  Copyright © 2019 MAC. All rights reserved.
//

#import "TabBarViewController.h"

#import "View1Controller.h"
#import "View2Controller.h"
#import "View3Controller.h"
#import "View4Controller.h"

#import "BaseRTNavigationController.h"
#import "CTabBarItem.h"
#import "ScreenTextMessageView.h"
#import "ScreenCallMessageView.h"
#import "MyDiamondsController.h"


@interface TabBarViewController ()<UITabBarDelegate>

@property (strong, nonatomic) CTabBarItem *button1;
@property (strong, nonatomic) CTabBarItem *button2;
@property (strong, nonatomic) CTabBarItem *button3;
@property (strong, nonatomic) CTabBarItem *button4;
@property (strong, nonatomic) CTimer *timer;
@property (assign, nonatomic) BOOL isShowCall;          // 是否正在显示拨号弹窗

@end

@implementation TabBarViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self addChildViewController:[[BaseRTNavigationController alloc] initWithRootViewController:[View1Controller new]]];
    [self addChildViewController:[[BaseRTNavigationController alloc] initWithRootViewController:[View2Controller new]]];
    [self addChildViewController:[[BaseRTNavigationController alloc] initWithRootViewController:[View3Controller new]]];
    [self addChildViewController:[[BaseRTNavigationController alloc] initWithRootViewController:[View4Controller new]]];

    self.delegate=self;    
    self.tabBar.barTintColor = cWhiteColor;
    
    UIView *line= [[UIView alloc] initWithFrame:CGRectMake(0, -1, cScreenWidth, 1)];
    line.backgroundColor = cWhiteColor;
    [self.tabBar addSubview:line];

    // 黑色主题
    if (@available(iOS 13.0, *)) {
        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDarkContent;
    } else {
        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
    }
    
 
    [self creatTabBarUIAction];
    
    // CYC666 调节弹窗显示的频率
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        _timer = [[CTimer alloc] initWithFireTime:30
                                         interval:30
                                           target:self
                                         selector:@selector(timerAction:)
                                          repeats:YES];
        [_timer fire];
    });
    
    // 添加监听刷新的通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadUnreadAction:) name:kReloadUnreadNumber object:nil];
}
- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    
    [self updateUIAction];
    
    
}

#pragma mark - 切换标签
- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.05 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self updateUIAction];
    });
}

#pragma mark - 创建新的tabbar
- (void)creatTabBarUIAction {
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, cScreenWidth, cTabHeight)];
    view.backgroundColor = cWhiteColor;
    [self.tabBar addSubview:view];
    

    CGFloat widthX = view.c_width / 4;
    CGFloat height = 49;
    for (NSInteger i = 0; i < 4; i++) {
        
        CTabBarItem *item = [[CTabBarItem alloc] initWithFrame:CGRectMake(widthX * i, 0, widthX, height)];
        item.tag = 100 + i;
        item.numLabel.hidden = YES;
        [item addTarget:self action:@selector(buttonItemAction:) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:item];
        
        if (i == 0) {
            _button1 = item;
        } else if (i == 1) {
            _button2 = item;
        } else if (i == 2) {
            _button3 = item;
        } else if (i == 3) {
            _button4 = item;
        }
    }
}

#pragma mark - 点击标签
- (void)buttonItemAction:(UIButton *)button {
    
    self.selectedIndex = button.tag - 100;
    
    [self updateUIAction];
}

#pragma mark - 刷新UI
- (void)updateUIAction {
    
    UIColor *nColor = cHexColor(0x999999);
    UIColor *sColor = Publie_Color;
    
    _button1.label.text = RCDLocalizedString(@"推荐");
    _button2.label.text = RCDLocalizedString(@"动态");
    _button3.label.text = RCDLocalizedString(@"消息");
    _button4.label.text = RCDLocalizedString(@"我的");
    
    
    if (self.selectedIndex == 0) {
        
        _button1.label.textColor = sColor;
        _button2.label.textColor = nColor;
        _button3.label.textColor = nColor;
        _button4.label.textColor = nColor;
        _button1.icon.image = cImage(@"htab1s");
        _button2.icon.image = cImage(@"htab2");
        _button3.icon.image = cImage(@"htab3");
        _button4.icon.image = cImage(@"htab4");
        
    } else if (self.selectedIndex == 1) {
        
        _button1.label.textColor = nColor;
        _button2.label.textColor = sColor;
        _button3.label.textColor = nColor;
        _button4.label.textColor = nColor;
        _button1.icon.image = cImage(@"htab1");
        _button2.icon.image = cImage(@"htab2s");
        _button3.icon.image = cImage(@"htab3");
        _button4.icon.image = cImage(@"htab4");
        
    } else if (self.selectedIndex == 2) {
        
        _button1.label.textColor = nColor;
        _button2.label.textColor = nColor;
        _button3.label.textColor = sColor;
        _button4.label.textColor = nColor;
        _button1.icon.image = cImage(@"htab1");
        _button2.icon.image = cImage(@"htab2");
        _button3.icon.image = cImage(@"htab3s");
        _button4.icon.image = cImage(@"htab4");
        
    } else if (self.selectedIndex == 3) {
        
        _button1.label.textColor = nColor;
        _button2.label.textColor = nColor;
        _button3.label.textColor = nColor;
        _button4.label.textColor = sColor;
        _button1.icon.image = cImage(@"htab1");
        _button2.icon.image = cImage(@"htab2");
        _button3.icon.image = cImage(@"htab3");
        _button4.icon.image = cImage(@"htab4s");
        
    }
    
}

#pragma mark - 定时器响应,弹出全屏消息
- (void)timerAction:(CTimer *)timer {
    
    // 如果正在显示通话弹窗，那么不做操作
    if (_isShowCall) {
        return;
    }
    
    // 确定本次该显示通话还是文本
    BOOL showCall = NO;
    if (arc4random() % 10 == 8) {
        showCall = YES;
    }
    
    
    if (!showCall) {
        
        
        // 显示文本消息弹窗
        _isShowCall = NO;
        
        // 1、确定男生头像和名字
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"动态列表" ofType:@"json"];
        NSData *data = [NSData dataWithContentsOfFile:filePath];
        
        NSError *error = nil;
        NSArray *items = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        
        NSMutableArray *boys = [NSMutableArray array];
        for (NSDictionary *dic in items) {
            NSString *sex = [NSString stringWithFormat:@"%@", dic[@"user_info"][@"sex"]];
            if ([sex isEqualToString:@"1"]) {
                [boys addObject:dic];
            }
        }
        
        NSDictionary *model = boys[arc4random() % boys.count];
        NSString *avatar = [NSString stringWithFormat:@"%@", model[@"user_info"][@"avatar"]];
        NSString *name = [NSString stringWithFormat:@"%@", model[@"user_info"][@"nickname"]];
        if (name.length > 4) {
            name = [NSString stringWithFormat:@"%@...", [name substringToIndex:4]];
        }

        // 2、确定操作
        NSArray *list = @[@"升级了VIP",
                          @"购买了100钻石",
                          @"购买了100钻石",
                          @"购买了100钻石",
                          @"购买了100钻石",
                          @"购买了200钻石",
                          @"购买了200钻石",
                          @"购买了200钻石",
                          @"购买了200钻石",
                          @"购买了500钻石",
                          @"购买了500钻石",
                          @"购买了500钻石",
                          @"购买了1000钻石",
                          @"购买了1000钻石",
                          @"购买了2000钻石",
                          @"购买了10000钻石",
                          @"购买了20000钻石"
                        ];
        NSString *text = list[arc4random() % list.count];
        
        ScreenTextMessageView *tip = [ScreenTextMessageView new];
        tip.dic = @{@"avatar" : avatar, @"name" : name, @"text" : text};
    } else {
        
        // 显示通话弹窗消息
        _isShowCall = YES;
        
        // 1、确定女生信息
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"私密空间" ofType:@"json"];
        NSData *data = [NSData dataWithContentsOfFile:filePath];
        
        NSError *error = nil;
        NSArray *items = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        
        NSDictionary *model = items[arc4random() % items.count];
        ScreenCallMessageView *tipView = [ScreenCallMessageView new];
        tipView.model = model;
        __weak typeof(self) weakSelf = self;
        tipView.sureBlock = ^(NSInteger flag) {
            
            if (flag == 0) {
                
                // 挂断
                
            } else if (flag == 1) {
                
                // 接通
                [weakSelf showBuyAction];
            }
            
            weakSelf.isShowCall = NO;
            
        };
        
    }
    
}

#pragma mark - 提示钻石不足，需要购买
- (void)showBuyAction {
    
    // 弹框提示是否执行
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"你的钻石余额不足"
                                                                   message:@"需要了解最新的充值优惠吗？"
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消"
                                                     style:UIAlertActionStyleCancel
                                                   handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alert addAction:cancel];
    [alert addAction:[UIAlertAction actionWithTitle:@"购买钻石"
                                              style:UIAlertActionStyleDefault
                                            handler:^(UIAlertAction * _Nonnull action) {
        
        [self presentViewController:[MyDiamondsController new] animated:YES completion:nil];
        
    }]];
    
    [self presentViewController:alert animated:YES completion:nil];
    
}


#pragma mark ========================================通知=============================================

#pragma mark - 更新未读消息的通知
- (void)reloadUnreadAction:(NSNotification *)notifi {
    
    NSArray *list = [kData getAllMessage];
    NSInteger count = 0;
    for (MessageModel *model in list) {
        
        count += model.unRead.integerValue;
    }

    _button3.numLabel.text = [NSString stringWithFormat:@"%ld", count];
    if (count > 0) {
        _button3.numLabel.hidden = NO;
    } else {
        _button3.numLabel.hidden = YES;
    }
    
}


@end
