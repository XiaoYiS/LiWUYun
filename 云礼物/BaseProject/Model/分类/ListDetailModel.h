//
//  ListDetailModel.h
//  BaseProject
//
//  Created by apple-jd12 on 15/11/19.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class ListDetailDataModel,ListDetailDataPagingModel,ListDetailDataPostsModel;
@interface ListDetailModel : BaseModel

@property (nonatomic, copy) NSString *message;

@property (nonatomic, strong) ListDetailDataModel *data;

@property (nonatomic, assign) NSInteger code;

@end
@interface ListDetailDataModel : NSObject

@property (nonatomic, strong) ListDetailDataPagingModel *paging;

@property (nonatomic, copy) NSString *bannerImageUrl;

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, assign) NSInteger id;

@property (nonatomic, assign) NSInteger createdAt;

@property (nonatomic, copy) NSString *subtitle;

@property (nonatomic, strong) NSArray<ListDetailDataPostsModel *> *posts;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *coverImageUrl;

@property (nonatomic, assign) NSInteger updatedAt;

@property (nonatomic, assign) NSInteger postsCount;

@end

@interface ListDetailDataPagingModel : NSObject

@property (nonatomic, copy) NSString *nextUrl;

@end

@interface ListDetailDataPostsModel : NSObject

@property (nonatomic, copy) NSString *coverImageUrl;

@property (nonatomic, assign) NSInteger id;

@property (nonatomic, assign) NSInteger publishedAt;

@property (nonatomic, copy) NSString *tempLate;

@property (nonatomic, copy) NSString *editorId;

@property (nonatomic, strong) NSArray *labelIds;

@property (nonatomic, assign) NSInteger createdAt;

@property (nonatomic, copy) NSString *contentUrl;

@property (nonatomic, copy) NSString *url;

@property (nonatomic, copy) NSString *shareMsg;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, assign) NSInteger updatedAt;

@property (nonatomic, copy) NSString *shortTitle;

@property (nonatomic, assign) BOOL liked;

@property (nonatomic, assign) NSInteger likesCount;

@property (nonatomic, assign) NSInteger status;

@end

