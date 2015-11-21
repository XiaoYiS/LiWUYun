//
//  CategoryCell.m
//  BaseProject
//
//  Created by apple-jd12 on 15/11/19.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "CategoryCell.h"

@implementation CategoryCell
- (ZRImageView *)iconIV {
    if(_iconIV == nil) {
        _iconIV = [[ZRImageView alloc] init];
        [self.contentView addSubview:_iconIV];
        [_iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.top.mas_equalTo(10);
            make.size.mas_equalTo(CGSizeMake(70, 70));
        }];
    }
    return _iconIV;
}

- (UILabel *)titleLb {
    if(_titleLb == nil) {
        _titleLb = [[UILabel alloc] init];
        [self.contentView addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.iconIV.mas_right).mas_equalTo(10);
            make.right.mas_equalTo(10);
//            make.centerY.mas_equalTo(0);
            make.topMargin.mas_equalTo(self.iconIV.mas_topMargin).mas_equalTo(10);
        }];
    }
    return _titleLb;
}
- (UILabel *)subtitle {
    if(_subtitle == nil) {
        _subtitle = [[UILabel alloc] init];
        _subtitle.font = [UIFont systemFontOfSize:15];
        _subtitle.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_subtitle];
        [_subtitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.iconIV.mas_right).mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.bottomMargin.mas_equalTo(self.iconIV.mas_bottomMargin);
        }];
    }
    return _subtitle;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        self.separatorInset = UIEdgeInsetsMake(0, 90, 0, 0);
    }
    return self;
}
@end
