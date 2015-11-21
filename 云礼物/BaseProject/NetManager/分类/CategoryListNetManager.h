//
//  CategoryListNetManager.h
//  BaseProject
//
//  Created by apple-jd12 on 15/11/19.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "CategoryListModel.h"

@interface CategoryListNetManager : BaseNetManager

+ (id)getCategoryListWithPage:(NSInteger)page kCompletionHandle;
@end
