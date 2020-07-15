//
//  HomeListCell.m
//  duiduipeng
//
//  Created by CYC on 2020/6/4.
//  Copyright © 2020 Hello. All rights reserved.
//

#import "HomeListCell.h"

@implementation HomeListCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self creatUIAction];
        
    }
    return self;
    
}

#pragma mark - 创建UI
- (void)creatUIAction {
    
    
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(10, 10, cScreenWidth - 20, 300 - 10)];
    view.backgroundColor = cBlackColor;
    cViewShadow(view, 3, 3, 5, 1, Background_Color)
    view.layer.cornerRadius = 5;
    [self addSubview:view];
    
    UIImageView *icon0 = [[UIImageView alloc] initWithFrame:view.bounds];
    icon0.contentMode = UIViewContentModeScaleAspectFill;
    cViewRadius(icon0, 5)
    [view addSubview:icon0];
    _icon = icon0;
    
    
    UIImageView *icon1 = [[UIImageView alloc] initWithFrame:view.bounds];
    icon1.image = [UIImage imageNamed:@"阴影"];
    icon1.contentMode = UIViewContentModeScaleToFill;
    cViewRadius(icon1, 5)
    [view addSubview:icon1];
    
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(view.c_width - 20 - 80, view.c_height - 10 - 15, 80, 15)];
    label1.textAlignment = NSTextAlignmentRight;
    label1.textColor = cWhiteColor;
    label1.font = cPfRegular(12);
    label1.text = @"20 钻/分钟";
    [view addSubview:label1];
    _label4 = label1;
    
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(10, label1.c_top, label1.c_left - 10, label1.c_height)];
    label2.textAlignment = NSTextAlignmentLeft;
    label2.textColor = cWhiteColor;
    label2.font = cPfRegular(12);
    label2.text = @"自己喜欢的日子，就是最美的日子";
    [view addSubview:label2];
    _label3 = label2;
    
    UILabel *label3 = [[UILabel alloc] initWithFrame:CGRectMake(10, label2.c_top - 5 - 20, view.c_width - 20, 20)];
    label3.textAlignment = NSTextAlignmentLeft;
    label3.textColor = cWhiteColor;
    label3.font = cPfRegular(16);
    label3.text = @"红娘夏天";
    [view addSubview:label3];
    _label2 = label3;
    
    UIImageView *icon2 = [[UIImageView alloc] initWithFrame:CGRectMake(10, label3.c_top - 5 - 20, 60, 20)];
    icon2.image = [UIImage imageNamed:@"在线"];
    icon2.contentMode = UIViewContentModeScaleAspectFit;
    [view addSubview:icon2];
    
    UILabel *label4 = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 50, 24)];
    label4.textAlignment = NSTextAlignmentCenter;
    label4.backgroundColor = Publie_Color;
    label4.textColor = cWhiteColor;
    label4.font = cPfRegular(14);
    label4.text = @"♀24";
    cViewRadius(label4, 12)
    [view addSubview:label4];
    _label1 = label4;
    
}

- (void)setModel:(NSDictionary *)model {
    
    _model = model;
    
    [_icon sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@", KIURL, model[@"avatar"]]]];
    
    _label1.text = [NSString stringWithFormat:@"♀%u", 18 + arc4random()%10];
    _label2.text = [NSString stringWithFormat:@"%@", model[@"nickname"]];
    _label3.text = [NSString stringWithFormat:@"%@", model[@"sign"]];
    _label4.text = [NSString stringWithFormat:@"%@钻/分钟", model[@"video_call_price"]];
}



@end
