//
//  GLDXViewModel.h
//  BaseProject
//
//  Created by apple-jd12 on 15/11/20.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "GLNetManager.h"
@interface GLDXViewModel : BaseViewModel
@property (assign,nonatomic) GLDXType dxtype;
- (instancetype)initWithdxType:(GLDXType)type;
@property (assign,nonatomic) NSInteger rowNumber;
@property (assign,nonatomic) NSInteger page;
- (NSURL *)iconURLForRow:(NSInteger)row;
- (NSString *)titleForRow:(NSInteger)row;
- (NSURL *)URLForRow:(NSInteger)row;
- (NSString *)urlForRow:(NSInteger)row;
@end
