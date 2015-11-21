//
//  LiWuViewModel.m
//  BaseProject
//
//  Created by apple-jd12 on 15/11/21.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "LiWuViewModel.h"

@implementation LiWuViewModel

- (NSInteger)rowNumber{
    return self.dataArr.count;
}
- (LiWuInfModel *)modelForRow:(NSInteger)row{
    return self.dataArr[row];
}

- (void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    self.dataTask = [LiWuNetManager getLiWuListWithPage:_page completionHandle:^(LiWuModel *model, NSError *error) {
        if (!error) {
            if (_page == 1) {
                [self.dataArr removeAllObjects];
            }
            [self.dataArr addObjectsFromArray:model.inf];
        }
        completionHandle(error);
    }];
}
- (void)refreshDataCompletionHandle:(CompletionHandle)completionHandle{
    _page = 1;
    [self getDataFromNetCompleteHandle:completionHandle];
}
- (void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle{
    _page += 1;
    [self getDataFromNetCompleteHandle:completionHandle];
}
- (NSURL *)picURLForRow:(NSInteger)row{
    return [NSURL URLWithString:[self modelForRow:row].pic];
}
- (NSString *)titleForRow:(NSInteger)row{
    return [self modelForRow:row].title;
}
- (NSString *)hPriceForRow:(NSInteger)row{
    return [self modelForRow:row].hprice;
}
- (NSString *)addTimeForRow:(NSInteger)row{
    return [self modelForRow:row].addtime;
}
@end
