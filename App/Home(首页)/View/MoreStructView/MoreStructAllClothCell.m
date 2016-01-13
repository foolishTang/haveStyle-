//
//  MoreStructAllClothCell.m
//  有范吗?
//
//  Created by 唐磊guang on 16/1/9.
//  Copyright (c) 2016年 唐磊guang. All rights reserved.
//

#import "MoreStructAllClothCell.h"
#import "TowHomeHSBrandModel.h"

#import "testModel.h"
@interface MoreStructAllClothCell()
@property (weak , nonatomic)UIButton *topTitle6;
@property (weak , nonatomic)UIButton *topImage5;
@property (weak , nonatomic)UIButton *left4;
@property (weak , nonatomic)UIButton *rightTop3;
@property (weak , nonatomic)UIButton *rightBottomL2;
@property (weak , nonatomic)UIButton *rightBottomR1;
@end

@implementation MoreStructAllClothCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.topTitle6 = [self createButtonWithTag:6];
        self.topImage5 = [self createButtonWithTag:5];
        self.left4  = [self createButtonWithTag:4];
        self.rightTop3 = [self createButtonWithTag:3];
        self.rightBottomL2 = [self createButtonWithTag:2];
        self.rightBottomR1 = [self createButtonWithTag:1];
    }
    return self;
}

-(void)setModel:(testModel *)model
{
    _model = model;
//    ImageConfig *imageConfig = model.config[0];
    NSArray *modelArray = model.config;
    
    TowConfig *towModel = modelArray[5];
    self.topTitle6.frame = CGRectMake(towModel.fitX, towModel.fitY, towModel.fitW, towModel.fitH);
    [self.topTitle6 sd_setImageWithURL:[NSURL URLWithString:towModel.img] forState:UIControlStateNormal];
    
    towModel = modelArray[4];
    self.topImage5.frame = CGRectMake(towModel.fitX, towModel.fitY, towModel.fitW, towModel.fitH);
    [self.topImage5 sd_setImageWithURL:[NSURL URLWithString:towModel.img] forState:UIControlStateNormal];
    
    towModel = modelArray[3];
    self.left4.frame = CGRectMake(towModel.fitX, towModel.fitY, towModel.fitW, towModel.fitH);
    [self.left4 sd_setImageWithURL:[NSURL URLWithString:towModel.img] forState:UIControlStateNormal];
    
    towModel = modelArray[2];
    self.rightTop3.frame = CGRectMake(towModel.fitX, towModel.fitY, towModel.fitW, towModel.fitH);
    [self.rightTop3 sd_setImageWithURL:[NSURL URLWithString:towModel.img] forState:UIControlStateNormal];
    
    towModel = modelArray[0];
    self.rightBottomR1.frame = CGRectMake(towModel.fitX, towModel.fitY, towModel.fitW, towModel.fitH);
    [self.rightBottomR1 sd_setImageWithURL:[NSURL URLWithString:towModel.img] forState:UIControlStateNormal];
    
    towModel = modelArray[1];
    self.rightBottomL2.frame = CGRectMake(towModel.fitX, towModel.fitY, towModel.fitW, towModel.fitH);
    [self.rightBottomL2 sd_setImageWithURL:[NSURL URLWithString:towModel.img] forState:UIControlStateNormal];
}

-(UIButton *)createButtonWithTag:(int)tag
{
    UIButton *button = [[UIButton alloc]init];
    button.tag = tag;
    button.adjustsImageWhenHighlighted = NO;
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:button];
    return button;

}

-(void)buttonClick:(UIButton *)btn
{
    TestConfig *config = self.model.config[btn.tag-1];
    self.block(config.jump.url);
}
@end
