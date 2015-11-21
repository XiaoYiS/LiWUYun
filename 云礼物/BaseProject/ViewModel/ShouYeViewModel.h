//
//  ShouYeViewModel.h
//  LiWuShuo
//
//  Created by apple-jd12 on 15/11/4.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "ShouYeNetManager.h"
@interface ShouYeViewModel : BaseViewModel

//title
//cover_image_url

@property (assign,nonatomic) NSInteger index;
@property (assign,nonatomic) NSInteger rowNumber;

//头部视图


//- (ShouYeDataItemsModel *)itemsWithIndexPath:(NSIndexPath *)indexPath;

- (NSURL *)coverImgForRow:(NSInteger)row;
- (NSString *)titlegForRow:(NSInteger)row;
- (NSInteger)likeCountgForRow:(NSInteger)row;
- (NSInteger)IDForRow:(NSInteger)row;

//
- (id)initWithShouYeListType:(ShouYeListType)type;
@property (assign,nonatomic) ShouYeListType type;

//@property (strong,nonatomic) NSArray *headImgURLs;
//- (NSNumber *)adIDForRow:(NSInteger)row;
@property (assign,nonatomic) NSInteger page;
@end
