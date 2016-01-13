//
//  LGToPayViewController.m
//  有范吗?
//
//  Created by 唐磊guang on 16/1/13.
//  Copyright (c) 2016年 唐磊guang. All rights reserved.
//

#import "LGToPayViewController.h"

@interface LGToPayViewController ()

@property (weak , nonatomic)UITableView *tableView;

@end

@implementation LGToPayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    [button setTitle:@"支付" forState:UIControlStateNormal];
//    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

//获取15位随机数
-(NSString *)generateTradeNO
{
    const int N =15;
    NSString * sourceString=@"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    NSMutableString *re=[[NSMutableString alloc]init];
    srand((int)time(0));
    for (int i=0; i<N; i++) {
        unsigned index=rand()%[sourceString length];
        NSString * s=[sourceString substringWithRange:NSMakeRange(index, 1)];
        [re appendString:s];
    }
    return re;
}



@end
