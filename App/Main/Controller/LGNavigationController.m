//
//  LGNavigationController.m
//  有范吗?
//
//  Created by 唐磊guang on 15/12/30.
//  Copyright (c) 2015年 唐磊guang. All rights reserved.
//

#import "LGNavigationController.h"
#import "LGFavorViewController.h"
#import "LGInfoTableViewController.h"
#import "LGHomeDataTool.h"
@interface LGNavigationController ()

@property (strong , nonatomic)UILabel *label;

@end

@implementation LGNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count>=1)
    {
        if (![viewController isKindOfClass:[LGInfoTableViewController class]]) {
        viewController.hidesBottomBarWhenPushed = YES;
            
        }
    }
    [super pushViewController:viewController animated:animated];
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 44, 44)];
//    view.backgroundColor = [UIColor redColor];
    
    LGHomeDataTool *data = [LGHomeDataTool shareInstance];
    
    
        UIButton *button = [[UIButton alloc]init];
        
        button.adjustsImageWhenHighlighted = NO;
        [button addTarget:self action:@selector(toFavorViewController) forControlEvents:UIControlEventTouchUpInside];
        button.frame = CGRectMake(0, 0, 44, 44);
        [button setImage:[UIImage imageNamed:@"heart88line"] forState:UIControlStateNormal];
    [view addSubview:button];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(7, 22, 15, 15)];
    self.label = label;
    label.backgroundColor = [UIColor redColor];
    label.layer.cornerRadius = 7.5;
    if ([data countOfFavorite] ==0) {
        label.hidden = YES;
        label.text = @"";
    }else
    {
        label.hidden = NO;
        label.text = [NSString stringWithFormat:@"%d",(int)data.countOfFavorite];
    }
    label.clipsToBounds = YES;
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont systemFontOfSize:9];
    label.textAlignment = NSTextAlignmentCenter;

    [view addSubview:label];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        UIBarButtonItem *barButton = [[UIBarButtonItem alloc]initWithCustomView:view];
        
        viewController.navigationItem.rightBarButtonItem = barButton;
}

-(UIViewController *)popViewControllerAnimated:(BOOL)animated
{
    
    LGHomeDataTool *data = [LGHomeDataTool shareInstance];
    self.label.text = [NSString stringWithFormat:@"%d",(int)data.countOfFavorite];
    return [super popViewControllerAnimated:animated];
    
}

-(void)toFavorViewController
{
    LGFavorViewController *favor =[[LGFavorViewController alloc]init];
    [self pushViewController:favor animated:YES];
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
