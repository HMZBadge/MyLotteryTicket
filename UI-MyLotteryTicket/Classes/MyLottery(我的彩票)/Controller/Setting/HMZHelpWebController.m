//
//  HMZHelpWebController.m
//  UI-MyLotteryTicket
//
//  Created by 赵志丹 on 15/11/6.
//  Copyright © 2015年 赵志丹. All rights reserved.
//

#import "HMZHelpWebController.h"
#import "HMZHelp.h"

@interface HMZHelpWebController () <UIWebViewDelegate>

@end

@implementation HMZHelpWebController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    self.navigationItem.leftBarButtonItem = leftItem;
    // 获取webView
    UIWebView *webView = (UIWebView *)self.view;
    //设置代理
    webView.delegate = self;
    // 创建url
    NSURL *urlOnline = [NSURL URLWithString:@"http://www.baidu.com"];
    //创建本地url
    NSURL *url = [[NSBundle mainBundle] URLForResource:self.help.html withExtension:nil];
    //吧URL包装成请求
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    //加载请求
    [webView loadRequest:req];
}
// 网页加载完成的方法
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    //代码
    NSString *jsCode = [NSString stringWithFormat:@"document.location.href='#%@'",self.help.ids];
    //NSString *jsCode = @"postStr();";
    //执行代码, 且可以获取js代码执行的 返回结果,
    NSString *log = [webView stringByEvaluatingJavaScriptFromString:jsCode];
}

// 控制器加载view
- (void)loadView{
    self.view = [[UIWebView alloc] init];
}

- (void)back{
    [self dismissViewControllerAnimated:YES completion:nil];
}




@end
