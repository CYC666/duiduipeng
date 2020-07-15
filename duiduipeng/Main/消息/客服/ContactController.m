//
//  ContactController.m
//  duiduipeng
//
//  Created by CYC on 2020/6/5.
//  Copyright © 2020 Hello. All rights reserved.
//

#import "ContactController.h"

@interface ContactController () <UITextFieldDelegate>

@property (strong, nonatomic) UITextField *field;

@end

@implementation ContactController

#pragma mark ========================================生命周期========================================
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"我的客服";
    self.view.backgroundColor = Background_Color;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardWillShowNotification:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardNotification:) name:UIKeyboardWillHideNotification object:nil];
    
    [self creatUIAction];
}

#pragma mark - 创建UI
- (void)creatUIAction {
    
    {
        UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, cScreenWidth, cScreenHeight - cNavHeight - cTabHeight)];
        scrollView.alwaysBounceVertical = YES;
        scrollView.showsVerticalScrollIndicator = NO;
        [self.view addSubview:scrollView];
        
        
        CGFloat height = 0;
        
        {
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, cScreenWidth, 20)];
            label.textAlignment = NSTextAlignmentCenter;
            label.textColor = cLabColC;
            label.font = cPfRegular(10);
            label.text = @"没有更多聊天记录";
            [scrollView addSubview:label];
            height = label.c_bottom;
        }
        
        {
            UIImageView *icon = [[UIImageView alloc] initWithFrame:CGRectMake(10, height + 10, 40, 40)];
            icon.image = [UIImage imageNamed:@"客服头像"];
            icon.contentMode = UIViewContentModeScaleAspectFit;
            cViewRadius(icon, 20)
            [scrollView addSubview:icon];


            NSString *text = @"Hi，欢迎加入，这里是一款汇聚各路美女的一对一视频交友神器。这里有清新小萝莉，俏皮萌妹子，知性御姐范，清纯校花妹，性感小嫩模...总有一个让你怦然心动，满足你的所有需求，听你指挥，陪你解闷，一起愉快的嗨皮吧！";
            CGSize size = [text boundingRectWithSize:CGSizeMake(240, MAXFLOAT)
                                             options:NSStringDrawingUsesLineFragmentOrigin
                                          attributes:@{NSFontAttributeName:cPfRegular(14)}
                                             context:nil].size;
            
            UIView *view = [[UIView alloc] initWithFrame:CGRectMake(icon.c_right + 10, icon.c_top, 240 + 30, size.height + 20)];
            view.backgroundColor = cWhiteColor;
            cViewRadius(view, 15)
            [scrollView addSubview:view];
            height = view.c_bottom;
            
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(15, 10, 240, size.height)];
            label.textAlignment = NSTextAlignmentLeft;
            label.textColor = cLabColA;
            label.font = cPfRegular(14);
            label.text = text;
            label.numberOfLines = 0;
            [view addSubview:label];
        }
        
        
        scrollView.contentSize = CGSizeMake(cScreenWidth, height);
        
    }
    
    {
        // 输入栏
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, cScreenHeight - cNavHeight - cTabHeight, cScreenWidth, cTabHeight)];
        view.backgroundColor = cWhiteColor;
        [self.view addSubview:view];
        
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(view.c_width - 5 - 30, (49 - 30)/2, 30, 30)];
        [button setImage:[UIImage imageNamed:@"加号"] forState:UIControlStateNormal];
        [view addSubview:button];
        
        UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(5, 5, button.c_left - 10, 49 - 10)];
        view1.backgroundColor = Background_Color;
        cViewRadius(view1, 5)
        [view addSubview:view1];
        
        UITextField *field = [[UITextField alloc] initWithFrame:CGRectMake(5, 0, view1.c_width - 10, view1.c_height)];
        field.font = cPfRegular(14);
        field.textColor = cLabColA;
        field.clearButtonMode = UITextFieldViewModeWhileEditing;
        field.placeholder = @"输入反馈内容";
        field.returnKeyType = UIReturnKeySend;
        field.delegate = self;
        [view1 addSubview:field];
        _field = field;
    }
    
}




#pragma mark ========================================动作响应=============================================


#pragma mark ========================================网络请求=============================================


#pragma mark ========================================代理方法=============================================
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
    
    return 1;
}

#pragma mark ========================================通知=============================================
#pragma mark - 键盘消息
- (void)keyBoardWillShowNotification:(NSNotification *)notifi {
    
    CGRect rect = [[notifi.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    _field.superview.superview.transform = CGAffineTransformMakeTranslation(0, -rect.size.height);
    
}

- (void)keyBoardNotification:(NSNotification *)notifi {
    
    _field.superview.superview.transform = CGAffineTransformMakeTranslation(0, 0);
    
    
}


















@end
