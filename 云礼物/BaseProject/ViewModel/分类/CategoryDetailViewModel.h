//
//  CategoryDetailViewModel.h
//  BaseProject
//
//  Created by apple-jd12 on 15/11/19.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "ListDetailNetManager.h"
@interface CategoryDetailViewModel : BaseViewModel

@property (assign,nonatomic) NSInteger page;
@property (assign,nonatomic) NSInteger ID;
- (id)initWithID:(NSInteger)ID;
@property (assign,nonatomic) NSInteger rowNumber;

- (NSURL *)iconURLForRow:(NSInteger)row;
- (NSString *)titleForRow:(NSInteger)row;
- (NSInteger )IDForRow:(NSInteger)row;
- (NSString *)likesCountForRow:(NSInteger)row;
- (NSURL *)URLForRow:(NSInteger)row;
@end
