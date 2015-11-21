//
//  ReMenViewModel.m
//  LiWuShuo
//
//  Created by apple-jd12 on 15/11/3.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ReMenViewModel.h"
#import "ItemsNetManager.h"

@implementation ReMenViewModel

- (NSInteger)rowNumber{
    return self.dataArr.count;
}
- (ReMenDataItemsDataModel *)itemsWithIndexPath:(NSIndexPath *)indexPath{
//    return self.dataArr[indexPath.row];
    return self.dataArr[indexPath.row];
}
- (NSURL *)IconImgWithIndexPath:(NSIndexPath *)indexPath{
    return [NSURL URLWithString:[self itemsWithIndexPath:indexPath].coverImageUrl];
    
    
}
- (NSString *)nameWithIndexPath:(NSIndexPath *)indexPath{
//    NSLog(@"--- %@",[self itemsWithIndexPath:indexPath].name);
    return [self itemsWithIndexPath:indexPath].name;
}
- (NSInteger)IDWithIndexPath:(NSIndexPath *)indexPath{
    return [self itemsWithIndexPath:indexPath].id;
}

- (NSString *)favoritesCountWithIndexPath:(NSIndexPath *)indexPath{
    NSInteger number = [self itemsWithIndexPath:indexPath].favoritesCount;
    if (number < 1000) {
        return @(number).stringValue;
    }else{
        return [NSString stringWithFormat:@"%.1fk",number / 1000.0];
    }
}
- (NSString *)priceWithIndexPath:(NSIndexPath *)indexPath{
    return [self itemsWithIndexPath:indexPath].price;
}

//获取更多
- (void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle{
    self.index += 20;
    [self getDataFromNetCompleteHandle:completionHandle];
}
//刷新
- (void)refreshDataCompletionHandle:(CompletionHandle)completionHandle{
    self.index = 0;
    [self getDataFromNetCompleteHandle:completionHandle];
}
////获取数据
//- (void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
//     [ItemsNetManager getItemsCompletionHandle:^(ReMenModel *model, NSError *error) {
//         
//         for (ReMenDataItemsModel *dic in model.data.items) {
//             //
//             [self.dataArr addObject:dic.data];
//        }
////         NSLog(@"---dataArr -- %@",self.dataArr);
//        completionHandle(error);
//    }];
//    
//}
- (void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    [ItemsNetManager getItemsWithIndex:self.index CompletionHandle:^(ReMenModel *model, NSError *error) {
        if (self.index == 0) {
            [self.dataArr removeAllObjects];
        }
        //隐式转换
        for (ReMenDataItemsModel *dic in model.data.items) {
            [self.dataArr addObject:dic.data];
        }
        completionHandle(error);
    }];
}


@end
