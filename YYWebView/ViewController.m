//
//  ViewController.m
//  YYWebView
//
//  Created by iosdev on 2017/4/28.
//  Copyright © 2017年 QSYJ. All rights reserved.
//

#import "ViewController.h"
#import "YYWebViewVC.h"
#import "WKWebViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate> {
    NSArray *titleList;
    NSArray *dataList;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    titleList = @[@"加载H5",@"交互",@"JWT",@"WKWebView"];
    dataList = @[@[@"本地H5",@"网络H5+缓存1",@"网络H5+缓存2",@"网络H5+加载动画"],@[@"回调",@"调Script"],@[@"JWT"],@[@"WKWebView"]];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.frame];
    tableView.dataSource = self;
    tableView.delegate = self;
    [self.view addSubview:tableView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return titleList.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *ones = dataList[section];
    return ones.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *strCell = @"strCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:strCell];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:strCell];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    NSInteger sec = indexPath.section;
    NSInteger row = indexPath.row;
    cell.textLabel.text = dataList[sec][row];
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return titleList[section];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60.0;
}


#pragma UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger sec = indexPath.section;
    NSInteger row = indexPath.row;
    switch (sec) {
        case 0: {//加载
            [self loadWebViewWithIndex:row];
        }
            break;
        case 1: {//交互
            [self scriptWebViewWithIndex:row];
        }
            break;
        case 2: {//JWT
            [self jwtWebViewWithIndex:row];
        }
            break;
        case 3: {//WKWebView
            [self wkWebViewWithIndex:row];
        }
            break;
        default:
            break;
    }
}

//加载
- (void)loadWebViewWithIndex:(NSInteger)index {
    YYWebViewVC *vc = [[YYWebViewVC alloc] init];
    switch (index) {
        case 0: {
            vc.localName = @"QS_UserAgreement";
        }
            break;
        case 1: {
            vc.loadUrl = @"http://baike.baidu.com/link?url=GkkYh-wmSHkJqrkpFTahfSnphxRgptF3FgHJ4x23-_MzHLafy8sUs7TIkQOKQNhHB3fRT9kr3NgxekF3Qf4WYKcc04wy9ECn4aUWGvEO8zpp5tbLc40v-5e6Wo35L40i";//@"http://static.chinasunhealth.com/sp/#/jy/softagreement";
            vc.isCache = YES;
        }
            break;
            
        case 2: {
            vc.loadUrl = @"http://192.168.1.114/community/get/1/320";//@"http://static.chinasunhealth.com/m/geneDetect/";
            vc.isCache = YES;
        }
            break;
        case 3: {
            
        }
            break;
        default:
            break;
    }
    
    
    [self.navigationController pushViewController:vc animated:YES];
}

//交互
- (void)scriptWebViewWithIndex:(NSInteger)index {
    
}

//JWT
- (void)jwtWebViewWithIndex:(NSInteger)index {
    
}

//WKWebView
- (void)wkWebViewWithIndex:(NSInteger)index {
    WKWebViewController *vc = [[WKWebViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
