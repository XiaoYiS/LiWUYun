//
//  ReMenCell.m
//  BaseProject
//
//  Created by apple-jd12 on 15/11/19.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ReMenCell.h"

@implementation ReMenCell
- (ZRImageView *)iconIV {
    if(_iconIV == nil) {
        _iconIV = [[ZRImageView alloc] init];
        [self.contentView addSubview:_iconIV];
        [_iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.mas_equalTo(0);
            make.height.mas_equalTo(_iconIV.mas_width);
        }];
    }
    return _iconIV;
}

- (UILabel *)titleLb {
    if(_titleLb == nil) {
        _titleLb = [[UILabel alloc] init];
        _titleLb.numberOfLines = 0;
        _titleLb.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.top.mas_equalTo(self.iconIV.mas_bottom).mas_equalTo(10);
            make.right.mas_equalTo(-10);
        }];
    }
    return _titleLb;
}

- (UILabel *)moneyLb {
    if(_moneyLb == nil) {
        _moneyLb = [[UILabel alloc] init];
//        _moneyLb.font = [UIFont systemFontOfSize:18];
        _moneyLb.textColor = [UIColor redColor];
        [self.contentView addSubview:_moneyLb];
        [_moneyLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.bottom.mas_equalTo(-4);
            make.width.mas_equalTo(70);
        }];
    }
    return _moneyLb;
}

- (UILabel *)countLb {
    if(_countLb == nil) {
        _countLb = [[UILabel alloc] init];
        _countLb.font = [UIFont systemFontOfSize:14];
        _countLb.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_countLb];
        UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"count"]];
        [self.contentView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(20, 20));
            make.right.mas_equalTo(self.countLb.mas_left).mas_equalTo(-2);
            make.bottomMargin.mas_equalTo(self.moneyLb.mas_bottomMargin).mas_equalTo(0);
//            make.bottom.mas_equalTo(-4);
        }];
        [_countLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-10);
            make.bottomMargin.mas_equalTo(self.moneyLb.mas_bottomMargin).mas_equalTo(0);
        }];
    }
    return _countLb;
}

@end
