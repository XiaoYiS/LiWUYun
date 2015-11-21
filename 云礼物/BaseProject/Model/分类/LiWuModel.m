//
//  LiWuModel.m
//  BaseProject
//
//  Created by apple-jd12 on 15/11/21.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "LiWuModel.h"

@implementation LiWuModel


+ (NSDictionary *)objectClassInArray{
    return @{@"inf" : [LiWuInfModel class], @"category_list" : [LiWuCategoryListMode class]};
}
@end
@implementation LiWuInfModel
+ (NSDictionary *)replacedKeyFromPropertyName{
    return @{@"ID":@"id"};
}
@end


@implementation LiWuCategoryListMode


+ (NSDictionary *)replacedKeyFromPropertyName{
    return @{@"ID":@"id"};
}
+ (NSString *)replacedKeyFromPropertyName121:(NSString *)propertyName{
    return [propertyName underlineFromCamel];
}
@end


