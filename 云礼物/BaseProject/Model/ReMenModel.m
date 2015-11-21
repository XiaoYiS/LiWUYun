//
//  ReMenModel.m
//  LiWuShuo
//
//  Created by apple-jd12 on 15/11/3.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ReMenModel.h"

@implementation ReMenModel

@end
@implementation ReMenDataModel

+ (NSDictionary *)objectClassInArray{
    return @{@"items" : [ReMenDataItemsModel class]};
}

@end


@implementation ReMenDataPagingModel

@end


@implementation ReMenDataItemsModel

@end


@implementation ReMenDataItemsDataModel

+ (NSDictionary *)replacedKeyFromPropertyName{
    return @{@"desc":@"description",@"ID":@"id"};
}

+ (NSString *)replacedKeyFromPropertyName121:(NSString *)propertyName{
    return [propertyName underlineFromCamel];
}
@end


