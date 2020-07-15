//
//  HomeListController.m
//  duiduipeng
//
//  Created by CYC on 2020/6/4.
//  Copyright © 2020 Hello. All rights reserved.
//

#import "ZoneListController.h"
#import "ZoneListCell.h"


@interface ZoneListController () <UITableViewDelegate, UITableViewDataSource> {
    
    
    
}

@property (strong, nonatomic) UITableView *listTableView;   // 表视图
@property (strong, nonatomic) NSMutableArray *dataArray;    // 数据列表
@property (assign, nonatomic) NSInteger currentPage;        // 当前页


@end

@implementation ZoneListController

#pragma mark ========================================生命周期========================================
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = cWhiteColor;
    _dataArray = [NSMutableArray array];
    // 创建视图
    [self creatSubViewsAction];
    
    
    
}


#pragma mark ========================================私有方法=============================================

#pragma mark - 创建视图
- (void)creatSubViewsAction {
    
    // 背景图
    UIImageView *icon = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, cScreenWidth, cScreenHeight - cNavHeight - cTabHeight)];
    icon.image = [UIImage imageNamed:@"BGIMAGE"];
    icon.contentMode = UIViewContentModeScaleAspectFill;
    icon.clipsToBounds = YES;
    [self.view addSubview:icon];
    
    // 表视图
    _listTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, cScreenWidth, cScreenHeight - cNavHeight - cTabHeight) style:UITableViewStylePlain];
    _listTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _listTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    _listTableView.backgroundColor = [UIColor clearColor];
    _listTableView.rowHeight = 330;
    _listTableView.estimatedRowHeight = 0;
    _listTableView.estimatedSectionFooterHeight = 0;
    _listTableView.estimatedSectionHeaderHeight = 0;
    _listTableView.delegate = self;
    _listTableView.dataSource = self;
    [_listTableView registerClass:[ZoneListCell class] forCellReuseIdentifier:@"ZoneListCell"];
    [self.view addSubview:_listTableView];
    
    if(@available(iOS 11.0, *)){
        _listTableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    
    __weak typeof(self) weakSelf = self;
    _listTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
        [weakSelf loadListAction:NO];
        
    }];
    
    
    _listTableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        
        [weakSelf loadListAction:YES];
        
        
    }];
    
    [self loadListAction:NO];
    
}

#pragma mark ========================================动作响应=============================================


#pragma mark ========================================网络请求=============================================

#pragma mark - 获取列表
- (void)loadListAction:(BOOL)isfooter {
    
    if (isfooter) {
        _currentPage ++;
    } else {
        _currentPage = 1;
        [_dataArray removeAllObjects];
    }
    
    [_listTableView.mj_header endRefreshing];
    [_listTableView.mj_footer endRefreshingWithNoMoreData];
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"动态列表" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    
    NSError *error = nil;
    NSArray *items = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
    
    [_dataArray addObjectsFromArray:items];
    
}


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
    
    ZoneListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ZoneListCell"
                                                            forIndexPath:indexPath];
    
    if (indexPath.row < _dataArray.count) {
        cell.model = _dataArray[indexPath.row];
        
        
        
        
    }
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row < _dataArray.count) {
        NSDictionary *model = _dataArray[indexPath.row];
        
        
        
        
    }
    
}

#pragma mark ========================================通知================================================






































@end
