//
//  ShouYeModel.h
//  LiWuShuo
//
//  Created by apple-jd12 on 15/11/4.
//  Copyright © 2015年 Hazel. All rights reserved.
//

#import "BaseModel.h"

@class ShouYeDataModel,ShouYeDataPagingModel,ShouYeDataItemsModel;
@interface ShouYeModel : BaseModel

@property (nonatomic, copy) NSString *message;

@property (nonatomic, strong) ShouYeDataModel *data;

@property (nonatomic, assign) NSInteger code;


@end

@interface ShouYeDataModel : NSObject

@property (nonatomic, strong) NSArray<ShouYeDataItemsModel *> *items;

@property (nonatomic, strong) ShouYeDataPagingModel *paging;

@end

@interface ShouYeDataPagingModel : NSObject

@property (nonatomic, copy) NSString *nextUrl;

@end

@interface ShouYeDataItemsModel : NSObject

@property (nonatomic, copy) NSString *coverImageUrl;

@property (nonatomic, assign) NSInteger id;

@property (nonatomic, assign) NSInteger publishedAt;

@property (nonatomic, assign) NSInteger createdAt;

@property (nonatomic, copy) NSString *contentUrl;

@property (nonatomic, strong) NSArray *labels;

@property (nonatomic, copy) NSString *url;

@property (nonatomic, copy) NSString *type;

@property (nonatomic, copy) NSString *shareMsg;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, assign) NSInteger updatedAt;

@property (nonatomic, copy) NSString *shortTitle;

@property (nonatomic, assign) BOOL liked;

@property (nonatomic, assign) NSInteger likesCount;

@property (nonatomic, assign) NSInteger status;

@end

