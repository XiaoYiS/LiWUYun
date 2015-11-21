//
//  ListDetailViewModel.h
//  BaseProject
//
//  Created by apple-jd12 on 15/11/19.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "CategoryListNetManager.h"
@interface ListDetailViewModel : BaseViewModel


@property (assign,nonatomic) NSInteger page;
@property (assign,nonatomic) NSInteger rowNumber;

- (NSURL *)iconURLForRow:(NSInteger)row;
- (NSString *)titleForRow:(NSInteger)row;
- (NSString *)subTitleForRow:(NSInteger)row;
- (NSInteger)IdForRow:(NSInteger)row;

@end
