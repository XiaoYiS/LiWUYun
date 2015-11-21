//
//  ShouYeNetManager.m
//  LiWuShuo
//
//  Created by apple-jd12 on 15/11/4.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ShouYeNetManager.h"

@implementation ShouYeNetManager

+ (id)getShouYeListWithType:(ShouYeListType)type Index:(NSInteger)index completionHandle:(void (^)(ShouYeModel *, NSError *))completionHandle{
    NSString *path = nil;
    switch (type) {
        case ShouYeListTypeJingXuan:
            path = [NSString stringWithFormat:@"http://api.liwushuo.com/v2/channels/101/items?ad=2&gender=1&generation=2&limit=20&offset=%ld",index];
            break;
        case ShouYeListTypeZhangZS:
            path = [NSString stringWithFormat:@"http://api.liwushuo.com/v2/channels/120/items?gender=1&limit=20&offset=%ld&generation=2",index];
            break;
        case ShouYeListTypeShuang11:
            path = [NSString stringWithFormat:@"http://api.liwushuo.com/v2/channels/128/items?gender=1&limit=20&offset=%ld&generation=2",index];
            break;
        case ShouYeListTypeLiWu:
            path = [NSString stringWithFormat:@"http://api.liwushuo.com/v2/channels/111/items?gender=1&limit=20&offset=%ld&generation=2",index];
            break;
        case ShouYeListTypeMeiShi:
            path = [NSString stringWithFormat:@"http://api.liwushuo.com/v2/channels/118/items?gender=1&limit=20&offset=%ld&generation=2",index];
            break;
        case ShouYeListTypeShuMa:
            path = [NSString stringWithFormat:@"http://api.liwushuo.com/v2/channels/121/items?gender=1&limit=20&offset=%ld&generation=2",index];
            break;
        case ShouYeListTypeYuLe:
            path = [NSString stringWithFormat:@"http://api.liwushuo.com/v2/channels/120/items?gender=1&limit=20&offset=%ld&generation=2",index];
            break;
        case ShouYeListTypeYunDong:
            path = [NSString stringWithFormat:@"http://api.liwushuo.com/v2/channels/123/items?gender=1&limit=20&offset=%ld&generation=2",index];
            break;
            
        default:
            break;
    }
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandle([ShouYeModel objectWithKeyValues:responseObj],error);
    }];
}
@end
