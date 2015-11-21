//
//  LiWuNetManager.h
//  BaseProject
//
//  Created by apple-jd12 on 15/11/21.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "LiWuModel.h"

@interface LiWuNetManager : BaseNetManager

+ (id)getLiWuListWithPage:(NSInteger)page kCompletionHandle;
@end
