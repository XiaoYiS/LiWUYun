//
//  CategoriesViewController.h
//  BaseProject
//
//  Created by apple-jd12 on 15/11/19.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CategoriesViewController : UITabBarController

+ (CategoriesViewController *)standardCategoryContent;
@property (strong,nonatomic) UIView *customTabBar;
@end
