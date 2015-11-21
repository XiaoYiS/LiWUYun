//
//  GLModel.m
//  BaseProject
//
//  Created by apple-jd12 on 15/11/20.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "GLModel.h"

@implementation GLModel

@end
@implementation GLDataModel

+ (NSDictionary *)objectClassInArray{
    return @{@"items" : [GLDataItemsModel class]};
}

@end


@implementation GLDataPagingModel

@end


@implementation GLDataItemsModel

+ (NSString *)replacedKeyFromPropertyName121:(NSString *)propertyName{
    return [propertyName underlineFromCamel];
}

@end


