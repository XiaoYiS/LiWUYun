//
//  ReMenCell.h
//  BaseProject
//
//  Created by apple-jd12 on 15/11/19.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZRImageView.h"
@interface ReMenCell : UICollectionViewCell

@property (strong,nonatomic) ZRImageView *iconIV;
@property (strong,nonatomic) UILabel *titleLb;
@property (strong,nonatomic) UILabel *moneyLb;
@property (strong,nonatomic) UILabel *countLb;

@end
