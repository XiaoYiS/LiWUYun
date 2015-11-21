//
//  CategoryDetailViewModel.m
//  BaseProject
//
//  Created by apple-jd12 on 15/11/19.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "CategoryDetailViewModel.h"

@implementation CategoryDetailViewModel


- (id)initWithID:(NSInteger)ID{
    if (self = [super init]) {
        self.ID = ID;
    }
    return self;
}
- (NSInteger)rowNumber{
    return self.dataArr.count;
}
- (ListDetailDataPostsModel *)modelForRow:(NSInteger)row{
    return self.dataArr[row];
}
- (void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    self.dataTask = [ListDetailNetManager getListDeatilWithId:_ID page:_page completionHandle:^(ListDetailModel *model, NSError *error) {
        if (!error) {
            if (_page == 0) {
                [self.dataArr removeAllObjects];
            }
            [self.dataArr addObjectsFromArray:model.data.posts];
        }
        completionHandle(error);
    }];
}
- (void)refreshDataCompletionHandle:(CompletionHandle)completionHandle{
    _page = 0;
    [self getDataFromNetCompleteHandle:completionHandle];
}
- (void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle{
    _page += 20;
    [self getDataFromNetCompleteHandle:completionHandle];
}
- (NSURL *)iconURLForRow:(NSInteger)row{
    return [NSURL URLWithString:[self modelForRow:row].coverImageUrl];
}
- (NSString *)titleForRow:(NSInteger)row{
    return [self modelForRow:row].title;
}
- (NSInteger )IDForRow:(NSInteger)row{
    return [self modelForRow:row].id;
}
- (NSInteger)likesCountForRow:(NSInteger)row{
    return [self modelForRow:row].likesCount;
}
- (NSURL *)URLForRow:(NSInteger)row{
    return [NSURL URLWithString:[self modelForRow:row].url];
}
@end
