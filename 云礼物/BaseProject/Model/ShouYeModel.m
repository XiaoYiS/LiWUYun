//
//  ShouYeModel.m
//  LiWuShuo
//
//  Created by apple-jd12 on 15/11/4.
//  Copyright © 2015年 Hazel. All rights reserved.
//

#import "ShouYeModel.h"

@implementation ShouYeModel

@end


@implementation ShouYeDataModel

+ (NSDictionary *)objectClassInArray{
    return @{@"items" : [ShouYeDataItemsModel class]};
}

@end


@implementation ShouYeDataPagingModel

@end


@implementation ShouYeDataItemsModel


+ (NSDictionary *)replacedKeyFromPropertyName{
    return @{@"ID":@"id"};
}

+ (NSString *)replacedKeyFromPropertyName121:(NSString *)propertyName{
    return [propertyName underlineFromCamel];
}
@end


