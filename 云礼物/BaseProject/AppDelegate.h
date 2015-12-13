//
//  AppDelegate.h
//  BaseProject
//
//  Created by yihaiyang on 15/10/21.
//  Copyright © 2015年 Hazel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <RESideMenu.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong,nonatomic) RESideMenu *sideMenu;
@property(nonatomic,getter=isOnLine) BOOL onLine; //网络状态
@end

