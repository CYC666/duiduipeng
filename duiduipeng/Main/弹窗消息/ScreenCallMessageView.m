//
//  ScreenCallMessageView.m
//  duiduipeng
//
//  Created by CYC on 2020/6/5.
//  Copyright © 2020 Hello. All rights reserved.
//

#import "ScreenCallMessageView.h"
#import <AVKit/AVKit.h>


@interface ScreenCallMessageView ()

@property (strong, nonatomic) AVPlayerItem *item;
@property (strong, nonatomic) AVPlayer *player;
@property (strong, nonatomic) AVPlayerLayer *layerB;
@property (strong, nonatomic) CTimer *timer;


@end

@implementation ScreenCallMessageView



#pragma mark ========================================生命周期========================================
+ (instancetype)new {
    
    ScreenCallMessageView *view = [[ScreenCallMessageView alloc] initWithFrame:CGRectMake(0, cScreenHeight, cScreenWidth, cScreenHeight)];
    view.backgroundColor = cBlackColor;
    [[UIApplication sharedApplication].keyWindow addSubview:view];
    
    return view;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)setModel:(NSDictionary *)model {
    
    _model = model;
    
    {
        // 初始化播放器
        NSURL *playUrl = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@", KIURL, _model[@"video_url"]]];
        _item = [AVPlayerItem playerItemWithURL:playUrl];
        _player = [AVPlayer playerWithPlayerItem:_item];
        _layerB = [AVPlayerLayer playerLayerWithPlayer:_player];
        _layerB.frame = CGRectMake(0, 0, cScreenWidth, cScreenHeight);
        _layerB.videoGravity = AVLayerVideoGravityResizeAspectFill;
        [self.layer addSublayer:_layerB];
        [_player play];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playbackFinished:) name:AVPlayerItemDidPlayToEndTimeNotification object:_item];

    }
    
    
//    UIImageView *icon1 = [[UIImageView alloc] initWithFrame:self.bounds];
//    icon1.contentMode = UIViewContentModeScaleAspectFill;
//    [self addSubview:icon1];
//    [icon1 sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@", KIURL, model[@"photo_url"]]]];
    
    UIImageView *icon = [[UIImageView alloc] initWithFrame:self.bounds];
    icon.image = [UIImage imageNamed:@"阴影"];
    icon.contentMode = UIViewContentModeScaleAspectFill;
    [self addSubview:icon];

    UIButton *button1 = [[UIButton alloc] initWithFrame:CGRectMake(80, self.c_height - 60 - 60, 60, 60)];
    [button1 setImage:[UIImage imageNamed:@"挂断"] forState:UIControlStateNormal];
    cBtnSelector(button1, button1Action:)
    [self addSubview:button1];
    
    UIButton *button2 = [[UIButton alloc] initWithFrame:CGRectMake(self.c_width - 80 - 60, button1.c_top, 60, 60)];
    [button2 setImage:[UIImage imageNamed:@"接电话"] forState:UIControlStateNormal];
    cBtnSelector(button2, button2Action:)
    [self addSubview:button2];
    
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(20, button1.c_top - 30 - 20, self.c_width - 40, 20)];
    label1.textAlignment = NSTextAlignmentCenter;
    label1.textColor = cWhiteColor;
    label1.font = cPfRegular(12);
    label1.text = @"正在邀请你视频通话...";
    [self addSubview:label1];
    
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(20, label1.c_top - 10 - 20, self.c_width - 40, 20)];
    label2.textAlignment = NSTextAlignmentCenter;
    label2.textColor = cWhiteColor;
    label2.font = cPfRegular(12);
    label2.text = [NSString stringWithFormat:@"%@钻石/分钟", model[@"video_call_price"]];
    [self addSubview:label2];
    
    UILabel *label3 = [[UILabel alloc] initWithFrame:CGRectMake(20, label2.c_top - 10 - 30, self.c_width - 40, 30)];
    label3.textAlignment = NSTextAlignmentCenter;
    label3.textColor = cWhiteColor;
    label3.font = cPfMedium(16);
    label3.text = [NSString stringWithFormat:@"%@", model[@"nickname"]];
    [self addSubview:label3];
    
    UIImageView *icon2 = [[UIImageView alloc] initWithFrame:CGRectMake((self.c_width - 70)/2, label3.c_top - 10 - 70, 70, 70)];
    icon2.contentMode = UIViewContentModeScaleAspectFit;
    cViewRadius(icon2, 10)
    [self addSubview:icon2];
    [icon2 sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@", KIURL, model[@"avatar"]]]];

    
    [UIView animateWithDuration:.25 animations:^{
        self.transform = CGAffineTransformMakeTranslation(0, -cScreenHeight);
    }];
    
    _timer = [[CTimer alloc] initWithFireTime:1
                                     interval:0.5
                                       target:self
                                     selector:@selector(timerAction:)
                                      repeats:YES];
    [_timer fire];
}



#pragma mark ========================================动作响应=============================================

#pragma mark - 定时器响应
- (void)timerAction:(CTimer *)timer {
    
    [[[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleHeavy] impactOccurred];
    
}


#pragma mark - 挂断
- (void)button1Action:(UIButton *)button {
    
    _sureBlock(0);
    [self backAction];
    
}

#pragma mark - 接通
- (void)button2Action:(UIButton *)button {
    
    _sureBlock(1);
    [self backAction];
    
}

#pragma mark - 退出
- (void)backAction {
    
    [UIView animateWithDuration:.25 animations:^{
        self.transform = CGAffineTransformMakeTranslation(0, 0);
        self.userInteractionEnabled = NO;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
    
}


#pragma mark ========================================通知=============================================
-(void)playbackFinished:(NSNotification*)noti{
    

    // 重播
    CMTime duration = _item.duration;
    duration.value = 0;
    
    [_item seekToTime:duration];
    [_player play];

}


@end
