//
//  LGOtherButton.m
//  有范吗?
//
//  Created by 唐磊guang on 16/1/3.
//  Copyright (c) 2016年 唐磊guang. All rights reserved.
//

#import "LGOtherButton.h"
#import "UIView+Extension.h"
@implementation LGOtherButton

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        
        self.layer.borderColor = [UIColor grayColor].CGColor;
        self.layer.borderWidth = 0.5;
        UILabel *subLabel = [[UILabel alloc]init];
        subLabel.textColor = [UIColor grayColor];
        subLabel.font = [UIFont boldSystemFontOfSize:9];
        subLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:subLabel];
        self.subLabel = subLabel;
    }
    return self;
}

-(CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat y = self.height*0.33f;
    CGFloat w = self.width*2/3.0f;
    CGFloat h = self.height*3/5.0f;
    CGFloat x = self.width*1/6.0f;
    CGRect imageRect = CGRectMake(x,y ,w,h);
    //NSLog(@"imageRectForContentRect");
    return imageRect;
}

-(CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat y = 3;
    CGFloat w = self.width;
    CGFloat h = self.height*1/5.0f;
    CGFloat x = 0;
    CGRect rect = CGRectMake(x,y ,w,h);
    return rect;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    self.subLabel.frame = CGRectMake(0, self.height*1/5.0f-3, self.width, self.height*1/5.0f);
}
//-(void)setFrame:(CGRect)frame
//{
//    [super setFrame:frame];
////    CGRect titleRect = CGRectMake(0, 0, self.width, self.height/4);
////    [self titleRectForContentRect:titleRect];
////    
////    
////    [self imageRectForContentRect:imageRect];
//    //NSLog(@"setFrame");
//}
-(void)setTitle:(NSString *)title subTitle:(NSString *)subtitle
{
    
    [self setTitle:title forState:UIControlStateNormal];
    [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.titleLabel.font = [UIFont boldSystemFontOfSize:11];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    self.subLabel.text = subtitle;
    NSLog(@"%@",title);
}
@end
