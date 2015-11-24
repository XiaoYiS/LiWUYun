//
//  MySetViewController.m
//  BaseProject
//
//  Created by apple-jd12 on 15/11/22.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "MySetViewController.h"
#import "UMSocial.h"

@interface MySetViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong,nonatomic)UITableView *tableView;

@end

@implementation MySetViewController
+ (UINavigationController *)standardMySetContentNavigation{
    static UINavigationController *nav = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        MySetViewController *vc = [[MySetViewController alloc]init];
        nav = [[UINavigationController alloc]initWithRootViewController:vc];
    });
    return nav;
}
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:(UITableViewStylePlain)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
        UIImageView *imageView = [UIImageView new];
        imageView.frame = CGRectMake(0, 0, kWindowW, 240);
//        imageView.backgroundColor= [UIColor redColor];
        imageView.image = [UIImage imageNamed:@"back"];
        imageView.userInteractionEnabled = YES;
        _tableView.tableHeaderView = imageView;
        
        //登陆按钮
        UIButton *button = [UIButton buttonWithType:(UIButtonTypeCustom)];
//        [button setTitle:@"未登录" forState:(UIControlStateNormal)];
        [button setBackgroundImage:[UIImage imageNamed:@"qqicon"] forState:(UIControlStateNormal)];
//        button.backgroundColor = [UIColor greenSeaColor];
//        [button addTarget:self action:@selector(clickBtn:) forControlEvents:(UIControlEventTouchUpInside)];
        [imageView addSubview:button];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.mas_equalTo(imageView);
        }];
        
        [button bk_addEventHandler:^(UIButton *sender) {
            //实现第三方qq登陆功能
            
            UMSocialSnsPlatform *snsPlatform = [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToQQ];
            
            snsPlatform.loginClickHandler(self,[UMSocialControllerService defaultControllerService],YES,^(UMSocialResponseEntity *response){
                
                //          获取微博用户名、uid、token等
                
                if (response.responseCode == UMSResponseCodeSuccess) {
                    
                    UMSocialAccountEntity *snsAccount = [[UMSocialAccountManager socialAccountDictionary] valueForKey:UMShareToQQ];
                    
                    NSLog(@"username is %@, uid is %@, token is %@ url is %@",snsAccount.userName,snsAccount.usid,snsAccount.accessToken,snsAccount.iconURL);
                    
                }});
        } forControlEvents:(UIControlEventTouchUpInside)];
        
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];

        
    }
    return _tableView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.tableView reloadData];
    self.title = @"个人中心";
    [FactoryAdd addMenuItemToVC:self];
    //加入头部View
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 6;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:(UITableViewCellStyleValue1) reuseIdentifier:@"Cell"];
    }
    //设置里面加入版本检测更新
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    if (indexPath.row == 0) {
        cell.textLabel.text = @"我的订单";
        cell.detailTextLabel.text = @"暂无";
        cell.detailTextLabel.font = [UIFont systemFontOfSize:15];
        cell.detailTextLabel.textColor = [UIColor redColor];
    }
    if (indexPath.row == 1) {
        cell.textLabel.text = @"我的收藏";
    }
    if (indexPath.row == 2) {
        cell.textLabel.text = @"我的分享";
    }
    if (indexPath.row == 3) {
        cell.textLabel.text = @"喜欢的礼物";
    }
    if (indexPath.row == 4) {
        cell.textLabel.text = @"喜欢的攻略";
    }
    if (indexPath.row == 5) {
        cell.textLabel.text = @"检测最新版本 ";
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 5) {
        //AlertView
        //得到当前版本，判断当前版本是否和安装的版本一样，
        //alertview提示是否更新
        
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"检测新版本" message:@"当前已经是最新的版本了" delegate:self cancelButtonTitle:@"确认" otherButtonTitles: nil];
        [alertView show];

//
//        NSDictionary  *infoDict = [[NSBundle mainBundle]infoDictionary];
//        
//        //    NSLog(@"infoDict:%@",infoDict);
//        NSString *key = @"CFBundleShortVersionString";
//        
//        NSString *currentVersion = infoDict[key];
//        NSString *runVersion = [[NSUserDefaults standardUserDefaults] stringForKey:key];
//        if ( ![runVersion isEqualToString:currentVersion]) {
//            NSLog(@"更新");
//            [[NSUserDefaults standardUserDefaults] setValue:currentVersion forKey:key];
//        }else{
//            NSLog(@"显示已经是最新版本");
//            
//            UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"检测新版本" message:@"当前已经是最新的版本了" delegate:self cancelButtonTitle:@"返回" otherButtonTitles:@"确认", nil];
//            [alertView show];
//        }

    }
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}
//kRemoveCellSeparator
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    cell.separatorInset = UIEdgeInsetsZero;
    cell.layoutMargins = UIEdgeInsetsZero;
    cell.preservesSuperviewLayoutMargins = NO;
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
