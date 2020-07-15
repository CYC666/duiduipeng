//
//  View3Controller.m
//  duiduipeng
//
//  Created by CYC on 2020/3/31.
//  Copyright © 2020 Hello. All rights reserved.
//

#import "View3Controller.h"
#import "MessageListCell.h"
#import "MessageHeader.h"
#import "ContactController.h"
#import "FollowController.h"
#import "FansController.h"
#import "MyDiamondsController.h"


@interface View3Controller () <UITableViewDelegate, UITableViewDataSource> {
    
    
    
}

@property (strong, nonatomic) UITableView *listTableView;   // 表视图
@property (strong, nonatomic) NSArray *dataArray;    // 数据列表
@property (assign, nonatomic) NSInteger currentPage;        // 当前页
@property (strong, nonatomic) CTimer *timer;

@end

@implementation View3Controller

#pragma mark ========================================生命周期========================================
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor = cWhiteColor;
    _dataArray = [NSMutableArray array];
    // 创建视图
    [self creatSubViewsAction];
    
    
    _timer = [[CTimer alloc] initWithFireTime:10
                                     interval:1
                                       target:self
                                     selector:@selector(timerAction:)
                                      repeats:YES];
    [_timer fire];
}


#pragma mark ========================================私有方法=============================================

#pragma mark - 创建视图
- (void)creatSubViewsAction {
    
    // 左边标题
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 60, 44);
    [button setTitle:@"消息" forState:UIControlStateNormal];
    [button setTitleColor:cLabColA forState:UIControlStateNormal];
    button.titleLabel.font = cPfMedium(24);
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    // 表视图
    _listTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, cScreenWidth, cScreenHeight - cNavHeight - cTabHeight) style:UITableViewStylePlain];
    _listTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _listTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    _listTableView.backgroundColor = [UIColor clearColor];
    _listTableView.rowHeight = 70;
    _listTableView.estimatedRowHeight = 0;
    _listTableView.estimatedSectionFooterHeight = 0;
    _listTableView.estimatedSectionHeaderHeight = 0;
    _listTableView.delegate = self;
    _listTableView.dataSource = self;
    _listTableView.showsVerticalScrollIndicator = NO;
    [_listTableView registerClass:[MessageListCell class] forCellReuseIdentifier:@"MessageListCell"];
    [self.view addSubview:_listTableView];
    
    MessageHeader *header = [[MessageHeader alloc] initWithFrame:CGRectMake(0, 0, cScreenWidth, 100)];
    cBtnSelector(header.button1, button1Action:)
    cBtnSelector(header.button2, button2Action:)
    cBtnSelector(header.button3, button3Action:)
    _listTableView.tableHeaderView = header;
    
    if(@available(iOS 11.0, *)){
        _listTableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    
    _dataArray = [kData getAllMessage];
    
    [_listTableView reloadData];
    
}

#pragma mark ========================================动作响应=============================================

#pragma mark - 定时器响应
- (void)timerAction:(CTimer *)timer {
    
    
    // 随机往列表里塞消息
    if (arc4random() % 20 == 0 || [kData getAllMessage].count == 0) {
        
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"私密空间" ofType:@"json"];
        NSData *data = [NSData dataWithContentsOfFile:filePath];
        
        NSError *error = nil;
        NSArray *items = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        NSMutableArray *list = [NSMutableArray array];
        for (NSDictionary *dic in items) {
            
            // 筛选出尚未添加的
            NSString *uid = [NSString stringWithFormat:@"%@", dic[@"uid"]];
            BOOL flag = NO;
            for (MessageModel *model in [kData getAllMessage]) {
                
                if ([model.uid isEqualToString:uid]) {
                    
                    flag = YES;
                    break;
                }
            }
            
            if (flag == NO) {
                [list addObject:dic];
            }
    
        }
        
        if (!cArrEmpty(list)) {
            
            // 将消息塞入到数据库
            NSDictionary *dic = list[arc4random() % list.count];
            MessageModel *model = [MessageModel mj_objectWithKeyValues:dic];
            
            model.unRead = [NSString stringWithFormat:@"%u", arc4random() % 6 + 1];
            
            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
            [dateFormatter setDateFormat:@"MM-dd HH:mm"];
            NSString *str = [dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSinceNow:0]];
            model.time = str;
            
            if (arc4random() % 3 == 1) {
                model.content = @"[视频聊天]";
            } else {
                model.content = @"[图片]";
            }
            
            [kData insertMessageToDB:model];
            [[[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleHeavy] impactOccurred];
            // 发送通知
            [[NSNotificationCenter defaultCenter] postNotificationName:kReloadUnreadNumber object:nil];
        }
        
        
        _dataArray = [kData getAllMessage];
        
        [_listTableView reloadData];
    }
    
    
    
    
}


#pragma mark - 客服
- (void)button1Action:(UIButton *)button {
    
    [self.navigationController pushViewController:[ContactController new] animated:YES];
    
}

#pragma mark - 关注
- (void)button2Action:(UIButton *)button {
    
    [self.navigationController pushViewController:[FollowController new] animated:YES];
    
}

#pragma mark - 粉丝
- (void)button3Action:(UIButton *)button {
    
    [self.navigationController pushViewController:[FansController new] animated:YES];
    
}

#pragma mark ========================================网络请求=============================================




#pragma mark ========================================代理方法=============================================

#pragma mark - 表视图代理方法


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
        return _dataArray.count;
//    return 20;
    
}



- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return 0.01;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 0.01;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MessageListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MessageListCell"
                                                            forIndexPath:indexPath];
    
    if (indexPath.row < _dataArray.count) {
        cell.model = _dataArray[indexPath.row];
    }
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
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

#pragma mark ========================================通知================================================






































@end
