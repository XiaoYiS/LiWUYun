//
//  WelcomeViewController.m
//  BaseProject
//
//  Created by apple-jd12 on 15/11/19.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "WelcomeViewController.h"
#import "AppDelegate.h"
#define IMAGECOUNT 4
@interface WelcomeViewController ()<UIScrollViewDelegate>


@property (strong,nonatomic)UIPageControl *pageControl;

@end

@implementation WelcomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    //创建滚动视图
    UIScrollView *scrollView = [[UIScrollView alloc]init];
    scrollView.delegate = self;
    scrollView.frame = self.view.bounds;
    [self.view addSubview:scrollView];
    scrollView.pagingEnabled = YES;
    scrollView.bounces = NO;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    
    scrollView.contentSize = CGSizeMake(IMAGECOUNT *scrollView.frame.size.width, 0);
    for(NSInteger i=0;i<IMAGECOUNT;i++){
        UIImageView *imageView = [[UIImageView alloc]init];
        CGSize size = [[UIScreen mainScreen]currentMode].size;
        BOOL isIp6 = CGSizeEqualToSize(size, CGSizeMake(750, 1334));
        NSString *imageName = nil;
        if (isIp6) {
            imageName = [NSString stringWithFormat:@"walkthrough_%ld",i+1];
        }else{
            imageName = [NSString stringWithFormat:@"walkthrough_%ld",i+1];
        }
        imageView.image = [UIImage imageNamed:imageName];
        imageView.frame = CGRectMake(i * scrollView.frame.size.width, 0, scrollView.frame.size.width, scrollView.frame.size.height);
        [scrollView addSubview:imageView];
        if (i == IMAGECOUNT - 1) {
            //创建进入按钮
            [self setEnterButton:imageView];
        }
    }
    //UIPageControl
    UIPageControl *pageControl = [[UIPageControl alloc]init];
    self.pageControl = pageControl;
    pageControl.numberOfPages = IMAGECOUNT;
    pageControl.frame = CGRectMake(0, self.view.bounds.size.height - 60, self.view.bounds.size.width, 40);
    
    pageControl.pageIndicatorTintColor = [UIColor redColor];
    pageControl.currentPageIndicatorTintColor = [UIColor greenColor];
    pageControl.userInteractionEnabled = NO;
    [self.view addSubview:pageControl];
    
}
#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGPoint offSet = scrollView.contentOffset;
    CGFloat i = offSet.x / scrollView.frame.size.width;
    self.pageControl.currentPage = round(i);
}

- (void)setEnterButton:(UIImageView *)imageView{
    imageView.userInteractionEnabled = YES;
    UIButton *button = [[UIButton alloc]init];
    button.frame = CGRectMake((imageView.frame.size.width - 180)*0.5, imageView.frame.size.height*0.8, 180, 40);
    //    button.backgroundColor = [UIColor redColor];//系统取色
    [button setBackgroundImage:[UIImage imageNamed:@"btn_begin"] forState:(UIControlStateNormal)];
    //    [button setTitle:@"立即体验" forState:(UIControlStateNormal)];
    //    button.titleLabel.font = [UIFont boldSystemFontOfSize:17];
    [button addTarget:self action:@selector(enterApp) forControlEvents:(UIControlEventTouchUpInside)];
    [imageView addSubview:button];
    
}

- (void)enterApp{
    NSLog(@"进入应用。。。");
    
    UIWindow *win = [UIApplication sharedApplication].keyWindow;
    AppDelegate *app = [AppDelegate new];
    win.rootViewController = [app sideMenu];
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
