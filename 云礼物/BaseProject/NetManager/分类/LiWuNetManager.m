//
//  LiWuNetManager.m
//  BaseProject
//
//  Created by apple-jd12 on 15/11/21.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "LiWuNetManager.h"

@implementation LiWuNetManager

+ (id)getLiWuListWithPage:(NSInteger)page completionHandle:(void (^)(id, NSError *))completionHandle{
    NSString *path = [NSString stringWithFormat:@"http://gochuse.net/lipin/index/?p=%ld",page];
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandle([LiWuModel objectWithKeyValues:responseObj],error);
    }];
}
@end
