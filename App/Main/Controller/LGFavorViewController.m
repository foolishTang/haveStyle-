//
//  LGFavorViewController.m
//  有范吗?
//
//  Created by 唐磊guang on 16/1/9.
//  Copyright (c) 2016年 唐磊guang. All rights reserved.
//

#import "LGFavorViewController.h"
#import "LGFavoTableViewCell.h"
#import "LGHomeDataTool.h"

#import "LGClassifySecondModel.h"
#import "LGHomePayViewController.h"

#import "LGHomePayModel.h"

#import "LGToBuyToolBar.h"

#import "LGToPayViewController.h"
@interface LGFavorViewController ()<UITableViewDataSource,UITableViewDelegate,LGToBuyToolBarDelegate>

@property (weak , nonatomic)UITableView *tableView;
@property (strong , nonatomic)LGHomeDataTool *tool;
@property (strong , nonatomic)NSArray *favoArr;
@property (weak , nonatomic)LGToBuyToolBar *toolBar;
@property (assign , nonatomic)BOOL change;
@end

@implementation LGFavorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.translucent = YES;
    // Do any additional setup after loading the view.
    [self createTableView];
    [self getInfoFromDatabase];
    [self addToBuyToolBuy];
}
#pragma mark- 创建UI
-(void)createTableView
{
    UITableView *tableView = [[UITableView alloc]init];
    tableView.frame = self.view.bounds;
    tableView.delegate = self;
    tableView.dataSource = self;
    self.tableView = tableView;
    [self.view addSubview:tableView];
}
-(void)addToBuyToolBuy
{
    LGToBuyToolBar *toolBar = [LGToBuyToolBar toBayToolBar];
    toolBar.delegate = self;
    [self.view addSubview:toolBar];
    self.toolBar  = toolBar;
}
#pragma mark- 获取数据
-(void)getInfoFromDatabase
{
    LGHomeDataTool *tool = [LGHomeDataTool shareInstance];
    self.favoArr = [tool selectAllModel];
    [self.tableView reloadData];
}
#pragma mark- tableView delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.favoArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LGFavoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LGFavoTableViewCell"];
    if (!cell)
    {
        cell = [[LGFavoTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"LGFavoTableViewCell"];
    }
    cell.model = self.favoArr[indexPath.row];
    cell.LGSelect = self.change;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    LGHomePayViewController *pay = [[LGHomePayViewController alloc]init];
    Clsinfo *info = self.favoArr[indexPath.row];
    ClassifyClsinfo *model = [[ClassifyClsinfo alloc]init];
    model.code = info.code;
    pay.model = model;
    [self.navigationController pushViewController:pay animated:YES];
    
}
#pragma mark- LGToBuyToolBarDelegate
-(void)toBayViewController
{
    LGToPayViewController *toPay = [[LGToPayViewController alloc]initWithNibName:@"LGToPayViewController" bundle:nil];
    [self.navigationController pushViewController:toPay animated:YES];
}
-(void)calculateAllMoney:(BOOL)allOrZero
{
    if (allOrZero) {
        self.change = YES;
        [self.tableView reloadData];
        NSInteger num = 0;
        for (Clsinfo *model in self.favoArr) {
            NSString *numstr = [model.sale_price substringFromIndex:1];
            num = num+[numstr intValue]*model.number;
        }
        self.toolBar.allMoney = num;
    }
    else{
        self.change = NO;
        [self.tableView reloadData];
    }
    
}
@end
