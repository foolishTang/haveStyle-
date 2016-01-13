//
//  LGPayPostCell.m
//  有范吗?
//
//  Created by 唐磊guang on 16/1/8.
//  Copyright (c) 2016年 唐磊guang. All rights reserved.
//

#import "LGPayPostCell.h"
#import "LGHomePayModel.h"
#import "UIImageView+WebCache.h"
@interface LGPayPostCell()

@property (weak, nonatomic) IBOutlet UIImageView *postImage;
@property (weak, nonatomic) IBOutlet UILabel *infoLabel;


@end

@implementation LGPayPostCell

- (void)awakeFromNib {
    // Initialization code
    
}

-(void)setModel:(Activity *)model
{
    _model = model;
    [self.postImage sd_setImageWithURL:[NSURL URLWithString:model.url]];
    self.infoLabel.text = model.name;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    

    // Configure the view for the selected state
}

@end
