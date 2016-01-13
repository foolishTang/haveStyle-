//
//  MoreStructNewVipCell.m
//  有范吗?
//
//  Created by 唐磊guang on 16/1/9.
//  Copyright (c) 2016年 唐磊guang. All rights reserved.
//

#import "MoreStructNewVipCell.h"
#import "TowHomeNewVip.h"

@interface MoreStructNewVipCell()

@property (weak , nonatomic)UIImageView *backImage;

@end

@implementation MoreStructNewVipCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        UIImageView *imageV = [[UIImageView alloc]init];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClick)];
        [imageV addGestureRecognizer:tap];
        self.backImage = imageV;
        [self.contentView addSubview:imageV];
    }
    return self;
}

-(void)setModel:(TowHomeNewVip *)model
{
    _model = model;
    NewConfig *newConfig = model.config[0];
    self.backImage.frame = CGRectMake(0, 0, newConfig.fitW, newConfig.fitH);
    [self.backImage sd_setImageWithURL:[NSURL URLWithString:newConfig.img]];
}
-(void)tapClick
{
    NewConfig *newConfig = [self.model.config firstObject];
    self.block(newConfig.url);
}
@end
