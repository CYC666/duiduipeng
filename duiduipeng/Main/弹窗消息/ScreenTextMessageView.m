//
//  ScreenTextMessageView.m
//  duiduipeng
//
//  Created by CYC on 2020/6/5.
//  Copyright © 2020 Hello. All rights reserved.
//

#import "ScreenTextMessageView.h"


@interface ScreenTextMessageView ()


@end

@implementation ScreenTextMessageView



#pragma mark ========================================生命周期========================================
+ (instancetype)new {
    
    ScreenTextMessageView *view = [[ScreenTextMessageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    view.userInteractionEnabled = NO;
    [[UIApplication sharedApplication].keyWindow addSubview:view];
    
    return view;
}



- (void)setDic:(NSDictionary *)dic {
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(cScreenWidth, 200 + arc4random() % 100, 300, 50)];
    view.backgroundColor = cRGB(0, 0, 0, 0.6);
    [self addSubview:view];
    
    view.layer.cornerRadius = 25;
    view.layer.shadowOffset = CGSizeMake(0, 0);
    view.layer.shadowRadius = 5;
    view.layer.shadowOpacity = 0.3;
    view.layer.shadowColor = cBlackColor.CGColor;
    
    UIImageView *icon = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 40, 40)];
    icon.image = [UIImage imageNamed:@"用户头像"];
    icon.contentMode = UIViewContentModeScaleAspectFit;
    cViewRadius(icon, 20)
    [view addSubview:icon];
    NSString *avatar = [NSString stringWithFormat:@"%@", dic[@"avatar"]];
    [icon sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@", KIURL, avatar]]];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(icon.c_right + 5, 0, view.c_width - icon.c_right - 20, view.c_height)];
    label.textAlignment = NSTextAlignmentLeft;
    label.textColor = cWhiteColor;
    label.font = cPfRegular(18);
    [view addSubview:label];
    
    NSString *text1 = [NSString stringWithFormat:@"%@", dic[@"name"]];
    NSString *text2 = [NSString stringWithFormat:@"%@", dic[@"text"]];
    NSString *text3 = [NSString stringWithFormat:@"%@ %@", text1, text2];
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:text3];
    [string addAttribute:NSFontAttributeName value:cPfMedium(18) range:[text3 rangeOfString:text1]];
    [string addAttribute:NSForegroundColorAttributeName value:cHexColor(0xf7c439) range:[text3 rangeOfString:text1]];
    label.attributedText = string;
    
    
    [UIView animateWithDuration:5 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        
        view.transform = CGAffineTransformMakeTranslation(-cScreenWidth - view.c_width, 0);

    } completion:^(BOOL finished) {
        
    }];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(6 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self backAction];
    });
    
    
}



#pragma mark ========================================动作响应=============================================

#pragma mark - 退出
- (void)backAction {
    
    [self removeFromSuperview];
    
}


@end
