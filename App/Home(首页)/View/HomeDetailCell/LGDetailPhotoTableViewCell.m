//
//  LGDetailPhotoTableViewCell.m
//  有范吗?
//
//  Created by 唐磊guang on 16/1/4.
//  Copyright (c) 2016年 唐磊guang. All rights reserved.
//

#import "LGDetailPhotoTableViewCell.h"
#import "LGClassifySecondModel.h"
#import "UIButton+WebCache.h"

#define AseptScale 1.3
#define margon 10

@interface  LGDetailPhotoTableViewCell()

@property (weak , nonatomic)UIButton *leftBtn;
@property (weak , nonatomic)UIButton *rightBtn;

@property (strong , nonatomic)UIView *leftView;
@property (strong , nonatomic)UIView *rightView;

@property (weak , nonatomic)UILabel *leftName;
@property (weak , nonatomic)UILabel *leftCurrentPrice;
@property (weak , nonatomic)UILabel *leftPrice;

@property (weak , nonatomic)UILabel *rightName;
@property (weak , nonatomic)UILabel *rightCurrentPrice;
@property (weak , nonatomic)UILabel *rightPrice;



@end


@implementation LGDetailPhotoTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        UIButton *btn = [[UIButton alloc]init];
        [self.contentView addSubview:btn];
        [btn addTarget:self action:@selector(leftButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        self.leftBtn = btn;
        
        
        UIButton *btn1 = [[UIButton alloc]init];
        [btn1 addTarget:self action:@selector(rightButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:btn1];
        self.rightBtn = btn1;
        [self creatUI];
    }
    return self;
}

-(void)creatUI
{
    self.leftView = [[UIView alloc]init];
    [self.contentView addSubview:self.leftView];
    //self.leftView.backgroundColor = [UIColor blackColor];
    
    self.rightView = [[UIView alloc]init];
    [self.contentView addSubview:self.rightView];
    
    
    
    self.leftName = [self leftLabels];
    self.leftCurrentPrice = [self leftLabels];
    self.leftPrice = [self leftLabels];

    self.rightName = [self rightLabels];
    self.rightCurrentPrice = [self rightLabels];
    self.rightPrice = [self rightLabels];
}

-(void)relayoutWithModel1:(LGClassifySecondModel *)model1 model2:(LGClassifySecondModel *)model2
{
    
    self.model1 = model1.clsInfo;
    self.model2 = model2.clsInfo;
    
    CGFloat btnW = (ScreenW-3*margon)/2.0f;
    CGFloat btnH = btnW;
    self.leftBtn.frame = CGRectMake(3, 0, btnW, btnH);
    
    CGFloat leftX = self.leftBtn.x;
    CGFloat leftY = CGRectGetMaxY(self.leftBtn.frame)+margon;
    CGFloat leftW = self.leftBtn.width;
    CGFloat leftH = 30;
    self.leftView.frame = CGRectMake(leftX, leftY, leftW, leftH);
    
    
    CGFloat leftNameX = 0;
    CGFloat leftNameY = 0;
    CGFloat leftNameW = self.leftView.width;
    CGFloat leftNameH = 13;
    
    self.leftName.frame = CGRectMake(leftNameX, leftNameY, leftNameW, leftNameH);
    self.leftName.text = model1.clsInfo.name;
    
    CGFloat leftCurrentPriceX = 0;
    CGFloat leftCurrentPriceY = CGRectGetMaxY(self.leftName.frame)+4;
    CGFloat leftCurrentPriceW = self.leftView.width/2;
    CGFloat leftCurrentPriceH = 13;
    
    self.leftCurrentPrice.frame = CGRectMake(leftCurrentPriceX, leftCurrentPriceY, leftCurrentPriceW, leftCurrentPriceH);
    self.leftCurrentPrice.text = [NSString stringWithFormat:@"%d",(int)self.model1.price];
    
    
    CGFloat leftPriceX = CGRectGetMaxX(self.leftCurrentPrice.frame)+3;
    CGFloat leftPriceY = leftCurrentPriceY;
    CGFloat leftPriceW = self.leftView.width/2;
    CGFloat leftPriceH = 13;
    
    self.leftPrice.frame = CGRectMake(leftPriceX, leftPriceY, leftPriceW, leftPriceH);
    self.leftPrice.text = [NSString stringWithFormat:@"%d",(int)self.model1.sale_price];
    
    
    
    
    
    
    
    
    
    [self.leftBtn sd_setImageWithURL:[NSURL URLWithString:model1.clsInfo.mainImage] forState:UIControlStateNormal];
    
    self.rightBtn.frame = CGRectMake(btnW+2*margon, 0, btnW, btnH);
    
    CGFloat rightX = self.rightBtn.x;
    CGFloat rightY = CGRectGetMaxY(self.rightBtn.frame)+margon;
    CGFloat rightW = self.rightBtn.width;
    CGFloat rightH = 30;
    self.rightView.frame = CGRectMake(rightX, rightY, rightW, rightH);
    
    
    
    CGFloat rightNameX = 0;
    CGFloat rightNameY = 0;
    CGFloat rightNameW = self.leftView.width;
    CGFloat rightNameH = 13;
    
    self.rightName.frame = CGRectMake(rightNameX, rightNameY, rightNameW, rightNameH);
    self.rightName.text = model2.clsInfo.name;
    
    CGFloat rightCurrentPriceX = 0;
    CGFloat rightCurrentPriceY = CGRectGetMaxY(self.rightName.frame)+4;
    CGFloat rightCurrentPriceW = self.rightView.width/2;
    CGFloat rightCurrentPriceH = 13;
    
    self.rightCurrentPrice.frame = CGRectMake(rightCurrentPriceX, rightCurrentPriceY, rightCurrentPriceW, rightCurrentPriceH);
    self.rightCurrentPrice.text = [NSString stringWithFormat:@"%d",(int)self.model2.price];
    
    
    CGFloat rightPriceX = CGRectGetMaxX(self.rightCurrentPrice.frame)+3;
    CGFloat rightPriceY = rightCurrentPriceY;
    CGFloat rightPriceW = self.rightView.width/2;
    CGFloat rightPriceH = 13;
    
    self.rightPrice.frame = CGRectMake(rightPriceX, rightPriceY, rightPriceW, rightPriceH);
    self.rightPrice.text = [NSString stringWithFormat:@"%d",(int)self.model2.sale_price];
    
    
    
    
    
    [self.rightBtn sd_setImageWithURL:[NSURL URLWithString:model2.clsInfo.mainImage] forState:UIControlStateNormal];
}
-(UILabel *)leftLabels
{
    UILabel *leftCurrentPrice = [[UILabel alloc]init];
    [self.leftView addSubview:leftCurrentPrice];
    leftCurrentPrice.textAlignment = NSTextAlignmentCenter;
    leftCurrentPrice.font = [UIFont systemFontOfSize:11];
    return leftCurrentPrice;
}
-(UILabel *)rightLabels
{
    UILabel *leftCurrentPrice = [[UILabel alloc]init];
    [self.rightView addSubview:leftCurrentPrice];
    leftCurrentPrice.textAlignment = NSTextAlignmentCenter;
    leftCurrentPrice.font = [UIFont systemFontOfSize:11];
    return leftCurrentPrice;
}
-(void)leftButtonClick:(UIButton *)button
{
    self.block(self.model1);
    
}
-(void)rightButtonClick:(UIButton *)button
{
    self.block(self.model2);
}
@end
