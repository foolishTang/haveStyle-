

//
//  LGPayTVFooterCell.m
//  有范吗?
//
//  Created by 唐磊guang on 16/1/8.
//  Copyright (c) 2016年 唐磊guang. All rights reserved.
//

#import "LGPayTVFooterCell.h"

@implementation LGPayTVFooterCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, ScreenW, 49)];
        [self.contentView addSubview:label];
        label.text = @"你在用力,我就跳了";
        label.textColor = [UIColor darkGrayColor];
        label.backgroundColor = [UIColor lightGrayColor];
        label.textAlignment = NSTextAlignmentCenter;
    }
    return self;
}

@end
