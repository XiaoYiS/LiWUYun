//
//  ListDetailNetManager.h
//  BaseProject
//
//  Created by apple-jd12 on 15/11/19.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "ListDetailModel.h"
@interface ListDetailNetManager : BaseNetManager

+ (id)getListDeatilWithId:(NSInteger)ID page:(NSInteger)page kCompletionHandle;
@end
