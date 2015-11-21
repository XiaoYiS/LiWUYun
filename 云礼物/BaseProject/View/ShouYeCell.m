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
            make.edges.mas_equalTo(UIEdgeInsetsMake(10, 10, 10, 10));
        }];
    }
    return _iconIV;
}

- (UILabel *)titleLb {
    if(_titleLb == nil) {
        _titleLb = [[UILabel alloc] init];
        _titleLb.numberOfLines = 0;
        _titleLb.textColor = [UIColor whiteColor];
        [self.iconIV addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(20);
            make.right.mas_equalTo(-10);
            make.bottom.mas_equalTo(self.iconIV.mas_bottom).mas_equalTo(-10);
        }];
    }
    return _titleLb;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.accessoryType = UITableViewCellSeparatorStyleNone;
    }
    return self;
}

@end
