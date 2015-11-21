//
//  GLModel.h
//  BaseProject
//
//  Created by apple-jd12 on 15/11/20.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class GLDataModel,GLDataPagingModel,GLDataItemsModel;
@interface GLModel : BaseModel

@property (nonatomic, copy) NSString *message;

@property (nonatomic, strong) GLDataModel *data;

@property (nonatomic, assign) NSInteger code;

@end
@interface GLDataModel : NSObject

@property (nonatomic, strong) NSArray<GLDataItemsModel *> *items;

@property (nonatomic, strong) GLDataPagingModel *paging;

@end

@interface GLDataPagingModel : NSObject

@property (nonatomic, copy) NSString *next_url;

@end

@interface GLDataItemsModel : NSObject

@property (nonatomic, copy) NSString *coverImageUrl;

@property (nonatomic, assign) NSInteger id;

@property (nonatomic, assign) NSInteger publishedAt;

@property (nonatomic, copy) NSString *tempLate;

@property (nonatomic, copy) NSString *editorId;

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

