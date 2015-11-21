//
//  ReMenModel.h
//  LiWuShuo
//
//  Created by apple-jd12 on 15/11/3.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class ReMenDataModel,ReMenDataPagingModel,ReMenDataItemsModel,ReMenDataItemsDataModel;
@interface ReMenModel : BaseModel


@property (nonatomic, copy) NSString *message;

@property (nonatomic, strong) ReMenDataModel *data;

@property (nonatomic, assign) NSInteger code;

@end
@interface ReMenDataModel : NSObject

@property (nonatomic, strong) NSArray<ReMenDataItemsModel *> *items;

@property (nonatomic, strong) ReMenDataPagingModel *paging;

@end

@interface ReMenDataPagingModel : NSObject

@property (nonatomic, copy) NSString *nextUrl;

@end

@interface ReMenDataItemsModel : NSObject

@property (nonatomic, copy) NSString *type;

@property (nonatomic, strong) ReMenDataItemsDataModel *data;

@end

@interface ReMenDataItemsDataModel : NSObject

@property (nonatomic, copy) NSString *desc;

@property (nonatomic, assign) NSInteger editorId;

@property (nonatomic, copy) NSString *url;

@property (nonatomic, copy) NSString *purchaseUrl;

@property (nonatomic, strong) NSArray<NSString *> *imageUrls;

@property (nonatomic, assign) BOOL isFavorite;

@property (nonatomic, assign) NSInteger updatedAt;

@property (nonatomic, assign) NSInteger purchaseType;

@property (nonatomic, copy) NSString *brandId;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, strong) NSArray<NSString *> *postIds;

@property (nonatomic, assign) NSInteger purchaseAtatus;

@property (nonatomic, assign) NSInteger favoritesCount;

@property (nonatomic, assign) NSInteger id;//

@property (nonatomic, copy) NSString *purchaseId;

@property (nonatomic, copy) NSString *brandOrder;

@property (nonatomic, assign) NSInteger subcategoryId;

@property (nonatomic, assign) NSInteger createdAt;

@property (nonatomic, copy) NSString *price;

@property (nonatomic, assign) NSInteger categoryId;

@property (nonatomic, copy) NSString *coverImageUrl;

@end

