//
//  WKWebViewController.m
//  YYWebView
//
//  Created by iosdev on 2017/10/27.
//  Copyright © 2017年 QSYJ. All rights reserved.
//

#import "WKWebViewController.h"
#import <WebKit/WKScriptMessageHandler.h>
#import <WebKit/WebKit.h>

@interface WKWebViewController ()

@end

@implementation WKWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    WKWebView *kwebView = [[WKWebView alloc] initWithFrame:self.view.bounds];
    [kwebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://api.kf.chinasunhospital.com/web/mall/index"]]];
    [self.view addSubview:kwebView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
