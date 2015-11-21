//
//  CategoryListModel.m
//  BaseProject
//
//  Created by apple-jd12 on 15/11/19.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "CategoryListModel.h"

@implementation CategoryListModel

@end
@implementation ListDataModel

+ (NSDictionary *)objectClassInArray{
    return @{@"collections" : [ListDataCollectionsModel class]};
}

@end


@implementation ListDataPagingModel

@end


@implementation ListDataCollectionsModel

+ (NSDictionary *)replacedKeyFromPropertyName{
    return @{@"ID":@"id"};
}
+ (NSString *)replacedKeyFromPropertyName121:(NSString *)propertyName{
    return [propertyName underlineFromCamel];
}
@end


