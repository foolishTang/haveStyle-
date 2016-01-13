//
//  LGTabbViewController.m
//  有范吗?
//
//  Created by 唐磊guang on 15/12/30.
//  Copyright (c) 2015年 唐磊guang. All rights reserved.
//

#import "LGTabbViewController.h"
#import "LGHomeTableViewController.h"
#import "LGClassifyTableViewController.h"
#import "LGCommunityTableViewController.h"
#import "LGInfoTableViewController.h"
#import "LGMyTableViewController.h"
#import "LGNavigationController.h"
#import "UIImage+Content.h"
#import "UIView+Extension.h"

@interface LGTabbViewController ()

@end

@implementation LGTabbViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blackColor];
    [self addSubViewControllers];
    //self.tabBar.backgroundImage = [UIImage resizedImage:@"tabbg"];
    
}

-(void)addSubViewControllers
{
    //首页
    LGHomeTableViewController *home = [[LGHomeTableViewController alloc]init];
    [self addSubViewWithTitle:@"首页" andNomal:@"home_normal" andSelected:@"home_pressed" andViewContoller:home];
    
    //分类
    LGClassifyTableViewController *classify = [[LGClassifyTableViewController alloc]init];
    [self addSubViewWithTitle:@"分类" andNomal:@"browse_normal" andSelected:@"browse_pressed" andViewContoller:classify];
    //社区
    LGCommunityTableViewController *community = [[LGCommunityTableViewController alloc]init];
    [self addSubViewWithTitle:@"社区" andNomal:@"shequ" andSelected:@"shequ" andViewContoller:community];
    //消息
    LGInfoTableViewController *info = [[LGInfoTableViewController alloc]initWithNibName:@"LGInfoTableViewController" bundle:nil];
    [self addSubViewWithTitle:@"消息" andNomal:@"chat_normal" andSelected:@"chat_pressed" andViewContoller:info];
    //我的
    LGMyTableViewController *mine = [[LGMyTableViewController alloc]init];
    [self addSubViewWithTitle:@"消息" andNomal:@"me_normal" andSelected:@"me_pressed" andViewContoller:mine];
}

-(void)addSubViewWithTitle:(NSString *)title andNomal:(NSString *)nomalName andSelected:(NSString *)selectedName andViewContoller:(UIViewController *)controller
{
    LGNavigationController *nav = [[LGNavigationController alloc]initWithRootViewController:controller];
    
    UIImage *selected = [UIImage imageNamed:selectedName];
    UIImage *selectedImage = [selected imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UINavigationBar *bar = controller.navigationController.navigationBar;
    [bar setBackgroundImage:[UIImage imageNamed:@"common_navi_mixblack"] forBarMetrics:UIBarMetricsDefault];
    
    UITabBarItem *item = [[UITabBarItem alloc]initWithTitle:title image:[UIImage imageNamed:nomalName]  selectedImage:selectedImage];
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    dic[UITextAttributeTextColor] = [UIColor lightGrayColor];
    [item setTitleTextAttributes:dic forState:UIControlStateNormal];
    [item setTitleTextAttributes:dic forState:UIControlStateSelected];
    controller.tabBarItem = item;
    [self addChildViewController:nav];
}



@end
