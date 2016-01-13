//
//  LGOtherDetailViewController.m
//  有范吗?
//
//  Created by 唐磊guang on 16/1/3.
//  Copyright (c) 2016年 唐磊guang. All rights reserved.
//

#import "LGOtherDetailViewController.h"
#import "LGHomeDetalHttpTool.h"
#import "LGOtherModel.h"
#import "LGHomeDetailTopFrame.h"
#import "LGHomeDetailTopTableViewCell.h"
#import "LGDetailPhotoTableViewCell.h"
#import "MJRefresh.h"
#import "LGHomePayViewController.h"
@interface LGOtherDetailViewController ()<MJRefreshBaseViewDelegate>

@property (strong , nonatomic)LGHomeDetailTopFrame *topFrame;

@property (strong , nonatomic)NSMutableArray *dataArr;

@property (copy , nonatomic)NSString *currentTid;

@property (assign , nonatomic)int page;

@property (strong , nonatomic)MJRefreshFooterView *footView;
@property (strong , nonatomic)MJRefreshHeaderView *headerView;

@end

@implementation LGOtherDetailViewController

-(LGHomeDetailTopFrame *)topFrame
{
    if (!_topFrame)
    {
        _topFrame = [[LGHomeDetailTopFrame alloc]init];
    }
    return _topFrame;
}
-(NSMutableArray *)dataArr
{
    if (!_dataArr)
    {
        _dataArr = [[NSMutableArray alloc]init];
    }
    return _dataArr;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self getInfo];
    [self refreshInfoWithTid:self.otherModel.temp_id];
    _footView = [[MJRefreshFooterView alloc]initWithScrollView:self.tableView];
    _headerView = [[MJRefreshHeaderView alloc]initWithScrollView:self.tableView];
    _footView.delegate = self;
    _headerView.delegate = self;
}
#pragma mark- 数据集合
//获取数据
-(void)getInfo
{
    NSString *urlStr = [NSString stringWithFormat:LGBaseUrlUp,self.otherModel.fixed_id,LGToken];
    
    
    
    [LGHomeDetalHttpTool homeDetailGet:urlStr success:^(LGHomeDetailTopModel *model) {
        
        self.topFrame.topModel = model;
        [self.tableView reloadData];
        
    } wrong:^(NSError *error) {
        
    }];
}

-(void)refreshInfoWithTid:(int)tid
{
    
    if (tid!=self.currentTid.intValue) {
        [self.dataArr removeAllObjects];
    }
    
    
    self.currentTid = [NSString stringWithFormat:@"%d",tid];
    NSString *urlStr = [NSString stringWithFormat:LGDetailOtherUrl,self.page,tid];
    
    [LGHomeDetalHttpTool homeDetailOtherGet:urlStr success:^(NSArray *modelArray)
    {
        if (self.page==0)
        {
            [self.dataArr removeAllObjects];
        }
        [self.dataArr addObjectsFromArray:modelArray];
        [self.tableView reloadData];
        [_footView endRefreshing];
        [_headerView endRefreshing];
    } wrong:^(NSError *error) {
        LGLog(@"%@",error);
        [_footView endRefreshing];
        [_headerView endRefreshing];
    }];
    
}

#pragma mark- tableView代理方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
       return 1;
    }else{
        return self.dataArr.count/2;
    }
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    if (indexPath.section == 0) {
        LGHomeDetailTopTableViewCell *topCell = [tableView dequeueReusableCellWithIdentifier:@"LGHomeDetailTopTableViewCell"];
        if (!topCell)
        {
            
            topCell = [[LGHomeDetailTopTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"LGHomeDetailTopTableViewCell"];
            [topCell setBlock:^(int tid) {
                [self refreshInfoWithTid:(int)tid];
            }];
        }
        topCell.topFrame = self.topFrame;
        return topCell;
//    }else{
//        LGDetailPhotoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LGDetailPhotoTableViewCell"];
//        if (!cell)
//        {
//            
//            cell = [[LGDetailPhotoTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"LGDetailPhotoTableViewCell"];
//            [cell setBlock:^(LGHomeDetailMainModle *model) {
//                
//                [self toPayViewControllerWithModel:model];
//                
//            }];
//        }
//        [cell relayoutWithModel1:self.dataArr[indexPath.row*2] model2:self.dataArr[indexPath.row*2+1]];
//        cell.selectionStyle = UITableViewCellSelectionStyleNone;
//        return cell;
//    }
   
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return CGRectGetMaxY(self.topFrame.selectViewFrame)+10;
}

#pragma mark- join next controller
//-(void)toPayViewControllerWithModel:(LGHomeDetailMainModle *)model
//{
//    LGHomePayViewController *pay = [[LGHomePayViewController alloc]init];
//    pay.model = model;
//    [self.navigationController pushViewController:pay animated:YES];
//}

#pragma mark- 明杰刷新数据代理方法
- (void)refreshViewBeginRefreshing:(MJRefreshBaseView *)refreshView
{
    if (refreshView == _headerView) {
        self.page =0;
        [self refreshInfoWithTid:[self.currentTid intValue]];
    }
    else
    {
        self.page += 1;
        [self refreshInfoWithTid:[self.currentTid intValue]];
    }
}

-(void)dealloc
{
    [_headerView free];
    [_footView free];
}

@end
