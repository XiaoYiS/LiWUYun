//
//  ShouYeCell.m
//  BaseProject
//
//  Created by apple-jd12 on 15/11/19.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ShouYeCell.h"

@implementation ShouYeCell

- (ZRImageView *)iconIV {
    if(_iconIV == nil) {
        _iconIV = [[ZRImageView alloc] init];
        [self.contentView addSubview:_iconIV];
        [_iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.height.mas_equalTo(200);
        }];
    }
    return _iconIV;
}

- (UILabel *)titleLb {
    if(_titleLb == nil) {
        _titleLb = [[UILabel alloc] init];
        _titleLb.numberOfLines = 0;
        _titleLb.textAlignment = NSTextAlignmentCenter;//居中
        _titleLb.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(20);
            make.right.mas_equalTo(-10);
            make.top.mas_equalTo(self.iconIV.mas_bottom).mas_equalTo(10);
        }];
    }
    return _titleLb;
}
- (UILabel *)likesCount {
    if(_likesCount == nil) {
        _likesCount = [[UILabel alloc] init];
        _likesCount.font = [UIFont systemFontOfSize:14];
        _likesCount.textAlignment = NSTextAlignmentRight;
        _likesCount.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_likesCount];
        UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"count"]];
        [self.contentView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(20, 20));
            make.right.mas_equalTo(self.likesCount.mas_left).mas_equalTo(-2);
            make.bottomMargin.mas_equalTo(self.likesCount.mas_bottomMargin).mas_equalTo(0);
            //            make.bottom.mas_equalTo(-4);
        }];
        [_likesCount mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-10);
            make.bottom.mas_equalTo(-4);
        }];

    }
    return _likesCount;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.accessoryType = UITableViewCellSeparatorStyleNone;
    }
    return self;
}

@end
