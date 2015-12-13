//
//  MySetViewController.m
//  BaseProject
//
//  Created by apple-jd12 on 15/11/22.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "MySetViewController.h"
#import "UMSocial.h"
#import "UMSocialSinaHandler.h"
#import "UMSocialSinaSSOHandler.h"
#import "LoginViewController.h"
@interface MySetViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong,nonatomic) NSUserDefaults *userDefault ;
@property (strong,nonatomic)UITableView *tableView;

@end

@implementation MySetViewController

- (NSUserDefaults *)userDefault{
    if (!_userDefault) {
        _userDefault = [NSUserDefaults standardUserDefaults];
    }
    return _userDefault;
}
+ (UINavigationController *)standardMySetContentNavigation{
    static UINavigationController *nav = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        MySetViewController *vc = [[MySetViewController alloc]init];
        nav = [[UINavigationController alloc]initWithRootViewController:vc];
    });
    return nav;
}

- (UIView *)setImageView{
//    UIImageView *imageView = [UIImageView new];
//    imageView.frame = CGRectMake(0, 0, kWindowW, 240);
//    //        imageView.backgroundColor= [UIColor redColor];
//    imageView.image = [UIImage imageNamed:@"back"];
//    imageView.userInteractionEnabled = YES;
    
    UIView *view = [UIView new];
    view.frame = CGRectMake(0, 0, kWindowW, 240);
    view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"back"]];
    
    //登陆按钮
    UIButton *button = [UIButton buttonWithType:(UIButtonTypeCustom)];
    //        [button setTitle:@"未登录" forState:(UIControlStateNormal)];
    
    button.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    button.layer.cornerRadius = 45;
    //判断是否登陆
    NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    path = [path stringByAppendingPathComponent:@"archivingFile"];
    
    if ([self.userDefault stringForKey:@"userName"]) {
//        [button setBackgroundImageForState:(UIControlStateNormal) withURL:[NSURL URLWithString:[self.userDefault stringForKey:@"iconURL"]] placeholderImage:[UIImage imageNamed:@"qqicon5"]];
//        button.backgroundColor = [UIColor greenSeaColor];
        [button setImageForState:(UIControlStateNormal) withURL:[NSURL URLWithString:[self.userDefault stringForKey:@"iconURL"]] placeholderImage:[UIImage imageNamed:@"qqicon5"]];
        self.title = [self.userDefault stringForKey:@"userName"];
    } else if (![self.userDefault stringForKey:@"userName"]){
        button.backgroundColor = [UIColor whiteColor];
//        [button setBackgroundImage:[UIImage imageNamed:@"qqicon"] forState:(UIControlStateNormal)];
        [button setImage:[UIImage imageNamed:@"qqicon"] forState:(UIControlStateNormal)];
        
    }
    //        button.backgroundColor = [UIColor greenSeaColor];
    //        [button addTarget:self action:@selector(clickBtn:) forControlEvents:(UIControlEventTouchUpInside)];
    [view addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(view);
        make.size.mas_equalTo(CGSizeMake(90, 90));
    }];
    
    [button bk_addEventHandler:^(UIButton *sender) {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"LoginViewController" bundle:nil];
        //弹出登陆界面
        if ([self.userDefault stringForKey:@"userName"]) {
            return ;
        }else {
            LoginViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
            [self.navigationController pushViewController:vc animated:YES];
        }
    } forControlEvents:(UIControlEventTouchUpInside)];
    return view;
}
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:(UITableViewStylePlain)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
        //设置头
//        _tableView.tableHeaderView = [self setImageView];
        
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
    self.tableView.hidden = NO;
    self.title = @"个人中心";
    [FactoryAdd addMenuItemToVC:self];
    //加入头部View
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
    [self.tableView reloadData];
    self.tableView.tableHeaderView = [self setImageView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 7;
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
    if (indexPath.row == 6) {
        cell.textLabel.text = @"退出当前账号";
        cell.textLabel.textColor = [UIColor redColor];
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
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
    if (indexPath.row == 6) {
        //退出登陆
        NSLog(@"退出登陆");
        //取消微博授权
        [[UMSocialDataService defaultDataService] requestUnOauthWithType:UMShareToSina  completion:^(UMSocialResponseEntity *response){
            NSLog(@"response is %@",response);
        }];
        NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
        path = [path stringByAppendingPathComponent:@"archivingFile"];
        //如果存在用户数据 则删除
        if ([self.userDefault stringForKey:@"userName"]) {
            [self.userDefault removeObjectForKey:@"userName"];
            [self.userDefault removeObjectForKey:@"iconURL"];
        }
//        [self.navigationController popViewControllerAnimated:YES];
//        [self setImageView];
        [self.tableView reloadData];
        self.tableView.tableHeaderView = [self setImageView];
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



@end
