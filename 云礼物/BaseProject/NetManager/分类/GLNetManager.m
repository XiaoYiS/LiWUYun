//
//  GLNetManager.m
//  BaseProject
//
//  Created by apple-jd12 on 15/11/20.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "GLNetManager.h"
#import "GLRequestPath.h"//自定义包装

#define kGender @"gender":@1
#define kGeneration @"generation":@2
#define kOrderBy @"order_by":@"now"
#define kLimit @"limit":@20
@implementation GLNetManager

+ (id)getGLPLDetailWithType:(GLPLType)type page:(NSInteger)page completionHandle:(void (^)(id, NSError *))completionHandle{
    NSDictionary *params = @{@"offset":@(page),kGender,kGeneration,kOrderBy,kLimit};//字典
    NSString *path = nil;
    switch (type) {
        case GLPLTypeLiW: {
            path = kLiWPath;
            break;
        }
        case GLPLTypeChuanT: {
            path = kChuanTPath;
            break;
        }
        case GLPLTypeMeiS: {
            path = kMeiShiPath;
            break;
        }
        case GLPLTypeMeiW: {
            path = kMeiWuPath;
            break;
        }
        case GLPLTypeXieB: {
            path = kXieBPath;
            break;
        }
        case GLPLTypeShiP: {
            path = kShiPPath;
            break;
        }
        case GLPLTypeMeiH: {
            path = kMeiHuPath;
            break;
        }
        case GLPLTypeShuM: {
            path = kShuMaPath;
            break;
        }
        case GLPLTypeShouG: {
            path = kShouGPath;
            break;
        }
        case GLPLTypeJiaJ: {
            path = kJiaJPath;
            break;
        }
        case GLPLTypeMuY: {
            path = kMuYinPath;
            break;
        }
        case GLPLTypeZhangZS: {
            path = kZhangZSPath;
            break;
        }
        case GLPLTypeDongM: {
            path = kDongMPath;
            break;
        }
        case GLPLTypeYunD: {
            path = kYunDPath;
            break;
        }
        case GLPLTypeShu: {
            path = kShuPath;
            break;
        }
        case GLPLTypeHaiT: {
            path = kHaiTPath;
            break;
        }
        default: {
            NSAssert1(NO, @"%s:type类型不正确", __func__);
            break;
        }
    }
    return [self GET:path parameters:params completionHandler:^(id responseObj, NSError *error) {
        completionHandle([GLModel objectWithKeyValues:responseObj],error);
    }];
}

+ (id)getGLDXDetailWithType:(GLDXType)type page:(NSInteger)page completionHandle:(void (^)(id, NSError *))completionHandle{
    NSDictionary *params = @{@"offset":@(page),kGender,kGeneration,kOrderBy,kLimit};//字典
    NSString *path = nil;
    switch (type) {
        case GLDXTypeNvPY: {
            path = kNvPYPath;
            break;
        }
        case GLDXTypeNanP: {
            path = kNanPPath;
            break;
        }
        case GLDXTypeXiaoPY: {
            path = kXiaoPYPath;
            break;
        }
        case GLDXTypeBaM: {
            path = kBaMPath;
            break;
        }
        case GLDXTypeJiY: {
            path =  kJiYPath;
            break;
        }
        case GLDXTypeGuiM: {
            path = kGuiMPath;
            break;
        }
        case GLDXTypeTongS: {
            path = kTongSPath;
            break;
        }
        default: {
             NSAssert1(NO, @"%s:type类型不正确", __func__);
            break;
        }
    }
    return [self GET:path parameters:params completionHandler:^(id responseObj, NSError *error) {
        completionHandle([GLModel objectWithKeyValues:responseObj],error);
    }];
}
+ (id)getGLCHDetailWithType:(GLCHType)type page:(NSInteger)page completionHandle:(void (^)(id, NSError *))completionHandle{
    NSDictionary *params = @{@"offset":@(page),kGender,kGeneration,kOrderBy,kLimit};//字典
    NSString *path = nil;
    switch (type) {
        case GLCHTypeShengR: {
            path = kShenDJPath;
            break;
        }
        case GLCHTypeQingRJ: {
            path = kQingRJPath;
            break;
        }
        case GLCHTypeJieH: {
            path = kJieHPath;
            break;
        }
        case GLCHTypeJiNR: {
            path = kJiNRPath;
            break;
        }
        case GLCHTypeQiaoQ: {
            path = kQiaoQPath;
            break;
        }
        case GLCHTypeGanX: {
            path = kGanXPath;
            break;
        }
        case GLCHTypeShenDJ: {
            path = kShenDJPath;
            break;
        }
        case GLCHTypeXinN: {
            path = kXinNPath;
            break;
        }
        default: {
             NSAssert1(NO, @"%s:type类型不正确", __func__);
            break;
        }
    }
    return [self GET:path parameters:params completionHandler:^(id responseObj, NSError *error) {
        completionHandle([GLModel objectWithKeyValues:responseObj],error);
    }];
}
+ (id)getGLFGDetailWithType:(GLFGType)type page:(NSInteger)page completionHandle:(void (^)(id, NSError *))completionHandle{
    NSDictionary *params = @{@"offset":@(page),kGender,kGeneration,kOrderBy,kLimit};//字典
    NSString *path = nil;
    switch (type) {
        case GLFGTypeChuangY: {
            path = kChuangYPath;
            break;
        }
        case GLFGTypeMengMD: {
            path = kMengMDPath;
            break;
        }
        case GLFGTypeXiaoQX: {
            path = kXiaoQXPath;
            break;
        }
        case GLFGTypeKeJF: {
            path = kKeJFPath;
            break;
        }
        case GLFGTypeQiP: {
            path = kQiPPath;
            break;
        }
        case GLFGTypeSheJG: {
            path = kSheJGPath;
            break;
        }
        default: {
             NSAssert1(NO, @"%s:type类型不正确", __func__);
            break;
        }
    }
    return [self GET:path parameters:params completionHandler:^(id responseObj, NSError *error) {
        completionHandle([GLModel objectWithKeyValues:responseObj],error);
    }];
}
@end
