//
//  LGHomeTableViewController.m
//  有范吗?
//
//  Created by 唐磊guang on 15/12/30.
//  Copyright (c) 2015年 唐磊guang. All rights reserved.
//

#import "LGHomeTableViewController.h"
#import "LGHaveStyleTool.h"
#import "LGHomeWebViewController.h"
#import "LGADDetailViewController.h"
#import "LGHaveStyleTool.h"
#import "LGOtherDetailViewController.h"
//数据模型头文件
#import "TowHomeADModel.h"
#import "TowHomeHSBrandModel.h"
#import "TowHomeIntervalModel.h"
#import "TowHomeNewVip.h"
#import "testModel.h"
//自定义cell
#import "MoreStructADCell.h"
#import "MoreStructBrandCell.h"
#import "MoreStructNewVipCell.h"
#import "MoreStructNewClothCell.h"
#import "MoreStructAllClothCell.h"

#import "MJRefresh.h"
@interface LGHomeTableViewController ()<MJRefreshBaseViewDelegate>


//@property (nonatomic , strong)NSArray *infoArr;

@property (nonatomic , strong)NSArray *allModelArr;
@property (nonatomic , strong)NSArray *intervalModelArr;

@property (nonatomic , strong)MJRefreshHeaderView *header;

@end

@implementation LGHomeTableViewController

#pragma mark- 数据管理中心
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavItem];
    [self getRefreshControl];
    
    self.header = [MJRefreshHeaderView header];
    self.header.delegate = self;
    self.header.scrollView = self.tableView;
//    UIButton *button = [[UIButton alloc]init];
//    button.adjustsImageWhenHighlighted = NO;
//    [button addTarget:self action:@selector(toFavorViewController) forControlEvents:UIControlEventTouchUpInside];
//        button.frame = CGRectMake(0, 0, 44, 44);
//    [button setTitle:@"lala" forState:UIControlStateNormal];
//    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    UIBarButtonItem *barButton = [[UIBarButtonItem alloc]initWithCustomView:button];
//    
//    self.navigationItem.rightBarButtonItem = barButton;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    UIButton *button = [[UIButton alloc]init];
//    button.frame = CGRectMake(0, 0, 44, 44);
//    button.adjustsImageWhenHighlighted = NO;
//    [button addTarget:self action:@selector(toFavorViewController) forControlEvents:UIControlEventTouchUpInside];
//    [button setTitle:@"lala" forState:UIControlStateNormal];
//    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    UIBarButtonItem *barButton = [[UIBarButtonItem alloc]initWithCustomView:button];
//    
//    self.navigationItem.rightBarButtonItem = barButton;
}

-(void)press
{
    LGHomeWebViewController *web = [[LGHomeWebViewController alloc]init];
    [self.navigationController pushViewController:web animated:YES];
}
-(void)setNavItem
{
   
}
-(void)getRefreshControl
{
    UIRefreshControl *refresh = [[UIRefreshControl alloc]init];
    //[refresh addTarget:self action:@selector(getNewInfo:) forControlEvents:UIControlEventValueChanged];
    [refresh beginRefreshing];
    [self getNewInfo];
}
-(void)getNewInfo
{
    [LGHaveStyleTool haveStyleGet:LGHomeUrl success:^(NSArray *allModelArray) {
        [self.header endRefreshing];
        self.allModelArr = allModelArray;
        [self.tableView reloadData];
    } wrong:^(NSError *error) {
        NSLog(@"%@",error);
    }];

}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    
    return self.allModelArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
        {
            MoreStructADCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MoreStructADCell"];
            if (!cell)
            {
                cell = [[MoreStructADCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MoreStructADCell"];
            }
            [cell setADBlock:^(NSString *urlString)
            {
                [self toDetailWithUrlString:urlString];
            }];
            cell.model = self.allModelArr[indexPath.row];
            return cell;
        }
            break;
        case 1:
        {
            MoreStructBrandCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MoreStructBrandCell"];
            if (!cell)
            {
                cell = [[MoreStructBrandCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MoreStructBrandCell"];
            }
            [cell setBlock:^(NSString *urlString) {
                [self toDetailWithUrlString:urlString];
            }];
            cell.model = self.allModelArr[indexPath.row];
            return cell;
        }
            break;
        case 2:
        {
            MoreStructNewVipCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MoreStructNewVipCell"];
            if (!cell)
            {
                cell = [[MoreStructNewVipCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MoreStructNewVipCell"];
            }
            cell.model = self.allModelArr[indexPath.row];
            
            return cell;
        }
            break;
        case 3:
        {
            MoreStructNewClothCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MoreStructNewClothCell"];
            if (!cell)
            {
                cell = [[MoreStructNewClothCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MoreStructNewClothCell"];
            }
            [cell setBlock:^(NSString *urlString) {
               [self toDetailWithUrlString:urlString];
            }];
            cell.model = self.allModelArr[indexPath.row];
            
            return cell;
        }
            break;
        default:
            break;
    }
        MoreStructAllClothCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MoreStructAllClothCell"];
        if (!cell)
        {
            cell = [[MoreStructAllClothCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MoreStructAllClothCell"];
        }
        [cell setBlock:^(NSString *urlString) {
            [self toDetailWithUrlString:urlString];
        }];
        cell.model = self.allModelArr[indexPath.row];
        
        return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
        {
            TowHomeADModel *ADModel = self.allModelArr[indexPath.row];
            ADConfig *config = ADModel.config[0];
            return config.fitH;
        }
            break;
        case 1:
        {
            testModel *brand = self.allModelArr[indexPath.row];

            return brand.fitH;
        }
            break;
        case 2:
        {
            TowHomeNewVip *newVip = self.allModelArr[indexPath.row];
            NewConfig *config = newVip.config[0];
            return config.fitH;
        }
            break;
        case 3:
        {
            testModel *newCloth = self.allModelArr[indexPath.row];
//            ImageConfig *config = newCloth.config[0];
            return newCloth.fitH;
        }
            break;
            
        default:
            break;
    }
    testModel *allClith = self.allModelArr[indexPath.row];
//    ImageConfig *config = allClith.config[0];
    return allClith.fitH;
}



#pragma mark- 进入详情界面
-(void)toDetailWithUrlString:(NSString *)urlSting
{
    LGADDetailViewController *detail = [[LGADDetailViewController alloc]init];
    detail.urlString = [urlSting copy];
    [self.navigationController pushViewController:detail animated:YES];
}

#pragma mark- 自定义cell代理方法
-(void)toGoDetail:(LGOtherModel *)model
{
    LGOtherDetailViewController *other = [[LGOtherDetailViewController alloc]init];
    other.otherModel = model;
    [self.navigationController pushViewController:other animated:YES];
}

-(void)refreshViewBeginRefreshing:(MJRefreshBaseView *)refreshView{
    [self getNewInfo];
}

@end
