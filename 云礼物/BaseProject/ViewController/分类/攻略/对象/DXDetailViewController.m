//
//  DXDetailViewController.m
//  BaseProject
//
//  Created by apple-jd12 on 15/11/20.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "DXDetailViewController.h"
#import "CategoriesViewController.h"
#import "DXHTMLViewController.h"
@interface DXDetailViewController ()<UIWebViewDelegate>
@property (strong,nonatomic) UIWebView *webView;
@property (strong,nonatomic) CategoriesViewController *vc;
@end

@implementation DXDetailViewController
- (CategoriesViewController *)vc{
    if (!_vc) {
        _vc = [CategoriesViewController standardCategoryContent];
    }
    return _vc;
}
- (UIWebView *)webView{
    if (!_webView) {
        _webView = [UIWebView new];
//        NSURL *url = [NSURL URLWithString: self.path];
        NSURLRequest *request = [NSURLRequest requestWithURL:self.url];
        [_webView loadRequest:request];
    }
    return _webView;
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.vc.customTabBar.hidden = YES;
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.vc.customTabBar.hidden = NO;
    self.tabBarController.tabBar.hidden = YES;
}
- (id)initWithURL:(NSURL *)url{
    if (self = [super init]) {
        self.url = url;
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"详情";
    // Do any additional setup after loading the view.
    [self.view addSubview:self.webView];
    [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    [FactoryAdd addBackItemToVC:self];
}
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    //点击web中任意一项，跳转到下一页
    //如果当前webview加载的请求 不是当前页面的
    if (![request.URL.absoluteString isEqualToString:self.url.absoluteString]) {
        DXHTMLViewController *vc=[[DXHTMLViewController alloc] initWithRequest:request];
        [self.navigationController pushViewController:vc animated:YES];
        return NO;
    }
    return YES;
}
- (void)webViewDidStartLoad:(UIWebView *)webView{
    [self showProgress]; //旋转提示
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [self hideProgress];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    [self hideProgress];
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
