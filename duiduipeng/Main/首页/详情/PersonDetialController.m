//
//  PersonDetialController.m
//  duiduipeng
//
//  Created by CYC on 2020/6/5.
//  Copyright © 2020 Hello. All rights reserved.
//

#import "PersonDetialController.h"
#import <AVKit/AVKit.h>
#import "MyDiamondsController.h"

@interface PersonDetialController ()

@property (strong, nonatomic) AVPlayerItem *item;
@property (strong, nonatomic) AVPlayer *player;
@property (strong, nonatomic) AVPlayerLayer *layer;

@end

@implementation PersonDetialController

#pragma mark ========================================生命周期========================================
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.hidden = YES;
    self.view.backgroundColor = cBlackColor;
    
    [self creatUIAction];
}

#pragma mark - 创建UI
- (void)creatUIAction {
    
    
    {
        // 初始化播放器
        NSURL *playUrl = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@", KIURL, _model[@"douyin_video"]]];
        _item = [AVPlayerItem playerItemWithURL:playUrl];
        _player = [AVPlayer playerWithPlayerItem:_item];
        _layer = [AVPlayerLayer playerLayerWithPlayer:_player];
        _layer.frame = CGRectMake(0, 0, cScreenWidth, cScreenHeight);
        _layer.videoGravity = AVLayerVideoGravityResizeAspectFill;
        [self.view.layer addSublayer:_layer];
        [_player play];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playbackFinished:) name:AVPlayerItemDidPlayToEndTimeNotification object:_item];

    }

    {
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(20, cScreenHeight - 30 - 40, 80, 40)];
        cViewRadius(button, 5)
        cBtnImage(button, @"私聊")
        cBtnFont(button, cPfRegular(14))
        cBtnTitle(button, @" 私聊")
        cBtnSelector(button, buttonAction:)
        button.backgroundColor = cRGB(0, 0, 0, 0.6);
        [self.view addSubview:button];
        
        UIImageView *icon = [[UIImageView alloc] initWithFrame:CGRectMake(20, button.c_top - 15 - 50, 50, 50)];
        cViewBorder(icon, 5, cWhiteColor, 2)
        icon.contentMode = UIViewContentModeScaleAspectFit;
        [self.view addSubview:icon];
        [icon sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@", KIURL, _model[@"avatar"]]]];

        UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(icon.c_right + 15, icon.c_top, 200, 20)];
        label1.textAlignment = NSTextAlignmentLeft;
        label1.textColor = cWhiteColor;
        label1.font = cPfMedium(16);
        [self.view addSubview:label1];
        label1.text = [NSString stringWithFormat:@"%@", _model[@"nickname"]];
        
        UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(icon.c_right + 15, icon.c_bottom - 15, 200, 15)];
        label2.textAlignment = NSTextAlignmentLeft;
        label2.textColor = cWhiteColor;
        label2.font = cPfRegular(12);
        [self.view addSubview:label2];
        label2.text = [NSString stringWithFormat:@"%@", _model[@"sign"]];

    }
    
    {
        
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(cScreenWidth - 20 - 120, cScreenHeight - 30 - 40, 130, 40)];
        cViewRadius(button, 5)
        cBtnImage(button, @"与她视频")
        cBtnFont(button, cPfRegular(14))
        cBtnTitle(button, @" 与她激情视频")
        cBtnSelector(button, buttonAction:)
        button.backgroundColor = Publie_Color;
        [self.view addSubview:button];
    }
    
    {
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(20, cNavStart, 40, 40)];
        [button setImage:[UIImage imageNamed:@"返回"] forState:UIControlStateNormal];
        cBtnSelector(button, backAction)
        [self.view addSubview:button];
    }
    
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


#pragma mark ========================================动作响应=============================================

#pragma mark - 返回
- (void)backAction {
    
    [self.navigationController popViewControllerAnimated:YES];
    
}


#pragma mark - 私聊
- (void)buttonAction:(UIButton *)button {
    
    // 弹框提示是否执行
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"你的钻石余额不足"
                                                                   message:@"需要了解最新的充值优惠吗？"
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消"
                                                     style:UIAlertActionStyleCancel
                                                   handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alert addAction:cancel];
    [alert addAction:[UIAlertAction actionWithTitle:@"购买钻石"
                                              style:UIAlertActionStyleDefault
                                            handler:^(UIAlertAction * _Nonnull action) {
        
        [self.navigationController pushViewController:[MyDiamondsController new] animated:YES];
        
    }]];
    
    [self presentViewController:alert animated:YES completion:nil];
    
}



#pragma mark ========================================网络请求=============================================


#pragma mark ========================================代理方法=============================================


#pragma mark ========================================通知=============================================
-(void)playbackFinished:(NSNotification*)noti{
    

    // 重播
    CMTime duration = _item.duration;
    duration.value = 0;
    
    [_item seekToTime:duration];
    [_player play];

}















@end
