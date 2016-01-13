//
//  LGHomeADTableViewCell.m
//  有范吗?
//
//  Created by 唐磊guang on 15/12/30.
//  Copyright (c) 2015年 唐磊guang. All rights reserved.
//

#import "LGHomeADTableViewCell.h"
#import "LGHomeADModel.h"
#import "UIView+Extension.h"
#import "UIImageView+WebCache.h"
#import "LGADCollectionViewCell.h"
#define ADMaxCount 7
#define ADTableViewCellHeight 150
#define ScreenW [UIScreen mainScreen].bounds.size.width

@interface LGHomeADTableViewCell()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (strong , nonatomic)UICollectionView *backView;

@property (strong , nonatomic)NSTimer *timer;

@property (strong , nonatomic)UIPageControl *pageControl;

@end

@implementation LGHomeADTableViewCell

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
    flowLayout.itemSize = CGSizeMake(ScreenW, ADTableViewCellHeight);
    
    self.backView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, ScreenW, ADTableViewCellHeight) collectionViewLayout:flowLayout];
    self.backView.backgroundColor = [UIColor whiteColor];
    self.backView.showsHorizontalScrollIndicator = NO;
    self.backView.showsVerticalScrollIndicator = NO;
    self.backView.dataSource =self;
    self.backView.delegate = self;
    self.backView.pagingEnabled = YES;
    [self.backView registerClass:[LGADCollectionViewCell class] forCellWithReuseIdentifier:@"LGADCollectionViewCell"];
    [self.contentView addSubview:self.backView];
    
    self.pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(0, ADTableViewCellHeight-35, ScreenW, 35)];
//    self.pageControl.tintColor = [UIColor whiteColor];
    self.pageControl.pageIndicatorTintColor = [UIColor whiteColor];
    self.pageControl.currentPageIndicatorTintColor = [UIColor blackColor];
    [self.contentView addSubview:self.pageControl];

}

-(void)addTimer
{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(runTimer) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop]addTimer:self.timer forMode:NSRunLoopCommonModes];
}

-(void)removeTimer
{
    [self.timer invalidate];
    self.timer = nil;
}
-(void)runTimer
{
    NSIndexPath *currentIndexPath = [self.backView.indexPathsForVisibleItems lastObject];
    
    
    NSIndexPath *currentIndexPathReset = [NSIndexPath indexPathForItem:currentIndexPath.item inSection:50];
    
    [self.backView scrollToItemAtIndexPath:currentIndexPathReset atScrollPosition:UICollectionViewScrollPositionRight animated:NO];
    
    NSInteger item = currentIndexPath.item+1;
    NSInteger section = currentIndexPathReset.section;
    if (item== self.ADArray.count-1) {
        item = 0;
        section +=1;
        
    }
    NSIndexPath *nextIndexPath = [NSIndexPath indexPathForItem:item inSection:section];
    [self.backView scrollToItemAtIndexPath:nextIndexPath atScrollPosition:UICollectionViewScrollPositionRight animated:YES];
    
    
}

-(void)collectionViewStart
{
    [self.backView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:50] atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
    [self addTimer];
}
-(void)setADArray:(NSArray *)ADArray
{
    if (ADArray.count == 0) {
        return;
    }
    _ADArray = ADArray;
    self.pageControl.numberOfPages = ADArray.count;
    [self.backView reloadData];
    [self collectionViewStart];
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 100;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _ADArray.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    LGADCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"LGADCollectionViewCell" forIndexPath:indexPath];
    cell.model = _ADArray[indexPath.item];
    
    return cell;
}


-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self removeTimer];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    int page = (int)(scrollView.contentOffset.x/scrollView.width+0.5)%self.ADArray.count;
    self.pageControl.currentPage = page;
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self addTimer];
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    LGHomeADModel *model =self.ADArray[indexPath.item];
    self.ADBlock(model.url);
}
@end
