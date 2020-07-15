//
//  PooCodeView.h
//  government
//
//  Created by yu hua on 2017/5/4.
//  Copyright © 2017年 yu hua. All rights reserved.
//  图形验证码

#import <UIKit/UIKit.h>

@interface PooCodeView : UIView

@property (nonatomic, retain) NSArray *changeArray;
@property (nonatomic, retain) NSMutableString *changeString;
@property (nonatomic, retain) UILabel *codeLabel;
-(void)changeCode;

@end
