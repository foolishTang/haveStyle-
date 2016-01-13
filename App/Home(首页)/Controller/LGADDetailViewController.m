//
//  LGADDetailViewController.m
//  有范吗?
//
//  Created by 唐磊guang on 16/1/3.
//  Copyright (c) 2016年 唐磊guang. All rights reserved.
//

#import "LGADDetailViewController.h"

@interface LGADDetailViewController ()

{
    UIWebView *_webView;
}

@end

@implementation LGADDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSURL *url = [NSURL URLWithString:self.urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    UIWebView *webView = [[UIWebView alloc]initWithFrame:self.view.bounds];
    [webView loadRequest:request];
    [self.view addSubview:webView];
    _webView = webView;
}


-(void)viewDidDisappear:(BOOL)animated
{
    LGLog(@"viewDidDisappear");
    [super viewDidDisappear:animated];
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
