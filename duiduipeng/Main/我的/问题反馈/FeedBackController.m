//
//  FeedBackController.m
//  duiduipeng
//
//  Created by CYC on 2020/6/5.
//  Copyright © 2020 Hello. All rights reserved.
//

#import "FeedBackController.h"
#import "ContactController.h"

@interface FeedBackController () <UITextViewDelegate>

@property (strong, nonatomic) UITextView *textView;
@property (strong, nonatomic) UILabel *label;

@end

@implementation FeedBackController

#pragma mark ========================================生命周期========================================
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"问题反馈";
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
            UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(20, 20, cScreenWidth - 40, 200)];
            textView.textColor = cLabColA;
            textView.font = cPfRegular(16);
            textView.delegate = self;
            [scrollView addSubview:textView];
            height = textView.c_bottom;
            _textView = textView;
            
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, textView.c_width - 10, 20)];
            label.textAlignment = NSTextAlignmentLeft;
            label.textColor = cLabColC;
            label.font = cPfRegular(16);
            label.text = @"请输入反馈内容";
            label.userInteractionEnabled = NO;
            [textView addSubview:label];
            _label = label;
        }
        
        {
            UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(20, height + 60, cScreenWidth - 40, 50)];
            cBtnFont(button, cPfMedium(16))
            cBtnColor(button, cWhiteColor)
            cBtnTitle(button, @"提交")
            cViewRadius(button, 5)
            cBtnSelector(button, button1Action:)
            button.backgroundColor = Publie_Color;
            [scrollView addSubview:button];
            height = button.c_bottom;
        }
        
        {
            UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(20, height, cScreenWidth - 40, 40)];
            cBtnFont(button, cPfRegular(14))
            cBtnColor(button, cLabColC)
            cBtnSelector(button, button2Action:)
            button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
            [scrollView addSubview:button];
            height = button.c_bottom;
            
            NSString *text1 = @"您也可以通过在线客服反馈问题";
            NSString *text2 = @"在线客服";
            NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:text1];
            [string addAttribute:NSForegroundColorAttributeName value:Publie_Color range:[text1 rangeOfString:text2]];
            [button setAttributedTitle:string forState:UIControlStateNormal];
        }
        
        scrollView.contentSize = CGSizeMake(cScreenWidth, height);
        
    }
    
}




#pragma mark ========================================动作响应=============================================

#pragma mark - 提交
- (void)button1Action:(UIButton *)button {
    
    if (cStrEmpty(_textView.text)) {
        [self.view makeToast:@"请输入反馈内容"];
        return;
    }
    
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
    
    MBPS(self.view)
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [self.view makeToast:@"反馈提交成功，感谢您的宝贵意见"];
        MBPH(self.view)
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.navigationController popViewControllerAnimated:YES];
        });
    });
    
}

#pragma mark - 客服
- (void)button2Action:(UIButton *)button {
    
    [self.navigationController pushViewController:[ContactController new] animated:YES];
    
}

#pragma mark ========================================网络请求=============================================


#pragma mark ========================================代理方法=============================================

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView {
    
    _label.hidden = YES;
    
    return 1;
}
- (BOOL)textViewShouldEndEditing:(UITextView *)textView {
    
    if ([textView.text isEqualToString:@""]) {
        _label.hidden = NO;
    } else {
        _label.hidden = YES;
    }
    
    return 1;
}



















@end
