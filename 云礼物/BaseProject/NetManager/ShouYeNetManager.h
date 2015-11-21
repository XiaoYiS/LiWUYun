//
//  ShouYeNetManager.h
//  LiWuShuo
//
//  Created by apple-jd12 on 15/11/4.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "ShouYeModel.h"


//#define kCompeletionHandle completionHandle:(void(^)(id *model,NSError *error))completionHandle;

typedef NS_ENUM(NSUInteger, ShouYeListType) {
    ShouYeListTypeJingXuan,
    ShouYeListTypeZhangZS,
    ShouYeListTypeShuang11,
    ShouYeListTypeLiWu,
    ShouYeListTypeMeiShi,
    ShouYeListTypeShuMa,
    ShouYeListTypeYuLe,
    ShouYeListTypeYunDong,
};

@interface ShouYeNetManager : BaseNetManager


//精选
//+ (id)getJingXuanListWithIndex:(NSInteger)index completionHandle:(void(^)(ShouYeModel *model,NSError *error))completionHandle;
//其他（ENUM）
+ (id)getShouYeListWithType:(ShouYeListType)type Index:(NSInteger)index completionHandle:(void(^)(ShouYeModel *model,NSError *error))completionHandle;
@end
