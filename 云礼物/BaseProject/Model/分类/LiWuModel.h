//
//  LiWuModel.h
//  BaseProject
//
//  Created by apple-jd12 on 15/11/21.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class LiWuInfModel,LiWuCategoryListMode;
@interface LiWuModel : BaseModel

@property (nonatomic, strong) NSArray<LiWuInfModel *> *inf;

@property (nonatomic, strong) NSArray<LiWuCategoryListMode *> *category_list;

@end
@interface LiWuInfModel : NSObject

@property (nonatomic, copy) NSString *hprice;

@property (nonatomic, copy) NSString *addtime;

@property (nonatomic, copy) NSString *lprice;

@property (nonatomic, copy) NSString *ID;

@property (nonatomic, copy) NSString *originalhprice;

@property (nonatomic, copy) NSString *originallprice;

@property (nonatomic, copy) NSString *pic;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *state;

@property (nonatomic, copy) NSString *taobaoChangeURL;

@end

@interface LiWuCategoryListMode : NSObject

@property (nonatomic, copy) NSString *targetUrl;

@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, copy) NSString *categoryName;

@property (nonatomic, copy) NSString *img;

@end

