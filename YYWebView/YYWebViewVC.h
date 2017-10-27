//
//  YYWebViewVC.h
//  YYWebView
//
//  Created by iosdev on 2017/4/28.
//  Copyright © 2017年 QSYJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YYWebViewVC : UIViewController

@property(nonatomic,assign)BOOL isCache;
@property(nonatomic,strong)NSString      *localName;
@property(nonatomic,strong)NSString      *loadUrl;

@end
