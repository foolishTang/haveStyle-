//
//  MoreStructNewClothCell.m
//  有范吗?
//
//  Created by 唐磊guang on 16/1/9.
//  Copyright (c) 2016年 唐磊guang. All rights reserved.
//

#import "MoreStructNewClothCell.h"
#import "TowHomeHSBrandModel.h"
#import "testModel.h"
@interface MoreStructNewClothCell()
@property (weak , nonatomic)UIButton *topTitle5;
@property (weak , nonatomic)UIButton *topImage4;
@property (weak , nonatomic)UIButton *midLeft3;
@property (weak , nonatomic)UIButton *midRight2;
@property (weak , nonatomic)UIButton *bottomImage1;
@end

@implementation MoreStructNewClothCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.topImage4 = [self createButtonWithTag:4];
        self.topTitle5 = [self createButtonWithTag:5];
        self.midLeft3  = [self createButtonWithTag:3];
        self.midRight2 = [self createButtonWithTag:2];
        self.bottomImage1 = [self createButtonWithTag:1];
    }
    return self;
}

-(void)setModel:(testModel *)model
{
    _model = model;
//    ImageConfig *imageConfig = model.config[0];
    NSArray *modelArray = model.config;
    
    TowConfig *towModel = modelArray[4];
    self.topTitle5.frame = CGRectMake(towModel.fitX, towModel.fitY, towModel.fitW, towModel.fitH);
    [self.topTitle5 sd_setImageWithURL:[NSURL URLWithString:towModel.img] forState:UIControlStateNormal];
    
    towModel = modelArray[3];
    self.topImage4.frame = CGRectMake(towModel.fitX, towModel.fitY, towModel.fitW, towModel.fitH);
    [self.topImage4 sd_setImageWithURL:[NSURL URLWithString:towModel.img] forState:UIControlStateNormal];
    
    towModel = modelArray[2];
    self.midLeft3.frame = CGRectMake(towModel.fitX, towModel.fitY, towModel.fitW, towModel.fitH);
    [self.midLeft3 sd_setImageWithURL:[NSURL URLWithString:towModel.img] forState:UIControlStateNormal];
    
    towModel = modelArray[1];
    self.midRight2.frame = CGRectMake(towModel.fitX, towModel.fitY, towModel.fitW, towModel.fitH);
    [self.midRight2 sd_setImageWithURL:[NSURL URLWithString:towModel.img] forState:UIControlStateNormal];
    
    towModel = modelArray[0];
    self.bottomImage1.frame = CGRectMake(towModel.fitX, towModel.fitY, towModel.fitW, towModel.fitH);
    [self.bottomImage1 sd_setImageWithURL:[NSURL URLWithString:towModel.img] forState:UIControlStateNormal];
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
