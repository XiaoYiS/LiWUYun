//
//  ShouYeCell.h
//  BaseProject
//
//  Created by apple-jd12 on 15/11/19.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZRImageView.h"


typedef  void(^blockButton)(NSString *str);

@interface ShouYeCell : UITableViewCell
@property (strong,nonatomic) ZRImageView *iconIV;
@property (strong,nonatomic) UILabel *titleLb;

@property (strong,nonatomic) UILabel *likesCount;

//block属性
@property (strong,nonatomic) blockButton button;
//自定义的block方法
- (void)handleButtonAction:(blockButton)block;
@end
