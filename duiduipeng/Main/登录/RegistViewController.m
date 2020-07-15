//
//  RegistViewController.m
//  NewsProject
//
//  Created by CYC on 2020/5/26.
//  Copyright © 2020 oig. All rights reserved.
//

#import "RegistViewController.h"

@interface RegistViewController ()

@property (weak, nonatomic) IBOutlet UITextField *field1;
@property (weak, nonatomic) IBOutlet UITextField *field2;



@end

@implementation RegistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = @"注册";
}




- (IBAction)registAction:(id)sender {
    
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
    
    
    if (cStrEmpty(_field1.text)) {
        [self.view makeToast:@"请输入账号"];
        return;
    }
    
    if (cStrEmpty(_field2.text)) {
        [self.view makeToast:@"请输入密码"];
        return;
    }
    
    _selectBlock(_field1.text);
    
    [kUser.list2 addObject:@{@"account" : _field1.text, @"password" : _field2.text}];
    
    MBPS(self.view)
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        MBPH(self.view)
        
        [self.view makeToast:@"注册成功"];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.navigationController popViewControllerAnimated:YES];
        });
    });
}



- (IBAction)backAction:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}































@end
