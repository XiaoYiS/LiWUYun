//
//  ReMenViewModel.h
//  LiWuShuo
//
//  Created by apple-jd12 on 15/11/3.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "ReMenModel.h"
@interface ReMenViewModel : BaseViewModel

@property (strong,nonatomic) ReMenDataItemsDataModel *rDIDModel;

- (ReMenDataItemsDataModel *)itemsWithIndexPath:(NSIndexPath *)indexPath;

@property (assign,nonatomic)NSInteger rowNumber;
@property (assign,nonatomic) NSInteger index;
//对应的信息
- (NSURL *)IconImgWithIndexPath:(NSIndexPath *)indexPath;
- (NSString *)nameWithIndexPath:(NSIndexPath *)indexPath;
- (NSString *)priceWithIndexPath:(NSIndexPath *)indexPath;
- (NSString *)favoritesCountWithIndexPath:(NSIndexPath *)indexPath;

- (NSInteger)IDWithIndexPath:(NSIndexPath *)indexPath;

@end
