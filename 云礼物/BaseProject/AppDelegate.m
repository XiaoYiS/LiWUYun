//
//  AppDelegate.m
//  BaseProject
//
//  Created by jiyingxin on 15/10/21.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegate+Category.h"
#import "NSString+Icons.h"
#import "WelcomeViewController.h"
#import "LWSMenuViewController.h"
#import "LWSContentViewController.h"
#import "CategoriesViewController.h"


@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self initializeWithApplication:application];

    
    
    //需要在target中info-Bundle identifier--添加最后一个属性来实现
//    application.statusBarStyle = UIStatusBarStyleLightContent;
    
    [NSThread sleepForTimeInterval:1.0];//设置启动页面时间
    
//    self.window.rootViewController = self.sideMenu;
    [self setStart];
    
    [self configGlobalUIStyle];
    return YES;
}
//设置启动页
- (void)setStart{
    /////
    NSDictionary  *infoDict = [[NSBundle mainBundle]infoDictionary];
    
    //    NSLog(@"infoDict:%@",infoDict);
    NSString *key = @"CFBundleShortVersionString";
    
    NSString *currentVersion = infoDict[key];
    NSString *runVersion = [[NSUserDefaults standardUserDefaults] stringForKey:key];
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
    
    if (runVersion == nil || ![runVersion isEqualToString:currentVersion]) {
        NSLog(@"欢迎界面");
        WelcomeViewController *vc = [WelcomeViewController new];
        self.window.rootViewController = vc;
        [[NSUserDefaults standardUserDefaults] setValue:currentVersion forKey:key];
    }else{
        NSLog(@"显示主页面");
      
        self.window.rootViewController = self.sideMenu;
        
    }

}
/** 配置全局UI的样式 */
- (void)configGlobalUIStyle{
    /** 导航栏不透明 */
    [[UINavigationBar appearance] setTranslucent:NO];
    /** 设置导航栏背景图 */
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"back"] forBarMetrics:UIBarMetricsDefault];
    /** 配置导航栏题目的样式 */
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSFontAttributeName:[UIFont flatFontOfSize:kNaviTitleFontSize], NSForegroundColorAttributeName: kNaviTitleColor}];
    
    
    
}
/** 代码重构:用代码把功能实现以后，考虑代码结构如何编写可以更加方便后期维护 */
- (UIWindow *)window{
    if (!_window) {
        _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        [_window makeKeyAndVisible];
    }
    return _window;
}

- (RESideMenu *)sideMenu{
    if (!_sideMenu) {
        _sideMenu=[[RESideMenu alloc]initWithContentViewController:[CategoriesViewController standardCategoryContent] leftMenuViewController:[LWSMenuViewController new] rightMenuViewController:nil];
        //为sideMenu设置背景图,图片插件KSImageName，到Github下载
        _sideMenu.backgroundImage =[UIImage imageNamed:@"p_bg"];
        //可以让出现菜单时不显示状态栏
        //        _sideMenu.menuPrefersStatusBarHidden = YES;
        //不允许菜单栏到了边缘还可以继续缩小
        _sideMenu.bouncesHorizontally = NO;
    }
    return _sideMenu;
}

@end
