//
//  ContactVIPController.m
//  duiduipeng
//
//  Created by CYC on 2020/6/8.
//  Copyright © 2020 Hello. All rights reserved.
//

#import "ContactVIPController.h"

@interface ContactVIPController ()

@end

@implementation ContactVIPController

#pragma mark ========================================生命周期========================================
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"充值帮助";
    self.view.backgroundColor = Background_Color;
    
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
            UIImageView *icon = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, cScreenWidth, cScreenWidth*2)];
            icon.image = [UIImage imageNamed:@"充值VIP"];
            icon.contentMode = UIViewContentModeScaleAspectFill;
            [scrollView addSubview:icon];
            height = icon.c_bottom;
        }
        
        {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(20, height + 40, cScreenWidth - 40, 50);
            [button setTitle:@"保存二维码" forState:UIControlStateNormal];
            [button setTitleColor:cWhiteColor forState:UIControlStateNormal];
            button.titleLabel.font = cPfMedium(18);
            button.backgroundColor = Publie_Color;
            cViewRadius(button, 25)
            [button addTarget:self action:@selector(rightButtonAction) forControlEvents:UIControlEventTouchUpInside];
            [scrollView addSubview:button];
            height = button.c_bottom + 20;
        }
        
        scrollView.contentSize = CGSizeMake(cScreenWidth, height);
        
    }
    
}




#pragma mark ========================================动作响应=============================================


- (void)rightButtonAction {
    
    {
        UIImage *image = cImage(@"IMG_3446");
        UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
    }
    
    {
        UIImage *image = cImage(@"IMG_3447");
        UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
    }
    
}

#pragma mark ========================================网络请求=============================================


#pragma mark ========================================代理方法=============================================


- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo {
    
    if (error) {
        [self.view makeToast:@"保存失败"];
    } else {
        [self.view makeToast:@"已将二维码保存到相册"];
    }
    
    
}



















@end
