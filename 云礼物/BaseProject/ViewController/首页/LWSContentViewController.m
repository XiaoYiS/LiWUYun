//
//  LWSContentViewController.m
//  BaseProject
//
//  Created by apple-jd12 on 15/11/19.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "LWSContentViewController.h"
#import "ShouYeTableViewController.h"
@interface LWSContentViewController ()

@end

@implementation LWSContentViewController
+ (UINavigationController *)standardLWSContentNavigation{
    static UINavigationController *nav = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        LWSContentViewController *vc = [[LWSContentViewController alloc]initWithViewControllerClasses:[self viewControllerClasses] andTheirTitles:[self itemNames]];
        vc.keys = [self vcKeys];
        vc.values = [self vcValues];
//中，Classes是要传人显示的控制器的类型，比如[UITableViewController class], titles是要显示的控制对应的标题。 如要定制WMPageController的外观，可通过设置如下属性： titleSize, titleColor, menuHeight, pageAnimatable, menuBGColor, menuItemWidth,rememberLocation,以及 itemsWidths.
        vc.titleColorSelected = kRGBColor(255, 100, 100);
        nav = [[UINavigationController alloc]initWithRootViewController:vc];
    });
    return nav;
}
/** 提供每个VC对应的values值数组 */
+ (NSArray *)vcValues{
    NSMutableArray *arr = [NSMutableArray new];
    for (int i = 0; i <[self itemNames].count; i++) {
        //数值上，vc的infoType的枚举值 恰好和i值相同
        [arr addObject:@(i)];
    }
    return arr;
}
/** 提供每个VC对应的key值数组 */
+ (NSArray *)vcKeys{
    NSMutableArray *arr = [NSMutableArray new];
    for (id obj in [self itemNames]) {
        [arr addObject:@"type"];
    }
    return [arr copy];
}

/** 提供题目数组 */
+ (NSArray *)itemNames{
    return @[@"推荐",@"涨姿势",@"海淘",@"送礼物",@"吃货",@"爱码",@"娱乐",@"动起来"];
}
/** 提供每个题目对应的控制器的类型。题目和类型数量必须一致 */
+ (NSArray *)viewControllerClasses{
    NSMutableArray *arr = [NSMutableArray new];
    for (id obj in [self itemNames]) {
        [arr addObject:[ShouYeTableViewController class]];
    }
    return [arr copy];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [FactoryAdd addMenuItemToVC:self];
    self.title = @"首页";
    self.view.backgroundColor = [UIColor greenSeaColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
