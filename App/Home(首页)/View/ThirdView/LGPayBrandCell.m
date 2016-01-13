//
//  LGPayBrandCell.m
//  有范吗?
//
//  Created by 唐磊guang on 16/1/8.
//  Copyright (c) 2016年 唐磊guang. All rights reserved.
//

#import "LGPayBrandCell.h"
#import "LGHomePayModel.h"
#import "UIImageView+WebCache.h"
@interface LGPayBrandCell()

@property (weak, nonatomic) IBOutlet UIImageView *brandImage;
@property (weak, nonatomic) IBOutlet UILabel *brandLabel;

@end


@implementation LGPayBrandCell

- (void)awakeFromNib {
    // Initialization code
    self.brandImage.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.brandImage.layer.borderWidth = 0.5;
}

-(void)setModel:(Clsinfo *)model
{
    [self.brandImage sd_setImageWithURL:[NSURL URLWithString:model.brandUrl]];
    self.brandLabel.text = model.brand;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
