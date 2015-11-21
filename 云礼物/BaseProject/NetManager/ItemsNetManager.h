//
//  ItemsNetManager.h
//  LiWuShuo
//
//  Created by apple-jd12 on 15/11/3.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "ReMenModel.h"


@interface ItemsNetManager : BaseNetManager

//请求items
//+ (id)getItemsCompletionHandle:(void(^)(ReMenModel *model,NSError *error))completionHandle;
//
+ (id)getItemsWithIndex:(NSInteger)index CompletionHandle:(void(^)(ReMenModel *model,NSError *error))completionHandle;


@end
