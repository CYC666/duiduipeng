

#import "BaseRTNavigationController.h"
@interface BaseRTNavigationController ()

@end

@implementation BaseRTNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];

    //去掉导航栏下面的黑线
    
    self.wcHideBottomBarWhenPush = YES;
    self.useSystemBackBarButtonItem = NO;
    self.transferNavigationBarAttributes = YES;
    
    self.navigationBar.tintColor = cLabColA;
    self.navigationBar.barTintColor = cWhiteColor;
    self.navigationBar.titleTextAttributes = @{NSFontAttributeName:cPfMedium(18),
                                               NSForegroundColorAttributeName:cLabColA};
//    self.navigationBar.barTintColor = [UIColor whiteColor];
    self.navigationBar.translucent = NO;
    self.navigationBar.shadowImage = cImage(@"whiteline");
}







@end
