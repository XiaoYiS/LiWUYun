//
//  ListDetailModel.m
//  BaseProject
//
//  Created by apple-jd12 on 15/11/19.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ListDetailModel.h"

@implementation ListDetailModel

@end
@implementation ListDetailDataModel

+ (NSDictionary *)objectClassInArray{
    return @{@"posts" : [ListDetailDataPostsModel class]};
}

+ (NSString *)replacedKeyFromPropertyName121:(NSString *)propertyName{
    return [propertyName underlineFromCamel];
}

@end


@implementation ListDetailDataPagingModel

@end


@implementation ListDetailDataPostsModel
+ (NSString *)replacedKeyFromPropertyName121:(NSString *)propertyName{
    if ([propertyName isEqualToString:@"tempLate"]) {
        return [propertyName firstCharUpper];
    }
    return [propertyName underlineFromCamel];
}
@end


