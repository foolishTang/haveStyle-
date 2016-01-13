//
//  LGCommunityLineButton.m
//  有范吗?
//
//  Created by 千锋 on 16/1/6.
//  Copyright (c) 2016年 唐磊guang. All rights reserved.
//

#import "LGCommunityLineButton.h"

@implementation LGCommunityLineButton

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIView *view = [[UIView alloc]init];
        view.hidden = YES;
        view.backgroundColor = [UIColor yellowColor];
        self.lineView = view;
        [self addSubview:view];
        self.titleLabel.font = [UIFont systemFontOfSize:13];
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    self.lineView.frame = CGRectMake(10, self.height-1, self.width-20, 1);
}

-(void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
    if (selected)
    {
        self.lineView.hidden = NO;
        
    }
    else
    {
        self.lineView.hidden = YES;
    }
}


@end
