//
//  LGClassifySecondVC.m
//  有范吗?
//
//  Created by 唐磊guang on 16/1/12.
//  Copyright (c) 2016年 唐磊guang. All rights reserved.
//

#import "LGClassifySecondVC.h"
#import "LGClassifuSecondHttpTool.h"
//请求参数模型
#import "LGClassifyPostModel.h"
//数据模型
#import "LGClassifySecondModel.h"
//自定义cell
#import "LGDetailPhotoTableViewCell.h"

//
#import "LGHomePayViewController.h"
@interface LGClassifySecondVC ()<UITableViewDataSource,UITableViewDelegate>

@property (weak , nonatomic)UITableView *tableView;
@property (strong , nonatomic)NSMutableArray *modelArray;



@end

@implementation LGClassifySecondVC



- (void)viewDidLoad
{
    [super viewDidLoad];
    [self getInfo];
    [self createTableView];
}
#pragma mark- 获取数据
-(void)getInfo
{
    LGClassifyPostModel *model = [[LGClassifyPostModel alloc]init];
    
    [LGClassifuSecondHttpTool classifySecondPost:@"http://api.funwear.com/mbfun_server/index.php?m=Product&a=ProductClsCommonSearchFilter" param:model success:^(NSArray *modelArray) {
        [self.modelArray addObjectsFromArray:modelArray];
        [self.tableView reloadData];
    } wrong:^(NSError *error) {
        
    }];
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
#pragma mark- tableView delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.modelArray.count == 0) {
        return 0;
    }
    return self.modelArray.count/2-1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LGDetailPhotoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LGDetailPhotoTableViewCell"];
    if (!cell)
    {
        
        cell = [[LGDetailPhotoTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"LGDetailPhotoTableViewCell"];
        [cell setBlock:^(ClassifyClsinfo *model) {
            
            [self toPayViewControllerWithModel:model];
            
        }];
    }
    [cell relayoutWithModel1:self.modelArray[indexPath.row*2] model2:self.modelArray[indexPath.row*2+1]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

#pragma mark- join next controller
-(void)toPayViewControllerWithModel:(ClassifyClsinfo *)model
{
    LGHomePayViewController *pay = [[LGHomePayViewController alloc]init];
    pay.model = model;
    [self.navigationController pushViewController:pay animated:YES];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 190;
}
#pragma mark- getter和setter方法
-(NSMutableArray *)modelArray
{
    if (!_modelArray)
    {
        _modelArray = [NSMutableArray array];
    }
    return _modelArray;
}

@end
