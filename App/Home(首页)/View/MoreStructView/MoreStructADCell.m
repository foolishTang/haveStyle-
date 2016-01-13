//
//  MoreStructADCell.m
//  有范吗?
//
//  Created by 唐磊guang on 16/1/9.
//  Copyright (c) 2016年 唐磊guang. All rights reserved.
//

#import "MoreStructADCell.h"
#import "LGADCollectionViewCell.h"
#import "TowHomeADModel.h"


@interface MoreStructADCell()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (strong , nonatomic)UICollectionView *backView;

@property (strong , nonatomic)NSTimer *timer;

@property (strong , nonatomic)UIPageControl *pageControl;

@property (strong , nonatomic)UICollectionViewFlowLayout *flowLayout;

@end

@implementation MoreStructADCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        [self createUI];
    }
    return self;
}
-(void)createUI
{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.minimumLineSpacing = 0;
    self.flowLayout = flowLayout;

    
    
    self.backView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, ScreenW, 100) collectionViewLayout:flowLayout];
    self.backView.backgroundColor = [UIColor whiteColor];
    self.backView.showsHorizontalScrollIndicator = NO;
    self.backView.showsVerticalScrollIndicator = NO;
    self.backView.dataSource =self;
    self.backView.delegate = self;
    self.backView.pagingEnabled = YES;
    [self.backView registerClass:[LGADCollectionViewCell class] forCellWithReuseIdentifier:@"LGADCollectionViewCell"];
    [self.contentView addSubview:self.backView];
    
    
    
    self.pageControl = [[UIPageControl alloc]init];
    //    self.pageControl.tintColor = [UIColor whiteColor];
    self.pageControl.pageIndicatorTintColor = [UIColor whiteColor];
    self.pageControl.currentPageIndicatorTintColor = [UIColor blackColor];
    [self.contentView addSubview:self.pageControl];
    
}

-(void)setModel:(TowHomeADModel *)model
{
    if (model.config.count == 0) {
        return;
    }
    
    _model = model;
    ADConfig *config = model.config[0];
    self.pageControl.frame = CGRectMake(0, config.fitH-35, ScreenW, 35);
    self.flowLayout.itemSize = CGSizeMake(ScreenW, config.fitH);

    //self.backView.frame
    
    self.backView.frame = CGRectMake(0, 0, ScreenW, config.fitH);
    
    self.pageControl.numberOfPages = model.config.count;
    [self.backView reloadData];
    [self collectionViewStart];
}

-(void)addTimer
{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(runTimer) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop]addTimer:self.timer forMode:NSRunLoopCommonModes];
}

-(void)removeTimer
{
    [self.timer invalidate];
    self.timer = nil;
}
-(void)runTimer
{
    //获得当前collectionView当前的indexPath
    NSIndexPath *currentIndexPath = [self.backView.indexPathsForVisibleItems lastObject];
    
    NSIndexPath *currentIndexPathReset = [NSIndexPath indexPathForItem:currentIndexPath.item inSection:50];
    
    //让collectionView滑到指定的位置
    [self.backView scrollToItemAtIndexPath:currentIndexPathReset atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
    
    NSInteger item = currentIndexPath.item+1;
    NSInteger section = currentIndexPathReset.section;
    if (item== self.model.config.count) {
        item = 0;
        section +=1;
        
    }
    NSIndexPath *nextIndexPath = [NSIndexPath indexPathForItem:item inSection:section];
    [self.backView scrollToItemAtIndexPath:nextIndexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
    
    
}

-(void)collectionViewStart
{
    [self.backView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:50] atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
    [self addTimer];
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 100;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.model.config.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    LGADCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"LGADCollectionViewCell" forIndexPath:indexPath];
    cell.model = self.model.config[indexPath.item];
    
    return cell;
}


-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self removeTimer];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    int page = (int)(scrollView.contentOffset.x/scrollView.width+0.5)%self.model.config.count;
    self.pageControl.currentPage = page;
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self addTimer];
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    ADConfig *model =self.model.config[indexPath.item];
    self.ADBlock(model.url);
}

@end
