//
//  MoreStructBrandCell.m
//  有范吗?
//
//  Created by 唐磊guang on 16/1/9.
//  Copyright (c) 2016年 唐磊guang. All rights reserved.
//

#import "MoreStructBrandCell.h"
#import "TowHomeHSBrandModel.h"

#import "testModel.h"
@interface MoreStructBrandCell()

@property (weak , nonatomic)UIButton *leftUp4;
@property (weak , nonatomic)UIButton *leftDown1;
@property (weak , nonatomic)UIButton *rightUp3;
@property (weak , nonatomic)UIButton *rightDown2;

@end

@implementation MoreStructBrandCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.leftUp4 = [self createButtonWithTag:4];
        self.leftDown1 = [self createButtonWithTag:1];
        self.rightDown2  = [self createButtonWithTag:2];
        self.rightUp3 = [self createButtonWithTag:3];
    }
    return self;
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


-(void)setModel:(testModel *)model
{
    _model = model;

    NSArray *modelArray = model.config;
    
    TowConfig *towModel = modelArray[3];
    self.leftUp4.frame = CGRectMake(towModel.fitX, towModel.fitY, towModel.fitW, towModel.fitH);
    [self.leftUp4 sd_setImageWithURL:[NSURL URLWithString:towModel.img] forState:UIControlStateNormal];
    
    towModel = modelArray[0];
    self.leftDown1.frame = CGRectMake(towModel.fitX, towModel.fitY, towModel.fitW, towModel.fitH);
    [self.leftDown1 sd_setImageWithURL:[NSURL URLWithString:towModel.img] forState:UIControlStateNormal];
    
    towModel = modelArray[1];
    self.rightDown2.frame = CGRectMake(towModel.fitX, towModel.fitY, towModel.fitW, towModel.fitH);
    [self.rightDown2 sd_setImageWithURL:[NSURL URLWithString:towModel.img] forState:UIControlStateNormal];
    
    towModel = modelArray[2];
    self.rightUp3.frame = CGRectMake(towModel.fitX, towModel.fitY, towModel.fitW, towModel.fitH);
    [self.rightUp3 sd_setImageWithURL:[NSURL URLWithString:towModel.img] forState:UIControlStateNormal];
}


@end
