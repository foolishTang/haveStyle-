//
//  LGCommunityTableViewController.m
//  有范吗?
//
//  Created by 唐磊guang on 15/12/30.
//  Copyright (c) 2015年 唐磊guang. All rights reserved.
//

#import "LGCommunityTableViewController.h"
#import "LGCommunityLineButton.h"
#import "LGHotCollectionViewCell.h"
#import "LGCombineCollectionViewCell.h"
#import "LGNoticeCollectionViewCell.h"
#import "LGCommunityHttpToll.h"
@interface LGCommunityTableViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>


@property (weak , nonatomic)UICollectionView *collectionView;

@property (weak , nonatomic)LGCommunityLineButton *selectedBtn;

@property (strong , nonatomic)NSMutableArray *buttonArr;

@property (strong , nonatomic)NSArray *infoArr;

@end

@implementation LGCommunityTableViewController

-(NSMutableArray *)buttonArr
{
    if (!_buttonArr)
    {
        _buttonArr = [[NSMutableArray alloc]init];
    }
    return _buttonArr;
}
-(NSArray *)infoArr
{
    if (!_infoArr) {
        NSMutableArray *hot = [[NSMutableArray alloc]init];
        NSMutableArray *combine = [[NSMutableArray alloc]init];
        NSMutableArray *notice = [[NSMutableArray alloc]init];
        
        _infoArr = @[hot,combine,notice];
    }
    return _infoArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.translucent = NO;
    [self makeNav];
    [self createUI];
    [self getInfoWithPage:0 type:2];
}
#pragma mark- getInfo
-(void)getInfoWithPage:(int)page type:(int)type
{
    [self.infoArr[LGCommunityCombineInfo] removeAllObjects];
    
    NSString *urlStr = [NSString stringWithFormat:LGCommunityCollocationUrl,page,type];
    [LGCommunityHttpToll communityGet:urlStr success:^(NSArray *combineArr) {
        
        [self.infoArr[LGCommunityCombineInfo] addObjectsFromArray:combineArr];
        [self.collectionView reloadData];
        
    } wrong:^(NSError *error) {
        NSLog(@"这不对？？");
    }];
}
-(void)makeNav
{
    UIView *view =[[UIView alloc]initWithFrame:CGRectMake(0, 0, 130, 35)];
    view.backgroundColor = [UIColor clearColor];
    self.navigationItem.titleView = view;
    
    float itemW = view.width/3.0f;
    float itemH = view.height;
    NSArray *titleArray = @[@"热门",@"搭配",@"关注"];
    
    for (int i = 0; i< 3; i++)
    {
        LGCommunityLineButton *button = [[LGCommunityLineButton alloc]init];
        button.tag = i;
        
        CGFloat  topX = itemW *i;
        CGFloat  topY = 0;
        CGFloat  topW = itemW;
        CGFloat  topH = itemH;
        button.frame = CGRectMake(topX, topY, topW, topH);
        button.adjustsImageWhenHighlighted = NO;
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [button setTitle:titleArray[i] forState:UIControlStateNormal];
        [view addSubview:button];
        if (i == 0)
        {
            self.selectedBtn = button;
        }
        [self.buttonArr addObject:button];
    }
    self.selectedBtn.selected = YES;
    
}
#pragma mark- createUI
-(void)createUI
{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.minimumLineSpacing = 0;
    flowLayout.itemSize = CGSizeMake(ScreenW, self.view.height-44);
    
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, ScreenW,self.view.height) collectionViewLayout:flowLayout];
    collectionView.backgroundColor = [UIColor whiteColor];
    collectionView.showsHorizontalScrollIndicator = NO;
    collectionView.showsVerticalScrollIndicator = NO;
    collectionView.dataSource =self;
    collectionView.delegate = self;
    collectionView.pagingEnabled = YES;
    [collectionView registerClass:[LGHotCollectionViewCell class]forCellWithReuseIdentifier:@"LGHotCollectionViewCell"];
    [collectionView registerClass:[LGCombineCollectionViewCell class]forCellWithReuseIdentifier:@"LGCombineCollectionViewCell"];
    [collectionView registerClass:[LGNoticeCollectionViewCell class]forCellWithReuseIdentifier:@"LGNoticeCollectionViewCell"];
    [self.view addSubview:collectionView];
    self.collectionView = collectionView;
}
-(void)buttonClick:(LGCommunityLineButton *)button
{
    self.selectedBtn.selected = NO;
    button.selected = YES;
    self.selectedBtn = button;
    [self.collectionView setContentOffset:CGPointMake(button.tag*ScreenW, 0) animated:YES];
}
#pragma mark- UICollectonDatasource
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 3;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.item == 0)
    {
        LGHotCollectionViewCell *hotCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"LGHotCollectionViewCell" forIndexPath:indexPath];
        return hotCell;
    }
    else if (indexPath.item == 1)
    {
        LGCombineCollectionViewCell *combineCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"LGCombineCollectionViewCell" forIndexPath:indexPath];
        combineCell.imageArray = self.infoArr[LGCommunityCombineInfo];
        [combineCell setBlock:^(int type, int currentPage) {
            [self getInfoWithPage:currentPage type:type];
        }];
        return combineCell;
    }
  
    
        LGNoticeCollectionViewCell *noticeCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"LGNoticeCollectionViewCell" forIndexPath:indexPath];
        return noticeCell;
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    int page = scrollView.contentOffset.x/ScreenW;
    for (UIButton *button in self.buttonArr) {
        if (page == button.tag) {
            self.selectedBtn.selected = NO;
            button.selected = YES;
            self.selectedBtn = (LGCommunityLineButton*)button;
            break;
        }
    }
}
@end
