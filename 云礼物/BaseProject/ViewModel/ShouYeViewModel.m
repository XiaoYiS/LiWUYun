//
//  ShouYeViewModel.m
//  LiWuShuo
//
//  Created by apple-jd12 on 15/11/4.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ShouYeViewModel.h"

@implementation ShouYeViewModel

- (id)initWithShouYeListType:(ShouYeListType)type{
    if (self = [super init]) {
        _type = type;
    }
    return self;
}
- (NSInteger)rowNumber{
    return self.dataArr.count;
}

- (ShouYeDataItemsModel *)itemsgForRow:(NSInteger)row{
    return self.dataArr[row];
}
- (NSURL *)coverImgForRow:(NSInteger)row{
    NSString *str = [self itemsgForRow:row].coverImageUrl;
    return [NSURL URLWithString:str];
}
- (NSString *)titlegForRow:(NSInteger)row{
    return [self itemsgForRow:row].title;
}
- (NSInteger)likeCountgForRow:(NSInteger)row{
    return [self itemsgForRow:row].likesCount;
}
- (NSInteger)IDForRow:(NSInteger)row{
//    NSLog(@"--=id-ID====-- %ld",[self itemsgForRow:row].id);
    return [self itemsgForRow:row].id;
}

- (void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle{
    self.index += 20;
    [self getDataFromNetCompleteHandle:completionHandle];
}
- (void)refreshDataCompletionHandle:(CompletionHandle)completionHandle{
    self.index = 0;
    [self getDataFromNetCompleteHandle:completionHandle];
    
}
- (void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    self.dataTask = [ShouYeNetManager getShouYeListWithType:_type Index:_index completionHandle:^(ShouYeModel *model, NSError *error) {
        if (self.index == 0) {
            [self.dataArr removeAllObjects];
        }
        [self.dataArr addObjectsFromArray:model.data.items];
        
        //头部img
//        self.headImgURLs = [model.data.items copy];
//        self.headImgURLs = nil;
        
        completionHandle(error);
    }];
}
//
//- (NSNumber *)adIDForRow:(NSInteger)row{
//    
//}
@end
