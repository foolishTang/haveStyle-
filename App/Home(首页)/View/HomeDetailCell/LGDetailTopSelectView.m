//
//  LGDetailTopSelectView.m
//  有范吗?
//
//  Created by 唐磊guang on 16/1/4.
//  Copyright (c) 2016年 唐磊guang. All rights reserved.
//

#import "LGDetailTopSelectView.h"
#import "LGHomeDetailMidModel.h"
#import "UIButton+WebCache.h"
#import "LGTitleButton.h"
#define ItemMargon 3
@interface LGDetailTopSelectView()

@property (weak , nonatomic)UIScrollView *scrollView;
@property (strong , nonatomic)LGTitleButton *selectedBtn;


@end

@implementation LGDetailTopSelectView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor whiteColor];
        
    }
    return self;
}

-(void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    
    [self.scrollView removeFromSuperview];
    
    UIScrollView *scrollView = [[UIScrollView alloc]init];
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.backgroundColor = [UIColor whiteColor];
    scrollView.frame = self.bounds;
    [self addSubview:scrollView];
    self.scrollView = scrollView;
    
//    [self.collection removeFromSuperview];
//    
//    
//    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout  alloc]init];
//    layout.itemSize = CGSizeMake(self.height, self.height);
//    layout.minimumInteritemSpacing = ItemMargon;
//#warning 重要滑动方向必须得设
//    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
//    UICollectionView *collectionV = [[UICollectionView alloc]initWithFrame:self.bounds collectionViewLayout:layout];
//    collectionV.frame = self.bounds;
//    [collectionV registerClass:[LGDetailCollectionCell class] forCellWithReuseIdentifier:@"LGDetailCollectionCell"];
//    collectionV.showsVerticalScrollIndicator = NO;
//    collectionV.showsHorizontalScrollIndicator = NO;
//    collectionV.delegate = self;
//    collectionV.dataSource = self;
//    collectionV.backgroundColor = [UIColor whiteColor];
//    
//    [self addSubview:collectionV];
//    self.collection = collectionV;
   
}

-(void)setArray:(NSArray *)array
{
    _array = array;
//    [self.collection reloadData];
    [self scrollViewAddSubviewWithArray:(NSArray *)array];
}

-(void)scrollViewAddSubviewWithArray:(NSArray *)array
{
#warning 假的
    
    
    
    CGFloat itemH = self.height;
    int i = 0;
    for (LGHomeDetailMidModel *model in array)
    {
        LGTitleButton *button = [[LGTitleButton alloc]init];
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = [model.temp_id intValue];
        CGFloat x = i*(itemH+10)+10;
        CGFloat y = 0;
        CGFloat w = itemH;
        CGFloat h = w;
        button.frame = CGRectMake(x, y, w, h);
        [button sd_setImageWithURL:[NSURL URLWithString:model.small_img] forState:UIControlStateNormal];
        
        button.contentMode = UIViewContentModeScaleAspectFill;
        button.layer.borderColor = [UIColor darkGrayColor].CGColor;
        [button setTitle:model.name forState:UIControlStateNormal];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
        button.layer.borderWidth = 0.5;
        button.adjustsImageWhenHighlighted = NO;
        [self.scrollView addSubview:button];
        
    
        
//        UILabel *label = [[UILabel alloc]init];
//        [self.scrollView addSubview:label];
//        label.backgroundColor = [UIColor grayColor];
//        label.alpha = 0.6;
//        CGFloat labelW = w;
//        CGFloat labelH  = 20;
//        CGFloat labelX = x;
//        CGFloat labelY = CGRectGetMaxY(button.frame)-20;
//        label.frame = CGRectMake(labelX, labelY, labelW, labelH);
//        label.text = model.name;
//        label.textAlignment = NSTextAlignmentCenter;
//        label.font = [UIFont systemFontOfSize:9];
//        label.textColor = [UIColor whiteColor];
//        label.backgroundColor = [UIColor grayColor];
        i++;
    }
    
    self.scrollView.contentSize = CGSizeMake((itemH+10)*i+10, itemH);
    
    
    
}
-(void)buttonClick:(LGTitleButton *)button
{
    self.selectedBtn.titleLabel.backgroundColor = [UIColor darkGrayColor];
    self.selectedBtn.titleLabel.alpha = 0.6;
    self.selectedBtn.selected = NO;
    button.titleLabel.backgroundColor = [UIColor yellowColor];
    button.titleLabel.alpha = 1;
    button.selected = YES;
    self.selectedBtn = button;
    int tid = (int)button.tag;
    
#warning 如何防止
    self.block(tid);
}
#pragma mark- collectionView代理
//-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
//{
//    return self.array.count;
//}
//-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    LGDetailCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"LGDetailCollectionCell" forIndexPath:indexPath];
//    LGHomeDetailMidModel *model = self.array[indexPath.item];
//    cell.model = model;
//
//    return cell;
//}

//-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    [collectionView deselectItemAtIndexPath:indexPath animated:NO];
//    LGDetailCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"LGDetailCollectionCell" forIndexPath:indexPath];
//    UIImageView *image = [cell.contentView.subviews firstObject];
//    image.hidden = YES;
//    LGLog(@"%d",cell.contentView.subviews.count);
//}
-(void)dealloc
{

    [self.scrollView removeFromSuperview];
}
@end
