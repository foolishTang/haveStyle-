//
//  LGTitleButton.m
//  有范吗?
//
//  Created by 唐磊guang on 16/1/4.
//  Copyright (c) 2016年 唐磊guang. All rights reserved.
//

#import "LGTitleButton.h"

@implementation LGTitleButton

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self.titleLabel setBackgroundColor:[UIColor darkGrayColor]];
        self.titleLabel.alpha = 0.6;
        self.titleLabel.font = [UIFont systemFontOfSize:9];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return self;
}

-(CGRect)imageRectForContentRect:(CGRect)contentRect
{
    return self.bounds;
}
-(CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat x = 0;
    CGFloat h = 20;
    CGFloat y = self.height-20;
    CGFloat w = self.width;
    return CGRectMake(x,y ,w , h);
}
@end
