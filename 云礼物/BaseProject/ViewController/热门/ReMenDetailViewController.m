//
//  ReMenDetailViewController.m
//  BaseProject
//
//  Created by apple-jd12 on 15/11/19.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ReMenDetailViewController.h"
#import "ReMenDetaiHTMLViewController.h"
@interface ReMenDetailViewController ()<UIWebViewDelegate>

@property (strong,nonatomic) UIWebView *webView;
@property (assign,nonatomic) NSInteger ID;
@end

@implementation ReMenDetailViewController

- (id)initWithId:(NSInteger)Id{
    if (self = [super init]) {
        self.ID = Id;
    }
    return self;
}
- (UIWebView *)webView{
    if (!_webView) {
        _webView = [UIWebView new];
        NSString *path = [NSString stringWithFormat:@"http://www.liwushuo.com/items/%ld",self.ID];
        NSURL *url = [NSURL URLWithString:path];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        [_webView loadRequest:request];
    }
    return _webView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.webView];
    [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    [FactoryAdd addBackItemToVC:self];
    self.title = @"详情";
}

#pragma mark - UIWebViewDelegate
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    //点击web中任意一项，跳转到下一页
    //如果当前webview加载的请求 不是当前页面的
    NSString *path = [NSString stringWithFormat:@"http://www.liwushuo.com/items/%ld",self.ID];
    if (![request.URL.absoluteString isEqualToString:path]) {
        ReMenDetaiHTMLViewController *vc=[[ReMenDetaiHTMLViewController alloc] initWithRequest:request];
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
