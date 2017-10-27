//
//  YYWebViewVC.m
//  YYWebView
//
//  Created by iosdev on 2017/4/28.
//  Copyright © 2017年 QSYJ. All rights reserved.
//

#import "YYWebViewVC.h"

#define WEB_TIMEOUTINTERVAL 8.0

@interface YYWebViewVC ()<UIWebViewDelegate>{
    
}

@end

@implementation YYWebViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.frame];
    webView.delegate = self;
    [self.view addSubview:webView];
    
    if (_localName) {
        NSURL *baseURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] bundlePath]];
        NSString *path = [[NSBundle mainBundle] pathForResource:@"QS_UserAgreement" ofType:@"html"];
        NSString *html = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
        [webView loadHTMLString:html baseURL:baseURL];
    }
    else if(_loadUrl){
        NSURLRequestCachePolicy cachePolicy;
        if (_isCache) {
            cachePolicy = NSURLRequestUseProtocolCachePolicy;
        }
        else {
            cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
        }
        NSURL *url = [NSURL URLWithString:_loadUrl];
        NSMutableURLRequest *urlRequest = [[NSMutableURLRequest alloc] initWithURL:url cachePolicy:cachePolicy timeoutInterval:WEB_TIMEOUTINTERVAL];
        [webView loadRequest:urlRequest];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UIWebViewDelegate
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(nonnull NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    NSString *str = [NSString stringWithFormat:@"%@",request.URL];
    if ([str containsString:@"wvjbscheme://"]) {
        return NO;
    }
    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView{
    NSLog(@"StartLoad");
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    NSLog(@"FinishLoad");
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    NSLog(@"FailLoad:%@",error);
}

@end
