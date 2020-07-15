//
//  ScanViewController.m
//  Cyprium
//
//  Created by MAC on 2019/3/11.
//  Copyright © 2019 MAC. All rights reserved.
//

#import "ScanViewController.h"

#import "WSLScanView.h"
#import "WSLNativeScanTool.h"


@interface ScanViewController ()<UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (nonatomic, strong)  WSLNativeScanTool * scanTool;
@property (nonatomic, strong)  WSLScanView * scanView;

@end

@implementation ScanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"扫一扫";
//    UIButton *phoneBtn=[UIButton buttonWithType:UIButtonTypeCustom];
//    phoneBtn.frame=CGRectMake(SCREEN_WIDTH-60, StatueHigh, 60, HeadViewHigh-StatueHigh);
//    [phoneBtn setTitleColor:text_blackColor forState:UIControlStateNormal];
//    [phoneBtn setTitle:RCDLocalizedString(@"Album") forState:UIControlStateNormal];
//    [phoneBtn addTarget:self action:@selector(photoBtnClicked) forControlEvents:UIControlEventTouchUpInside];
//    [self.navBar addSubview:phoneBtn];
    
    // 导航栏右边的添加按钮
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"相册" style:UIBarButtonItemStylePlain target:self action:@selector(photoBtnClicked)];
    
    //输出流视图
    UIView *preview  = [[UIView alloc] initWithFrame:CGRectMake(0, 0, cScreenWidth, cScreenHeight - cNavHeight)];
    [self.view addSubview:preview];
    
    __weak typeof(self) weakSelf = self;
    
    //构建扫描样式视图
    _scanView = [[WSLScanView alloc] initWithFrame:CGRectMake(0, 0, cScreenWidth, cScreenHeight - cNavHeight)];
    _scanView.scanRetangleRect = CGRectMake(60, 120, (self.view.frame.size.width - 2 * 60),  (self.view.frame.size.width - 2 * 60));
    _scanView.colorAngle = [UIColor greenColor];
    _scanView.photoframeAngleW = 20;
    _scanView.photoframeAngleH = 20;
    _scanView.photoframeLineW = 2;
    _scanView.isNeedShowRetangle = YES;
    _scanView.colorRetangleLine = [UIColor whiteColor];
    _scanView.notRecoginitonArea = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
    _scanView.animationImage = [UIImage imageNamed:@"scanLine"];
    /*
    _scanView.myQRCodeBlock = ^{
        
        WSLCreateQRCodeController *createQRCodeController = [[WSLCreateQRCodeController alloc]init];
        createQRCodeController.qrImage =  [WSLNativeScanTool createQRCodeImageWithString:@"https://www.jianshu.com/u/e15d1f644bea" andSize:CGSizeMake(250, 250) andBackColor:[UIColor whiteColor] andFrontColor:[UIColor orangeColor] andCenterImage:[UIImage imageNamed:@"piao"]];
        createQRCodeController.qrString = @"https://www.jianshu.com/u/e15d1f644bea";
        [weakSelf.navigationController pushViewController:createQRCodeController animated:YES];
    };
     */
    _scanView.flashSwitchBlock = ^(BOOL open) {
        [weakSelf.scanTool openFlashSwitch:open];
    };
    [self.view addSubview:_scanView];
    
    //初始化扫描工具
    _scanTool = [[WSLNativeScanTool alloc] initWithPreview:preview andScanFrame:_scanView.scanRetangleRect];
    _scanTool.scanFinishedBlock = ^(NSString *scanString) {
        NSLog(@"扫描结果 %@",scanString);
        [weakSelf.scanView handlingResultsOfScan];
        
        weakSelf.scanResultBlock(scanString);
        [weakSelf.navigationController popViewControllerAnimated:YES];
        /*
        WSLCreateQRCodeController *createQRCodeController = [[WSLCreateQRCodeController alloc]init];
        createQRCodeController.qrImage =  [WSLNativeScanTool createQRCodeImageWithString:scanString andSize:CGSizeMake(250, 250) andBackColor:[UIColor colorWithRed:arc4random()%255/256.0 green:arc4random()%255/256.0 blue:arc4random()%255/256.0 alpha:1.0] andFrontColor:[UIColor colorWithRed:arc4random()%255/256.0 green:arc4random()%255/256.0 blue:arc4random()%255/256.0 alpha:1.0] andCenterImage:[UIImage imageNamed:@"piao"]];
        createQRCodeController.qrString = scanString;
        [weakSelf.navigationController pushViewController:createQRCodeController animated:YES];
         */
        [weakSelf.scanTool sessionStopRunning];
        [weakSelf.scanTool openFlashSwitch:NO];
    };
    _scanTool.monitorLightBlock = ^(float brightness) {
        
        if (brightness < 0) {
            // 环境太暗，显示闪光灯开关按钮
            [weakSelf.scanView showFlashSwitch:YES];
        }else if(brightness > 0){
            // 环境亮度可以,且闪光灯处于关闭状态时，隐藏闪光灯开关
            if(!weakSelf.scanTool.flashOpen){
                [weakSelf.scanView showFlashSwitch:NO];
            }
        }
    };
    
    [_scanTool sessionStartRunning];
    [_scanView startScanAnimation];
    
    // Do any additional setup after loading the view.
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [_scanView startScanAnimation];
    [_scanTool sessionStartRunning];
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [_scanView stopScanAnimation];
    [_scanView finishedHandle];
    [_scanView showFlashSwitch:NO];
    [_scanTool sessionStopRunning];
}
#pragma mark -- Events Handle
- (void)photoBtnClicked{
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]){
        if (@available(iOS 11, *)) {
            UIScrollView.appearance.contentInsetAdjustmentBehavior=UIScrollViewContentInsetAdjustmentAutomatic;
        }
        UIImagePickerController * _imagePickerController = [[UIImagePickerController alloc] init];
        _imagePickerController.delegate = self;
        _imagePickerController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
        _imagePickerController.allowsEditing = YES;
        _imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        [self presentViewController:_imagePickerController animated:YES completion:nil];
    }else{
        NSLog(@"不支持访问相册");
    }
}
- (void)showAlertWithTitle:(NSString *)title message:(NSString *)message handler:(void (^) (UIAlertAction *action))handler{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:RCDLocalizedString(@"Yes") style:UIAlertActionStyleDefault handler:handler];
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:nil];
}
#pragma mark UIImagePickerControllerDelegate
//该代理方法仅适用于只选取图片时
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(nullable NSDictionary<NSString *,id> *)editingInfo {
    //    NSLog(@"选择完毕----image:%@-----info:%@",image,editingInfo);
    if (@available(iOS 11, *)) {
        UIScrollView.appearance.contentInsetAdjustmentBehavior=UIScrollViewContentInsetAdjustmentNever;
    }
    [self dismissViewControllerAnimated:YES completion:nil];
    [_scanTool scanImageQRCode:image];
}
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    if (@available(iOS 11, *)) {
        UIScrollView.appearance.contentInsetAdjustmentBehavior=UIScrollViewContentInsetAdjustmentNever;
    }
    [picker dismissViewControllerAnimated:YES completion:nil];
}

@end
