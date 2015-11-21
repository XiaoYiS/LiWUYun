//
//  ListDetailViewModel.m
//  BaseProject
//
//  Created by apple-jd12 on 15/11/19.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ListDetailViewModel.h"

@implementation ListDetailViewModel

- (NSInteger)rowNumber{
    return self.dataArr.count;
}
- (ListDataCollectionsModel *)modelForRow:(NSInteger)row{
    return self.dataArr[row];
}
- (void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    self.dataTask = [CategoryListNetManager getCategoryListWithPage:_page completionHandle:^(CategoryListModel *model, NSError *error) {
        if (!error) {
            if (_page == 0) {
                [self.dataArr removeAllObjects];
            }
            [self.dataArr addObjectsFromArray:model.data.collections];
        }
        completionHandle(error);
    }];
}
- (void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle{
    _page += 20;
    [self getDataFromNetCompleteHandle:completionHandle];
}
- (void)refreshDataCompletionHandle:(CompletionHandle)completionHandle{
    _page = 0;
    [self getDataFromNetCompleteHandle:completionHandle];
}

- (NSString *)titleForRow:(NSInteger)row{
    return [self modelForRow:row].title;
}

- (NSURL *)iconURLForRow:(NSInteger)row{
    return [NSURL URLWithString:[self modelForRow:row].coverImageUrl];
}
- (NSString *)subTitleForRow:(NSInteger)row{
    return  [self modelForRow:row].subtitle;
}
- (NSInteger)IdForRow:(NSInteger)row{
    return [self modelForRow:row].id;
}
@end
