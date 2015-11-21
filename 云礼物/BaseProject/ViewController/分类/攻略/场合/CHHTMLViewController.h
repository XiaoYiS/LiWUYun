//
//  CHHTMLViewController.h
//  BaseProject
//
//  Created by apple-jd12 on 15/11/20.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CHHTMLViewController : UIViewController
- (id)initWithRequest:(NSURLRequest *)request;
@property(nonatomic,strong) NSURLRequest *request;
@end
