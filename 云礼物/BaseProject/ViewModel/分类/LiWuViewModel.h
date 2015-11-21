//
//  LiWuViewModel.h
//  BaseProject
//
//  Created by apple-jd12 on 15/11/21.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "LiWuNetManager.h"
@interface LiWuViewModel : BaseViewModel

@property (assign,nonatomic) NSInteger page;
@property (assign,nonatomic) NSInteger rowNumber;

- (NSURL *)picURLForRow:(NSInteger)row;
- (NSString *)titleForRow:(NSInteger)row;
- (NSString *)hPriceForRow:(NSInteger)row;
- (NSString *)addTimeForRow:(NSInteger)row;
@end
