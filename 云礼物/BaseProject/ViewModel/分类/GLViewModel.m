//
//  GLViewModel.m
//  BaseProject
//
//  Created by apple-jd12 on 15/11/20.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "GLViewModel.h"

@implementation GLViewModel

- (instancetype)initWithplType:(GLPLType)type{
    if (self = [super init]) {
        self.pltype = type;
    }
    return self;
}

- (NSInteger)rowNumber{
    return self.dataArr.count;
}
- (GLDataItemsModel *)modelForRow:(NSInteger)row{
    return self.dataArr[row];
}
- (void)refreshDataCompletionHandle:(CompletionHandle)completionHandle{
    _page = 0;
    [self getDataFromNetCompleteHandle:completionHandle];
}
- (void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    self.dataTask = [GLNetManager getGLPLDetailWithType:self.pltype page:self.page completionHandle:^(GLModel *model, NSError *error) {
        if (!error) {
            if (_page == 0) {
                [self.dataArr removeAllObjects];
            }
            [self.dataArr addObjectsFromArray:model.data.items];
        }
        completionHandle(error);
    }];
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
- (NSURL *)URLForRow:(NSInteger)row{
    return [NSURL URLWithString:[self modelForRow:row].url];
}
- (NSString *)urlForRow:(NSInteger)row{
    return [self modelForRow:row].url;
}
@end
