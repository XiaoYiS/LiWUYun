//
//  CategoriesViewController.m
//  BaseProject
//
//  Created by apple-jd12 on 15/11/19.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "CategoriesViewController.h"
#import "ZTViewController.h"
#import "LWViewController.h"
#import "GLViewController.h"

@interface CategoriesViewController ()


@property (strong,nonatomic) UIButton *currentView;
@end

@implementation CategoriesViewController
+ (CategoriesViewController *)standardCategoryContent{
    static CategoriesViewController *vc = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
         vc = [CategoriesViewController new];
    });
    return vc;
}

- (UIView *)customTabBar {
    if(_customTabBar == nil) {
        self.tabBar.hidden = YES;
        _customTabBar = [[UIView alloc] init];
        self.tabBar.translucent = NO;//不透明
        [self.view addSubview:_customTabBar];
        [_customTabBar mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.mas_equalTo(0);
            make.height.mas_equalTo(self.tabBar.frame.size.height);
        }];
        _customTabBar.backgroundColor = kRGBColor(55, 60, 95);//244, 85, 142
        //添加按钮
        NSArray *itemNames = @[@"专题",@"礼物",@"攻略"];
        //添加颜色
        //        NSArray *colors = @[[UIColor greenColor],[UIColor greenSeaColor],[UIColor orangeColor],[UIColor purpleColor]];
        UIView *lastView = nil;//指向上一个按钮
        for(int i = 0; i < itemNames.count; i++){
            UIButton *button = [UIButton buttonWithType:(UIButtonTypeCustom)];
            [button setTitle:itemNames[i] forState:(UIControlStateNormal)];
            [button setTitleColor:[UIColor greenSeaColor] forState:(UIControlStateSelected)];
            [_customTabBar addSubview:button];
            [button mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.bottom.mas_equalTo(0);
                if (lastView) {
                    make.left.mas_equalTo(lastView.mas_right).mas_equalTo(0);
                    make.width.mas_equalTo(lastView);

                }else{
                    make.left.mas_equalTo(0);
                    _currentView = button;
                    _currentView.selected = button;

                }
                if (i == 2) {
                    make.right.mas_equalTo(0);

                }
            }];
            lastView = button;
            
            //点击事件--点击之后实现跳转
            [button bk_addEventHandler:^(UIButton *sender) {
                if (_currentView != sender) {
                    _currentView.selected = NO;
                    _currentView = sender;
                    sender.selected = YES;
                }
                self.selectedIndex = i;
                
                
            } forControlEvents:(UIControlEventTouchUpInside)];
        }//endfor
    }
    return _customTabBar;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view
    self.customTabBar.hidden = NO;
    [self initTabBar];
}

//定义4个控制器
- (void)initTabBar{
    ZTViewController *zVC = [[ZTViewController alloc]init];
    UINavigationController *zNVC = [[UINavigationController alloc]initWithRootViewController:zVC];
    
    LWViewController *lVC = [[LWViewController alloc]init];
    UINavigationController *lNVC = [[UINavigationController alloc]initWithRootViewController:lVC];
     GLViewController *gVC = [[GLViewController alloc]init];
    UINavigationController *gNVC = [[UINavigationController alloc]initWithRootViewController:gVC];
    
    
    self.viewControllers = @[zNVC,lNVC,gNVC];
    
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
