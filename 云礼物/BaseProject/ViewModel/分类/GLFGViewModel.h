//
//  GLFGViewModel.h
//  BaseProject
//
//  Created by apple-jd12 on 15/11/20.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "GLNetManager.h"
@interface GLFGViewModel : BaseViewModel
@property (assign,nonatomic) GLFGType fgType;
- (instancetype)initWithfgType:(GLFGType)type;
@property (assign,nonatomic) NSInteger rowNumber;
@property (assign,nonatomic) NSInteger page;
- (NSURL *)iconURLForRow:(NSInteger)row;
- (NSString *)titleForRow:(NSInteger)row;
- (NSURL *)URLForRow:(NSInteger)row;
- (NSString *)urlForRow:(NSInteger)row;
- (NSString *)likesCountForRow:(NSInteger)row;
@end
