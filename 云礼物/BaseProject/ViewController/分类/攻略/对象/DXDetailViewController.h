//
//  DXDetailViewController.h
//  BaseProject
//
//  Created by apple-jd12 on 15/11/20.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DXDetailViewController : UIViewController

- (id)initWithURL:(NSURL *)url;
@property (strong,nonatomic) NSURL *url;
@end
