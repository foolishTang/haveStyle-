//
//  LGClassifyTableViewController.m
//  有范吗?
//
//  Created by 唐磊guang on 15/12/30.
//  Copyright (c) 2015年 唐磊guang. All rights reserved.
//

#import "LGClassifyTableViewController.h"
#import "LGSearchBar.h"
#import "LGClassifyHttpTool.h"
#import "LGClassifyBrandCell.h"
#import "LGClassifyHotCell.h"
#import "LGClassifySecondVC.h"
#define ClassiesCount 7
@interface LGClassifyTableViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic ,weak)UIScrollView *drawerView;

@property (strong , nonatomic)NSMutableArray *btnArr;

@property (strong , nonatomic)NSArray *brandArray;

@property (strong , nonatomic)NSArray *hotArray;

@property (weak , nonatomic)UITableView *tableView;

@property (strong , nonatomic)UIView *baseView;

@property (weak , nonatomic)LGSearchBar *searchBar;

@end

@implementation LGClassifyTableViewController

-(NSMutableArray *)btnArr
{
    if (!_btnArr) {
        _btnArr = [[NSMutableArray alloc]init];
    }
    return _btnArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self makeDrawerView];
    [self createUI];
    
    [self makeNavItem];
    [self getInfo];
    
}
#pragma mark- UI
-(void)createUI
{
    UITableView *table = [[UITableView alloc]init];
    self.tableView = table;
    table.frame = self.view.bounds;
    table.delegate = self;
    table.dataSource = self;
    [self.view addSubview:table];
}

-(void)makeNavItem
{
    LGSearchBar *searchBar = [LGSearchBar searchBar];
    self.searchBar = searchBar;
    searchBar.frame = CGRectMake(0, 0, 210, 30);
    self.navigationItem.titleView = searchBar;
    searchBar.borderStyle = UITextBorderStyleRoundedRect;
    searchBar.placeholder = @"搜索:用户、品牌、标签";
}

-(void)makeDrawerView
{
    UIView *baseView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.width-35, 35)];
    
        baseView.backgroundColor = [UIColor whiteColor];
        self.baseView = baseView;
        
        UILabel *label = [[UILabel alloc]init];
        [baseView addSubview:label];
        label.frame = CGRectMake(0, 0, 150, 35);
        label.text = @"切换类别";
        
        
        
        UIScrollView *scroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.width-35, 35)];
        self.drawerView = scroll;
        self.drawerView.backgroundColor = [UIColor grayColor];
        scroll.bounces = NO;
        
        float ItemW = (self.view.width - 35)/5.0f;
        float ItemH = 35;
        NSArray *titleArr = @[@"女装",@"男装",@"鞋履",@"箱包",@"配饰",@"美妆",@"生活"];
        [baseView addSubview:scroll];
        int i = 0;
        for (; i < ClassiesCount ; i++)
        {
            
            UIButton *button = [[UIButton alloc]init];
            button.tag = i;
            [button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
            [button setTitle:titleArr[i] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            button.titleLabel.font = [UIFont systemFontOfSize:15];
            float x = ItemW *i;
            float y = 0;
            float w = ItemW;
            float h = ItemH;
            button.frame = CGRectMake(x, y, w, h);
            [scroll addSubview:button];
            [self.btnArr addObject:button];
            
            
        }
        scroll.contentSize = CGSizeMake(i*ItemW, 0);
        
        
        UIButton *selectBtn = [[UIButton alloc]init];
        selectBtn.frame = CGRectMake(CGRectGetMaxX(scroll.frame), 0, 35, 35);
        [selectBtn setBackgroundColor:[UIColor blackColor]];
        [selectBtn addTarget:self action:@selector(selectBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [baseView addSubview:selectBtn];
}
#pragma mark- UI事件
-(void)selectBtnClick:(UIButton *)btn
{
    btn.selected = !btn.selected;
    if (btn.selected) {
        self.drawerView.bounces = YES;
        CGRect rect = CGRectMake(0, 35, self.view.width, 35*3);
        CGRect baseRect = CGRectMake(0, 0, self.view.width, 35*4);
        float ItemW = self.view.width/3.0f;
        float ItemH = 35;
        int i = 0;
        
        for (UIButton *button in self.btnArr)
        {
            
            float x = ItemW *(i%3);
            float y = ItemH * (i/3);
            float w = ItemW;
            float h = ItemH;
            button.frame = CGRectMake(x, y, w, h);
//            [self.drawerView addSubview:button];
            i++;
        }
        [self.drawerView setNeedsDisplay];
        self.drawerView.contentSize = CGSizeMake(self.view.width, ItemH * ((i+1)/3));
        [UIView animateWithDuration:0.3 animations:^{
            self.drawerView.frame = rect;
            self.baseView.frame = baseRect;
        }];
    }
    else
    {
        self.drawerView.bounces = NO;
        CGRect rect = CGRectMake(0, 0, self.view.width-35, 35);
        CGRect baseRect = CGRectMake(0, 0, self.view.width, 35);
        float ItemW = (self.view.width - 35)/5.0f;
        float ItemH = 35;
        int i = 0;
        for (UIButton *button in self.btnArr)
        {
            float x = ItemW *i;
            float y = 0;
            float w = ItemW;
            float h = ItemH;
            button.frame = CGRectMake(x, y, w, h);
//            [self.drawerView addSubview:button];
            i++;
        }
        [self.drawerView setNeedsDisplay];
        [UIView animateWithDuration:0.3 animations:^{
            self.drawerView.frame = rect;
            self.baseView.frame = baseRect;
        }];
        self.drawerView.contentSize = CGSizeMake(i*ItemW, 0);
        
    }
    
}

-(void)clickButton:(UIButton *)button
{
    NSLog(@"%d",button.tag);
}

#pragma mark - tabbleView代理方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.brandArray.count>0) {
        return 2;
    }
    return 0;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        LGClassifyBrandCell *brandCell = [tableView dequeueReusableCellWithIdentifier:@"LGClassifyBrandCell"];
        if (!brandCell)
        {
            brandCell = [[LGClassifyBrandCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"LGClassifyBrandCell"];
        }
        brandCell.brandArray = self.brandArray;
        brandCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return brandCell;
    }
    else
    {
        LGClassifyHotCell *hotCell = [tableView dequeueReusableCellWithIdentifier:@"LGClassifyHotCell"];
        if (!hotCell)
        {
            hotCell = [[LGClassifyHotCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"LGClassifyHotCell"];
        }
        [hotCell setBlock:^(NSString *tid)
        {
            LGClassifySecondVC *second = [[LGClassifySecondVC alloc]init];
            second.tid = tid;
            [self.navigationController pushViewController:second animated:YES];
        }];
        hotCell.hotArray = self.hotArray;
        hotCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return hotCell;
    }
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"";
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 35;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return self.baseView;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 186;
    }
    return 280;
    
}
#pragma mark- 获取数据
-(void)getInfo
{
    [LGClassifyHttpTool classifyGet:LGClassifyUrl success:^(NSArray *brandArray, NSArray *hotArray) {
        self.brandArray = brandArray;
        self.hotArray = hotArray;
        [self.tableView reloadData];
    } wrong:^(NSError *error) {
        
    }];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    if (touch.view != self.navigationItem.titleView) {
        [self.searchBar resignFirstResponder];
    }
}

@end
