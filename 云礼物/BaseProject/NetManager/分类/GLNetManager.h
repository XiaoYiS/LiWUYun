//
//  GLNetManager.h
//  BaseProject
//
//  Created by apple-jd12 on 15/11/20.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "GLModel.h"


typedef NS_ENUM(NSUInteger, GLPLType) {
    GLPLTypeLiW,
    GLPLTypeChuanT,
    GLPLTypeMeiS,
    GLPLTypeMeiW,
    GLPLTypeXieB,
    GLPLTypeShiP,
    GLPLTypeMeiH,
    GLPLTypeShuM,
    GLPLTypeShouG,
    GLPLTypeJiaJ,
    GLPLTypeMuY,
    GLPLTypeZhangZS,
    GLPLTypeDongM,
    GLPLTypeYunD,
    GLPLTypeShu,
    GLPLTypeHaiT,
};
typedef NS_ENUM(NSUInteger, GLDXType) {
    GLDXTypeNvPY,
    GLDXTypeNanP,
    GLDXTypeXiaoPY,
    GLDXTypeBaM,
    GLDXTypeJiY,
    GLDXTypeGuiM,
    GLDXTypeTongS,
};
typedef NS_ENUM(NSUInteger, GLCHType) {
    GLCHTypeShengR,
    GLCHTypeQingRJ,
    GLCHTypeJieH,
    GLCHTypeJiNR,
    GLCHTypeQiaoQ,
    GLCHTypeGanX,
    GLCHTypeShenDJ,
    GLCHTypeXinN,
};
typedef NS_ENUM(NSUInteger, GLFGType) {
    GLFGTypeChuangY,
    GLFGTypeMengMD,
    GLFGTypeXiaoQX,
    GLFGTypeKeJF,
    GLFGTypeQiP,
    GLFGTypeSheJG,
};
@interface GLNetManager : BaseNetManager


+ (id)getGLPLDetailWithType:(GLPLType)type page:(NSInteger)page kCompletionHandle;
+ (id)getGLDXDetailWithType:(GLDXType)type page:(NSInteger)page kCompletionHandle;
+ (id)getGLCHDetailWithType:(GLCHType)type page:(NSInteger)page kCompletionHandle;
+ (id)getGLFGDetailWithType:(GLFGType)type page:(NSInteger)page kCompletionHandle;

@end
