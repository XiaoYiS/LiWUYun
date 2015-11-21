//
//  ItemsNetManager.m
//  LiWuShuo
//
//  Created by apple-jd12 on 15/11/3.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ItemsNetManager.h"

@implementation ItemsNetManager

/**
 *  http://api.liwushuo.com/v2/items?gender=1&limit=20&offset=0&generation=2

 */
+ (id)getItemsWithIndex:(NSInteger)index CompletionHandle:(void(^)(ReMenModel *model,NSError *error))completionHandle{
    NSString *path = [NSString stringWithFormat:@"http://api.liwushuo.com/v2/items?gender=1&limit=20&offset=%ld&generation=2",(long)index];
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandle([ReMenModel objectWithKeyValues:responseObj],error);
    }];

}

@end
