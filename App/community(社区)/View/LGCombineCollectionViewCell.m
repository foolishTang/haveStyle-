//
//  LGCombineCollectionViewCell.m
//  有范吗?
//
//  Created by 千锋 on 16/1/6.
//  Copyright (c) 2016年 唐磊guang. All rights reserved.
//

#import "LGCombineCollectionViewCell.h"
#import "LGCombineDetailCollectionViewCell.h"
#define CollectonItemH 175
#define TopViewH 35
@interface LGCombineCollectionViewCell()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (weak , nonatomic)UIView *topView;

@property (strong , nonatomic)UICollectionView *collection;

@end
@implementation LGCombineCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = LGRandomColor;
        [self createUI];
        
    }
    return self;
}

-(void)createUI
{
    UIView *topView = [[UIView alloc]init];
    topView.frame = CGRectMake(0, 0, self.width, TopViewH);
    [self.contentView addSubview:topView];
    self.topView = topView;
    [self createButtonWithTitle:@"女装" tag:0];
    [self createButtonWithTitle:@"男装" tag:1];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    flowLayout.minimumInteritemSpacing = 1;
    flowLayout.minimumLineSpacing = 0;
    
    float itemW = (ScreenW-4)/3.0f;
    
    flowLayout.itemSize = CGSizeMake(itemW,CollectonItemH);
    
#warning notice
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, TopViewH, ScreenW,self.contentView.height-TopViewH-60) collectionViewLayout:flowLayout];
    collectionView.backgroundColor = [UIColor whiteColor];
    collectionView.showsHorizontalScrollIndicator = NO;
    collectionView.showsVerticalScrollIndicator = NO;
    collectionView.dataSource =self;
    collectionView.delegate = self;
    collectionView.pagingEnabled = YES;
    [collectionView registerClass:[LGCombineDetailCollectionViewCell class]forCellWithReuseIdentifier:@"LGCombineDetailCollectionViewCell"];
    self.collection = collectionView;
    [self.contentView addSubview:collectionView];
}

-(void)setImageArray:(NSMutableArray *)imageArray
{
    if (imageArray.count== 0) {
        return;
    }
    if (_imageArray) {
        [_imageArray removeAllObjects] ;
    }
    if (!_imageArray) {
        _imageArray = [[NSMutableArray alloc]init];
    }
    [_imageArray addObjectsFromArray:imageArray];
    [self.collection reloadData];
    
}

-(void)createButtonWithTitle:(NSString *)title tag:(int)tag
{
    UIButton *button = [[UIButton alloc]init];
    button.tag = tag;
    button.adjustsImageWhenHighlighted = NO;
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    button.layer.borderWidth = 0.3;
    button.layer.borderColor = [UIColor grayColor].CGColor;
    button.backgroundColor = [UIColor whiteColor];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor yellowColor] forState:UIControlStateSelected];
    CGFloat  topX = self.width/2 *tag;
    CGFloat  topY = 0;
    CGFloat  topW = self.width/2;
    CGFloat  topH = 35;
    button.frame = CGRectMake(topX, topY, topW, topH);
    [self.topView addSubview:button];
}
-(void)buttonClick:(UIButton*)button
{
    button.selected = !button.selected;
    if (button.tag == 0) {
        self.block(2,0);
    }else
    {
        self.block(1,0);
    }
    
    
}
#pragma mark- UICollectonDatasource
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.imageArray.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    LGCombineDetailCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"LGCombineDetailCollectionViewCell" forIndexPath:indexPath];
    cell.model = self.imageArray[indexPath.item];
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}
@end
