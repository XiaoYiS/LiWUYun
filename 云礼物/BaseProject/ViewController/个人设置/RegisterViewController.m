//
//  RegisterViewController.m
//  LiWuYun
//
//  Created by yihaiyang on 15/11/29.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userNameTF;
@property (weak, nonatomic) IBOutlet UITextField *passwordTF;

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [FactoryAdd addBackItemToVC:self];
    self.navigationController.navigationBarHidden = NO;
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    UIImageView *leftImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon"]];
    leftImageView.frame = CGRectMake(0, 0, 55, 20);
    leftImageView.contentMode = UIViewContentModeCenter;
    self.userNameTF.leftView = leftImageView;
    //需要设置显示模式才能显示出来
    self.userNameTF.leftViewMode = UITextFieldViewModeAlways;
    //password
    UIImageView *leftImageViewP = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"lock"]];
    leftImageViewP.frame = CGRectMake(0, 0, 55, 20);
    leftImageViewP.contentMode = UIViewContentModeCenter;
    self.passwordTF.leftView = leftImageViewP;
    //需要设置显示模式才能显示出来
    self.passwordTF.leftViewMode = UITextFieldViewModeAlways;
}
- (IBAction)RegisterBtn:(UIButton *)sender {
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
