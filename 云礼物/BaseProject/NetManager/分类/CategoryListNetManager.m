//
//  CategoryListNetManager.m
//  BaseProject
//
//  Created by apple-jd12 on 15/11/19.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "CategoryListNetManager.h"

//http://api.liwushuo.com/v2/collections?limit=20&offset=0
#define kListPath @"http://api.liwushuo.com/v2/collections"
#define kLimit @"limit":@(20)

@implementation CategoryListNetManager

+ (id)getCategoryListWithPage:(NSInteger)page completionHandle:(void (^)(id, NSError *))completionHandle{
    NSDictionary *params = @{kLimit, @"offset":@(page)};
    return [self GET:kListPath parameters:params completionHandler:^(id responseObj, NSError *error) {
        completionHandle([CategoryListModel objectWithKeyValues:responseObj],error);
    }];
}
@end
