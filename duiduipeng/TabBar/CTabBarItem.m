//
//  CTabBarItem.m
//  duiduipeng
//
//  Created by 曹老师 on 2019/12/19.
//  Copyright © 2019 MAC. All rights reserved.
//

#import "CTabBarItem.h"

@implementation CTabBarItem

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        [self creatUIAction];
        
    }
    return self;
    
}


#pragma mark - 创建UI
- (void)creatUIAction {
    
    _icon = [[UIImageView alloc] initWithFrame:CGRectMake(0, 5, self.c_width, 20)];
    _icon.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:_icon];
    
    _label = [[UILabel alloc] initWithFrame:CGRectMake(0, _icon.c_bottom, self.c_width, 20)];
    _label.textAlignment = NSTextAlignmentCenter;
    _label.font = cPfMedium(11);
    [self addSubview:_label];
    
    _numLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.c_width/2, 0, 20, 20)];
    _numLabel.textAlignment = NSTextAlignmentCenter;
    _numLabel.textColor = cWhiteColor;
    _numLabel.font = cPfRegular(10);
    _numLabel.text = @"99";
    _numLabel.backgroundColor = [UIColor redColor];
    cViewRadius(_numLabel, 10)
    [self addSubview:_numLabel];
    
}








































@end
