//
//  MessageListCell.m
//  duiduipeng
//
//  Created by CYC on 2020/6/5.
//  Copyright © 2020 Hello. All rights reserved.
//

#import "MessageListCell.h"

@implementation MessageListCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
//        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self creatUIAction];
        
    }
    return self;
    
}

#pragma mark - 创建UI
- (void)creatUIAction {

    
    UIImageView *icon = [[UIImageView alloc] initWithFrame:CGRectMake(15, 10, 50, 50)];
    cViewRadius(icon, 25)
    icon.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:icon];
    _icon = icon;
    
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(icon.c_right + 15, icon.c_top, cScreenWidth - icon.c_right - 100, 20)];
    label1.textAlignment = NSTextAlignmentLeft;
    label1.textColor = cLabColA;
    label1.font = cPfMedium(14);
    [self addSubview:label1];
    _label1 = label1;
    
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(icon.c_right + 15, label1.c_bottom + 5, cScreenWidth - icon.c_right - 100, 20)];
    label2.textAlignment = NSTextAlignmentLeft;
    label2.textColor = cLabColC;
    label2.font = cPfRegular(13);
    [self addSubview:label2];
    _label2 = label2;
    
    UILabel *label3 = [[UILabel alloc] initWithFrame:CGRectMake(cScreenWidth - 15 - 80, icon.c_top, 80, 15)];
    label3.textAlignment = NSTextAlignmentRight;
    label3.textColor = cLabColC;
    label3.font = cPfRegular(10);
    [self addSubview:label3];
    _label3 = label3;
    
    UILabel *label4 = [[UILabel alloc] initWithFrame:CGRectMake(cScreenWidth - 15 - 20, label3.c_bottom + 5, 20, 20)];
    label4.textAlignment = NSTextAlignmentCenter;
    label4.textColor = cWhiteColor;
    label4.font = cPfRegular(10);
    label4.text = @"99";
    label4.backgroundColor = [UIColor redColor];
    cViewRadius(label4, 10)
    [self addSubview:label4];
    _label4 = label4;
    
    
}



- (void)setModel:(MessageModel *)model {
    
    _model = model;
    
    [_icon sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@", KIURL, model.avatar]]];
    _label1.text = [NSString stringWithFormat:@"%@", model.nickname];
    _label2.text = model.content;
    _label3.text = model.time;
    
    if (model.unRead.intValue > 0) {
        
        _label4.text = model.unRead;
        _label4.hidden = NO;
    } else {
        _label4.hidden = YES;
    }

   
}



@end
