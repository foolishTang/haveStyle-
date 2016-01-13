//
//  LGFavoTableViewCell.m
//  有范吗?
//
//  Created by 唐磊guang on 16/1/13.
//  Copyright (c) 2016年 唐磊guang. All rights reserved.
//

#import "LGFavoTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "LGHomePayModel.h"
#define marcon 2
#define marconLabelWithImage 10
@interface LGFavoTableViewCell()

@property (weak , nonatomic)UIImageView *iconView;
@property (weak , nonatomic)UILabel *name;
@property (weak , nonatomic)UILabel *price;

@property (weak , nonatomic)UILabel *numbers;
@property (weak , nonatomic)UIButton *button;

@end
@implementation LGFavoTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createUI];
    }
    return self;
}

-(void)createUI
{
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(marcon, marcon, 40, 40)];
    [self.contentView addSubview:imageView];
    self.iconView = imageView;
    

    
    
    
    UILabel *nameLabel = [[UILabel alloc]init];
    nameLabel.frame = CGRectMake(130, marcon, 200, 20);
    nameLabel.font = [UIFont systemFontOfSize:13];
    self.name = nameLabel;
    [self.contentView addSubview:nameLabel];
    
    UILabel *price = [[UILabel alloc]init];
    price.frame = CGRectMake(230, marcon+60, 200, 20);
    price.font = [UIFont systemFontOfSize:13];
    self.price = price;
    [self.contentView addSubview:price];
    
    UILabel *number = [[UILabel alloc]init];
    number.backgroundColor = [UIColor redColor];
    number.font = [UIFont systemFontOfSize:13];
    self.numbers = number;
    [self.contentView addSubview:number];
    
        self.numbers.frame = CGRectMake(230, 40, 30, 15);
    
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(260, 40, 20, 20)];
    button.layer.cornerRadius = 10;
    if (self.selected) {
        button.backgroundColor = [UIColor redColor];
    }else{
    button.backgroundColor = [UIColor lightGrayColor];
    }
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:button];
    self.button = button;
//        self.numbers.centerX = self.width-30;
//        self.numbers.centerY = self.centerY;
    
}

-(void)buttonClick:(UIButton *)button
{
    button.selected = !button.selected;
    if (button.selected) {
        button.backgroundColor = [UIColor redColor];
    }else{
        button.backgroundColor = [UIColor lightGrayColor];
    }
}

-(void)setModel:(Clsinfo *)model
{
    if ([model.mainImage isKindOfClass:[NSNull class]]) {
        return;
    }
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:model.mainImage]];
    self.name.text = model.name;
    self.price.text = model.sale_price;
    self.numbers.text = [NSString stringWithFormat:@"%d",(int)model.number];
}

-(void)setLGSelect:(BOOL)LGSelect
{
    _LGSelect = LGSelect;
    if (LGSelect) {
        self.button.backgroundColor = [UIColor redColor];
    }else{
        self.button.backgroundColor = [UIColor lightGrayColor];
    }
}

//-(void)layoutSubviews
//{
//    [super layoutSubviews];
//    self.numbers.frame = CGRectMake(0, 0, 50, 15);
//    self.numbers.centerX = self.width-30;
//    self.numbers.centerY = self.centerY;
//}

@end
