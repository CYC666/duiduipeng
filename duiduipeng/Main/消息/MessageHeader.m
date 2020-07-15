//
//  MessageHeader.m
//  duiduipeng
//
//  Created by CYC on 2020/6/5.
//  Copyright © 2020 Hello. All rights reserved.
//

#import "MessageHeader.h"

@implementation MessageHeader

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        [self creatUIAction];
        
    }
    return self;
    
}

#pragma mark - 创建UI
- (void)creatUIAction {
    
    
    CGFloat width = cScreenWidth / 3.0;
    for (NSInteger i = 0; i < 3; i++) {
        
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(width*i, 0, width, self.c_height)];
        [self addSubview:button];
        
        UIImageView *icon = [[UIImageView alloc] initWithFrame:CGRectMake((button.c_width - 40)/2, 15, 40, 40)];
        icon.contentMode = UIViewContentModeScaleAspectFit;
        icon.backgroundColor = cWhiteColor;
        [button addSubview:icon];
        
        icon.layer.cornerRadius = 20;
        icon.layer.shadowOffset = CGSizeMake(0, 0);
        icon.layer.shadowRadius = 5;
        icon.layer.shadowOpacity = 1;
        icon.layer.shadowColor = Background_Color.CGColor;
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, icon.c_bottom + 5, button.c_width, 15)];
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = cLabColC;
        label.font = cPfRegular(12);
        [button addSubview:label];
        
        if (i == 0) {
            icon.image = cImage(@"客服");
            label.text = @"我的客服";
            _button1 = button;
        } else if (i == 1) {
            icon.image = cImage(@"关注");
            label.text = @"我的关注";
            _button2 = button;
        } else if (i == 2) {
            icon.image = cImage(@"粉丝");
            label.text = @"我的粉丝";
            _button3 = button;
        }
    }
    
}

@end
