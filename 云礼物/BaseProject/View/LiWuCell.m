//
//  LiWuCell.m
//  BaseProject
//
//  Created by apple-jd12 on 15/11/21.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "LiWuCell.h"

@implementation LiWuCell

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
        _titleLb.font = [UIFont flatFontOfSize:14];
        _titleLb.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(20);
            make.top.mas_equalTo(self.iconIV.mas_bottom).mas_equalTo(10);
        }];
    }
    return _titleLb;
}

- (UILabel *)timeLb {
    if(_timeLb == nil) {
        _timeLb = [[UILabel alloc] init];
        _timeLb.textAlignment = NSTextAlignmentRight;
        _timeLb.textColor = [UIColor lightGrayColor];
        _timeLb.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:_timeLb];
        [_timeLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.topMargin.mas_equalTo(self.titleLb.mas_topMargin);
            make.right.mas_equalTo(-10);
        }];
    }
    return _timeLb;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        UIView *view = [UIView new];
        view.backgroundColor = [UIColor greenSeaColor];
        self.selectedBackgroundView = view;
    }
    return self;
}

@end
