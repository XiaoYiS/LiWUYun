//
//  LoginViewController.m
//  LiWuYun
//
//  Created by yihaiyang on 15/11/27.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "LoginViewController.h"
#import "UMSocial.h"
#import "RegisterViewController.h"
@interface LoginViewController ()

//沙盒路径
@property (strong,nonatomic) NSUserDefaults *userDefault;

@property (weak, nonatomic) IBOutlet UITextField *userNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@end

@implementation LoginViewController
- (IBAction)RegisterBtn:(UIButton *)sender {
    //跳转到注册界面
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"LoginViewController" bundle:nil];
    
    RegisterViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"RegisterViewController"];
    [self.navigationController pushViewController:vc animated:YES];
}

- (NSUserDefaults *)userDefault{
    if (!_userDefault) {
        _userDefault = [NSUserDefaults standardUserDefaults];
    }
    return _userDefault;
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
    
    UIImageView *leftImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon"]];
    leftImageView.frame = CGRectMake(0, 0, 55, 20);
    leftImageView.contentMode = UIViewContentModeCenter;
    self.userNameTextField.leftView = leftImageView;
    //需要设置显示模式才能显示出来
    self.userNameTextField.leftViewMode = UITextFieldViewModeAlways;
    //password
    UIImageView *leftImageViewP = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"lock"]];
    leftImageViewP.frame = CGRectMake(0, 0, 55, 20);
    leftImageViewP.contentMode = UIViewContentModeCenter;
    self.passwordTextField.leftView = leftImageViewP;
    //需要设置显示模式才能显示出来
    self.passwordTextField.leftViewMode = UITextFieldViewModeAlways;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [FactoryAdd addBackItemToVC:self];
//    self.title = @"登陆";
//    //退回后隐藏backButton
    self.navigationItem.hidesBackButton = YES;

    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@"icon_back_h"] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"icon_back"] forState:UIControlStateHighlighted];
    [self.view addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(self.mas_topLayoutGuideBottom).mas_equalTo(20);
    }];

    [btn bk_addEventHandler:^(id sender) {
        [self.navigationController popViewControllerAnimated:YES];
        self.navigationController.navigationBar.hidden = NO;
    } forControlEvents:UIControlEventTouchUpInside];
  
    //使用弹簧控件缩小菜单按钮和边缘距离
    UIBarButtonItem *spaceItem=[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    spaceItem.width = -16;
    
}
//微信
- (IBAction)WechatLogin:(UIButton *)sender {
    UMSocialSnsPlatform *snsPlatform = [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToWechatSession];
    
    snsPlatform.loginClickHandler(self,[UMSocialControllerService defaultControllerService],YES,^(UMSocialResponseEntity *response){
        
        if (response.responseCode == UMSResponseCodeSuccess) {
            
            UMSocialAccountEntity *snsAccount = [[UMSocialAccountManager socialAccountDictionary]valueForKey:UMShareToWechatSession];
            
            NSLog(@"username is %@, uid is %@, token is %@ url is %@",snsAccount.userName,snsAccount.usid,snsAccount.accessToken,snsAccount.iconURL);
        }
    });
    //得到的数据在回调Block对象形参respone的data属性
    [[UMSocialDataService defaultDataService] requestSnsInformation:UMShareToWechatSession  completion:^(UMSocialResponseEntity *response){
        NSLog(@"SnsInformation is %@",response.data);
    }];
}
//qq
- (IBAction)RenRLogin:(UIButton *)sender {
    UMSocialSnsPlatform *snsPlatform = [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToQQ];
    
    snsPlatform.loginClickHandler(self,[UMSocialControllerService defaultControllerService],YES,^(UMSocialResponseEntity *response){
        
        //          获取微博用户名、uid、token等
        
        if (response.responseCode == UMSResponseCodeSuccess) {
            
            UMSocialAccountEntity *snsAccount = [[UMSocialAccountManager socialAccountDictionary] valueForKey:UMShareToQQ];
            
            NSLog(@"username is %@, uid is %@, token is %@ url is %@",snsAccount.userName,snsAccount.usid,snsAccount.accessToken,snsAccount.iconURL);
            
        }});
    //获取accestoken以及QQ用户信息，得到的数据在回调Block对象形参respone的data属性
    [[UMSocialDataService defaultDataService] requestSnsInformation:UMShareToQQ  completion:^(UMSocialResponseEntity *response){
        NSLog(@"SnsInformation is %@",response.data);
    }];
}
- (IBAction)SinaLogin:(UIButton *)sender {
    UMSocialSnsPlatform *snsPlatform = [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToSina];
    
    snsPlatform.loginClickHandler(self,[UMSocialControllerService defaultControllerService],YES,^(UMSocialResponseEntity *response){
        //          获取微博用户名、uid、token等
        if (response.responseCode == UMSResponseCodeSuccess) {
            UMSocialAccountEntity *snsAccount = [[UMSocialAccountManager socialAccountDictionary] valueForKey:UMShareToSina];
            
            NSLog(@"username is %@, uid is %@, token is %@ url is %@",snsAccount.userName,snsAccount.usid,snsAccount.accessToken,snsAccount.iconURL);
            [self.userDefault setValue:snsAccount.userName forKey:@"userName"];
            [self.userDefault setValue:snsAccount.iconURL forKey:@"iconURL"];
            //同步到沙盒
            [self.userDefault synchronize];
//            //跳转到用户信息页
//            UserInfoViewController *vc = [UserInfoViewController new];
//            vc.hidesBottomBarWhenPushed = YES;
//            [self.navigationController pushViewController:vc animated:YES];
            //跳转到个人页
            [self.navigationController popViewControllerAnimated:YES];
        }});
    [[UMSocialDataService defaultDataService] requestSnsInformation:UMShareToSina  completion:^(UMSocialResponseEntity *response){
        NSLog(@"SnsInformation is %@",response.data);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
