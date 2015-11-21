//
//  ListDetailNetManager.m
//  BaseProject
//
//  Created by apple-jd12 on 15/11/19.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ListDetailNetManager.h"
//?limit=20&offset=0
#define kListDetialPath @"http://api.liwushuo.com/v2/collections/%@/posts"
#define kLimit @"limit":@20

@implementation ListDetailNetManager

+ (id)getListDeatilWithId:(NSInteger)ID page:(NSInteger)page completionHandle:(void (^)(id, NSError *))completionHandle{
    NSString *path = [NSString stringWithFormat:kListDetialPath,@(ID)];
    return [self GET:path parameters:@{kLimit,@"offset":@(page)} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([ListDetailModel objectWithKeyValues:responseObj],error);
    }];
}
@end
