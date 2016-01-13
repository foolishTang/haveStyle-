//
//  LGHomePayViewController.m
//  有范吗?
//
//  Created by 千锋 on 16/1/6.
//  Copyright (c) 2016年 唐磊guang. All rights reserved.
//

#import "LGHomePayViewController.h"
#import "LGHomePayHttpTool.h"
#import "LGHomeThirdPrama.h"
#import "LGHomeDetailMainModle.h"
#import "LGHomePayModel.h"
#import "LGPayTitleCell.h"
#import "LGPayPostCell.h"
#import "LGPayBrandCell.h"
#import "LGPayToolBar.h"
#import "LGPayNavBar.h"
#import "LGPayTVFooterCell.h"
#import "LGClassifySecondModel.h"
//收藏
#import "LGHomeDataTool.h"
@interface LGHomePayViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak , nonatomic)UITableView *tableView;

@property (weak , nonatomic)UITableView *bottomTBview;

@property (strong , nonatomic)LGHomePayModel *payModel;

@property (weak , nonatomic)LGPayNavBar *navView;

@property (weak , nonatomic)UILabel *navLabel;

@end

@implementation LGHomePayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
//    self.navigationController.navigationBarHidden = YES;
    //让tableView的起始点为0
    //self.edgesForExtendedLayout = UIRectEdgeNone;
    [self createTableView];
    
    [self getInfo];
    
//    [self createNavBar];
    [self createToolBar];
   
}
#pragma mark- 创建工具栏
-(void)createToolBar
{
    LGPayToolBar *toolBar = [LGPayToolBar payToolBar];
    [toolBar setBlock:^{
        LGHomeDataTool *database = [LGHomeDataTool shareInstance];
        [database insertAnModel:self.payModel];
        UIBarButtonItem *barButton = self.navigationItem.rightBarButtonItem;
        for (UIView *view in barButton.customView.subviews) {
            if ([view isKindOfClass:[UILabel class]]) {
                UILabel *label = (UILabel *)view;
                label.hidden = NO;
                NSArray *array = [database selectAllModel];
                label.text = [NSString stringWithFormat:@"%d",(int)array.count];
            }
        }
    }];
    [self.view addSubview:toolBar];
}

-(void)createNavBar
{
    LGPayNavBar *navBar = [[LGPayNavBar alloc]initWithFrame:CGRectMake(0, 0, self.view.width, 64)];
    navBar.backgroundColor = [UIColor blackColor];
    navBar.alpha = 0.1;
    self.navView= navBar;
    [self.view addSubview:navBar];
    
    
    UIButton *button = [[UIButton alloc]init];
    button.adjustsImageWhenHighlighted = NO;
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"返回" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    [button setTitleColor:[UIColor yellowColor] forState:UIControlStateSelected];
    button.layer.borderWidth = 0.3;
    button.layer.borderColor = [UIColor grayColor].CGColor;
    button.backgroundColor = [UIColor whiteColor];
    button.titleLabel.font = [UIFont systemFontOfSize:14];
    button.frame = CGRectMake(5, 20, 50, 50);
    [navBar addSubview:button];
    
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 20, ScreenW-64-64-64, 44)];
    label.centerX = navBar.centerX;
    [self.navView addSubview:label];
    label.text = @"";
    label.textColor = [UIColor whiteColor];
    label.backgroundColor = [UIColor blackColor];
    label.textAlignment = NSTextAlignmentCenter;
    self.navLabel = label;
}

#pragma mark- UI事件
-(void)buttonClick:(UIButton *)button
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)createTableView
{
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height)];
    self.tableView = tableView;
    self.tableView.backgroundColor = [UIColor lightGrayColor];
//    self.tableView.alpha = 0.6;
    tableView.delegate = self;
    tableView.dataSource = self;
    
    
    [self.view addSubview:tableView];
    
    UITableView *bottomTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, self.view.height+49, self.view.width, self.view.height)];
    self.bottomTBview = bottomTableView;
    self.bottomTBview.backgroundColor = [UIColor whiteColor];
    //    self.tableView.alpha = 0.6;
    bottomTableView.delegate = self;
    bottomTableView.dataSource = self;
    
    
    [self.view addSubview:bottomTableView];
}

-(void)getInfo
{
    LGHomeThirdPrama *param = [LGHomeThirdPrama prama];
    param.IDS = self.model.code;
    [LGHomePayHttpTool homePayPost:@"http://api.funwear.com/mbfun_server/index.php?m=Product&a=ProductClsFilter" param:param success:^(LGHomePayModel *model)
    {
//        model.clsInfo
//        model.commonCountTotal
//        
//       
//        NSLog(@"%d*******%d",model.clsPicUrl.count,model.proPicUrl.count);
        self.payModel = model;
        [self.tableView reloadData];
        
    } wrong:^(NSError *error) {
        
    }];
}
#pragma mark- tableView代理方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.payModel) {
        return 6;
    }
    return 0;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            LGPayTitleCell *topCell = [tableView dequeueReusableCellWithIdentifier:@"LGPayTitleCell"];
            if (!topCell)
            {
                
                topCell = [[LGPayTitleCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"LGPayTitleCell"];
                
            }
            topCell.model = self.payModel;
            return topCell;
        }
        else if (indexPath.row == 1) {
            LGPayPostCell *post = [tableView dequeueReusableCellWithIdentifier:@"LGPayPostCell"];
            if (!post)
            {
                
                post = [[[NSBundle mainBundle]loadNibNamed:@"LGPayPostCell" owner:nil options:nil]lastObject];
                
            }
            post.model = [self.payModel.activity firstObject];
            return post;
        }
        else if(indexPath.row == 2)
        {
            LGPayBrandCell *brand = [tableView dequeueReusableCellWithIdentifier:@"LGPayBrandCell"];
            if (!brand)
            {
                
                brand = [[[NSBundle mainBundle]loadNibNamed:@"LGPayBrandCell" owner:nil options:nil]lastObject];
                
            }
            brand.model = self.payModel.clsInfo;
            return brand;
        }
        
        else if(indexPath.row == 3 || indexPath.row == 4)
        {
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
            if (!cell) {
                cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            }
            if (indexPath.row == 3) {
                cell.textLabel.text = @"尺码参数";
            }else
            {
                cell.textLabel.text = @"评价列表";
            }
            return cell;
        }
        LGPayTVFooterCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LGPayTVFooterCell"];
        if (!cell) {
            cell = [[LGPayTVFooterCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"LGPayTVFooterCell"];
        }
        return cell;
    }
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    }
    return cell;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

        if (indexPath.row == 0) {
            return 388;
        }else if(indexPath.row == 1)
        {
            return 52;
        }
        else if(indexPath.row == 2)
        {
            return 70;
        }
        else if(indexPath.row == 3 || indexPath.row == 4)
        {
            return 44;
        }
        return 49;

    
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    if (scrollView == self.tableView)
    {
        float alpha = (scrollView.contentOffset.y+20)/44.0f;
        self.navView.alpha = alpha;
        
        float d_value = scrollView.contentSize.height-scrollView.contentOffset.y;
        float canLook = self.view.height - 49;
        
        if (scrollView.contentSize.height == 0) {
            return;
        }
        
        if (d_value-canLook< 0) {
            
            
            
            //作条的动画
            self.navLabel.text = self.payModel.clsInfo.name;
            
//            [UIView animateWithDuration:0.5 animations:^{
//                self.bottomTBview.frame = CGRectMake(0, 0, self.view.width, self.view.height);
//            }];
        }
    }
    
    
}


@end
