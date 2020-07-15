//
//  ZoneListCell.m
//  duiduipeng
//
//  Created by CYC on 2020/6/4.
//  Copyright © 2020 Hello. All rights reserved.
//

#import "ZoneListCell.h"

@implementation ZoneListCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.backgroundColor = [UIColor clearColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self creatUIAction];
        
    }
    return self;
    
}

#pragma mark - 创建UI
- (void)creatUIAction {
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(10, 10, cScreenWidth - 20, 330 - 10)];
    view.backgroundColor = cWhiteColor;
    view.layer.cornerRadius = 5;
    [self addSubview:view];
    
    UIImageView *icon1 = [[UIImageView alloc] initWithFrame:CGRectMake(20, 20, 60, 60)];
    icon1.contentMode = UIViewContentModeScaleAspectFit;
    cViewRadius(icon1, 30)
    [view addSubview:icon1];
    _icon1 = icon1;
    
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(icon1.c_right + 10, icon1.c_top, view.c_width - icon1.c_right - 20, 20)];
    label1.textAlignment = NSTextAlignmentLeft;
    label1.textColor = cLabColA;
    label1.font = cPfRegular(16);
    [view addSubview:label1];
    _label1 = label1;
    
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(icon1.c_right + 10, label1.c_bottom + 5, view.c_width - icon1.c_right - 20, 15)];
    label2.textAlignment = NSTextAlignmentLeft;
    label2.textColor = cLabColC;
    label2.font = cPfRegular(12);
    [view addSubview:label2];
    _label2 = label2;
    
    UILabel *label3 = [[UILabel alloc] initWithFrame:CGRectMake(20, icon1.c_bottom + 10, view.c_width - 40, 20)];
    label3.textAlignment = NSTextAlignmentLeft;
    label3.textColor = cLabColA;
    label3.font = cPfRegular(14);
    [view addSubview:label3];
    _label3 = label3;
    
    UIImageView *icon2 = [[UIImageView alloc] initWithFrame:CGRectMake(20, label3.c_bottom + 10, 140, 150)];
    icon2.contentMode = UIViewContentModeScaleAspectFill;
    icon2.clipsToBounds = YES;
    [view addSubview:icon2];
    _icon2 = icon2;
    
    UIButton *button1 = [[UIButton alloc] initWithFrame:CGRectMake(20, icon2.c_bottom + 5, 50, 30)];
    button1.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [view addSubview:button1];
    _button1 = button1;
    
    UIButton *button2 = [[UIButton alloc] initWithFrame:CGRectMake(button1.c_right + 10, icon2.c_bottom + 5, 50, 30)];
    button2.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [view addSubview:button2];
    _button2 = button2;
    
    
}

- (void)setModel:(NSDictionary *)model {
    
    _model = model;
    
    [_icon1 sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@", KIURL, model[@"user_info"][@"avatar"]]]];
    [_icon2 sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@", KIURL, model[@"info"]]]];
    _label1.text = [NSString stringWithFormat:@"%@", model[@"user_info"][@"nickname"]];
    _label2.text = [NSString stringWithFormat:@"%@", model[@"user_info"][@"sign"]];
    _label3.text = [NSString stringWithFormat:@"%@", model[@"content"]];

    {
        NSString *comment_num = [NSString stringWithFormat:@"%@", model[@"comment_num"]];
        NSMutableAttributedString *mutableAtt  = [[NSMutableAttributedString alloc] initWithString:comment_num];
        [mutableAtt addAttribute:NSFontAttributeName value:cPfRegular(12) range:NSMakeRange(0, comment_num.length)];
        [mutableAtt addAttribute:NSForegroundColorAttributeName value:cLabColB range:NSMakeRange(0, comment_num.length)];
        NSTextAttachment * attach= [[NSTextAttachment alloc] init];
        attach.image = [UIImage imageNamed:@"评论"];
        attach.bounds = CGRectMake(0, -10, 20, 20);
        NSAttributedString *att = [NSAttributedString attributedStringWithAttachment:attach];
        [mutableAtt insertAttributedString:att atIndex:0];
        [_button1 setAttributedTitle:mutableAtt forState:UIControlStateNormal];
    }
    
    {
        NSString *like_num = [NSString stringWithFormat:@"%@", model[@"comment_num"]];
        NSMutableAttributedString *mutableAtt  = [[NSMutableAttributedString alloc] initWithString:like_num];
        [mutableAtt addAttribute:NSFontAttributeName value:cPfRegular(12) range:NSMakeRange(0, like_num.length)];
        [mutableAtt addAttribute:NSForegroundColorAttributeName value:cLabColB range:NSMakeRange(0, like_num.length)];
        NSTextAttachment * attach= [[NSTextAttachment alloc] init];
        attach.image = [UIImage imageNamed:@"点赞"];
        attach.bounds = CGRectMake(0, -10, 20, 20);
        NSAttributedString *att = [NSAttributedString attributedStringWithAttachment:attach];
        [mutableAtt insertAttributedString:att atIndex:0];
        [_button2 setAttributedTitle:mutableAtt forState:UIControlStateNormal];
    }
}


@end
