//
//  ShouYeCell.h
//  BaseProject
//
//  Created by apple-jd12 on 15/11/19.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZRImageView.h"

@interface ShouYeCell : UITableViewCell
@property (strong,nonatomic) ZRImageView *iconIV;
@property (strong,nonatomic) UILabel *titleLb;

@property (strong,nonatomic) UILabel *likesCount;


@end
