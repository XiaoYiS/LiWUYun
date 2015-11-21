//
//  CategoryListModel.h
//  BaseProject
//
//  Created by apple-jd12 on 15/11/19.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class ListDataModel,ListDataPagingModel,ListDataCollectionsModel;
@interface CategoryListModel : BaseModel

@property (nonatomic, copy) NSString *message;

@property (nonatomic, strong) ListDataModel *data;

@property (nonatomic, assign) NSInteger code;

@end
@interface ListDataModel : NSObject

@property (nonatomic, strong) NSArray<ListDataCollectionsModel *> *collections;

@property (nonatomic, strong) ListDataPagingModel *paging;

@end

@interface ListDataPagingModel : NSObject

@property (nonatomic, copy) NSString *nextUrl;

@end

@interface ListDataCollectionsModel : NSObject

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, copy) NSString *bannerImageUrl;

@property (nonatomic, copy) NSString *subtitle;

@property (nonatomic, assign) NSInteger id;

@property (nonatomic, assign) NSInteger createdAt;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *coverImageUrl;//cover_image_url

@property (nonatomic, assign) NSInteger updatedAt;

@property (nonatomic, assign) NSInteger postsCount;

@end

