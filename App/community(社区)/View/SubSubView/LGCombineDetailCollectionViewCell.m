//
//  LGCombineDetailCollectionViewCell.m
//  有范吗?
//
//  Created by 千锋 on 16/1/6.
//  Copyright (c) 2016年 唐磊guang. All rights reserved.
//

#import "LGCombineDetailCollectionViewCell.h"
#import "UIImageView+WebCache.h"
#import "LGCommunityCombineModel.h"
@interface LGCombineDetailCollectionViewCell()

@property (weak , nonatomic)UIImageView *imageView;

@end
@implementation LGCombineDetailCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = LGRandomColor;
        UIImageView *imageView = [[UIImageView alloc]init];
        self.imageView = imageView;
        [self.contentView addSubview:imageView];
        
    }
    return self;
}

-(void)setModel:(LGCommunityCombineModel *)model
{
    _model = model;
    self.imageView.frame = self.contentView.bounds;
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:model.img]];
}

@end
