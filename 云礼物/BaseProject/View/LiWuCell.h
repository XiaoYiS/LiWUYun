//
//  LiWuCell.h
//  BaseProject
//
//  Created by apple-jd12 on 15/11/21.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZRImageView.h"

@interface LiWuCell : UITableViewCell

@property (strong,nonatomic) ZRImageView *iconIV;
@property (strong,nonatomic) UILabel *titleLb;
@property (strong,nonatomic) UILabel *timeLb;

@end
