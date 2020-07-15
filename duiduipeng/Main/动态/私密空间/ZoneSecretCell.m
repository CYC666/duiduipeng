//
//  ZoneSecretCell.m
//  duiduipeng
//
//  Created by CYC on 2020/6/4.
//  Copyright © 2020 Hello. All rights reserved.
//

#import "ZoneSecretCell.h"

@implementation ZoneSecretCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self creatUIAction];
        
    }
    return self;
    
}

#pragma mark - 创建UI
- (void)creatUIAction {
    
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, cScreenWidth, cScreenHeight - cNavHeight - cTabHeight)];
    view.backgroundColor = cBlackColor;
    [self addSubview:view];
    
    UIImageView *icon1 = [[UIImageView alloc] initWithFrame:view.bounds];
    icon1.contentMode = UIViewContentModeScaleAspectFill;
    icon1.clipsToBounds = YES;
    [view addSubview:icon1];
    _icon = icon1;
    
    // 毛玻璃
    UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];                  // 特效
    UIVisualEffectView *visualEffectView = [[UIVisualEffectView alloc] initWithEffect:blur];    // 承载特效的视图
    visualEffectView.alpha = 0.9;
    visualEffectView.frame = view.bounds;
    [icon1 insertSubview:visualEffectView atIndex:0];                                            // 在哪个视图添加特效视图
    
    UIImageView *icon = [[UIImageView alloc] initWithFrame:CGRectMake((view.c_width - 50)/2, (view.c_height - 50)/2, 50, 50)];
    icon.image = [UIImage imageNamed:@"播放"];
    icon.contentMode = UIViewContentModeScaleAspectFit;
    [view addSubview:icon];
    
    
    
}

- (void)setModel:(NSDictionary *)model {
    
    _model = model;
    
    [_icon sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@", KIURL, model[@"photo_url"]]]];

    
}


@end
