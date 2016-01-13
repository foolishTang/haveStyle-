//
//  LGADCollectionViewCell.m
//  有范吗?
//
//  Created by 唐磊guang on 16/1/6.
//  Copyright (c) 2016年 唐磊guang. All rights reserved.
//

#import "LGADCollectionViewCell.h"
#import "TowHomeADModel.h"
#import "UIButton+WebCache.h"
@interface LGADCollectionViewCell()

@property (weak , nonatomic)UIButton *button;

@end

@implementation LGADCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        UIButton *button = [[UIButton alloc]init];
        button.userInteractionEnabled = NO;
        button.adjustsImageWhenHighlighted = NO;
        [self.contentView addSubview:button];
        button.frame = self.bounds;
        self.contentView.clipsToBounds = YES;
        self.button = button;
    }
    return self;
}
-(void)setModel:(ADConfig *)model
{
    _model = model;
    [self.button sd_setBackgroundImageWithURL:[NSURL URLWithString:model.img] forState:UIControlStateNormal];
}
@end
