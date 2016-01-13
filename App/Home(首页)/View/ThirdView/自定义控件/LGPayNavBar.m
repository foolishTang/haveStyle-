
//
//  LGPayNavBar.m
//  有范吗?
//
//  Created by 唐磊guang on 16/1/8.
//  Copyright (c) 2016年 唐磊guang. All rights reserved.
//

#import "LGPayNavBar.h"

@implementation LGPayNavBar

-(instancetype)init
{
    if (self = [super init]) {
        self.backgroundColor = [UIColor blackColor];
    }
    return self;
}

//- (void)drawRect:(CGRect)rect {
//    [super drawRect:rect];
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    [self drawLine:context];
//    //[self drawEllipse:context];
//}
//-(void)drawLine:(CGContextRef)context
//{
//    CGColorSpaceRef space = CGColorSpaceCreateDeviceRGB();
//    
//    CGFloat components[8] = {106/256.0f,106/256.0f,106/256.0f,1.0,0.96f,0.96f,0.96f,0.0f};
//    
//    //调整渐变线在渐变区域内的位置 0.3f
//    CGFloat locations[2] = {0,0.4f};
//    
//    
//    CGGradientRef gradient = CGGradientCreateWithColorComponents(space,components, locations, 2);
//    
////    CGFloat w = self.bounds.size.width/3;
////    
////    CGFloat h = self.bounds.size.height/3;
//    //裁剪
////    const CGRect rects[4] = {CGRectMake(w*1, 0, w, h),CGRectMake(0, 1*h, w, h),CGRectMake(w*2, 1*h, w, h),CGRectMake(w*1, 2*h, w, h)};
////    CGContextClipToRects(context,rects, 4);
//    
//    
//    CGContextDrawLinearGradient(context, gradient, CGPointMake(ScreenW/2, 0), CGPointMake(ScreenW/2, self.height), kCGGradientDrawsAfterEndLocation);
//    CGColorSpaceRelease(space);
//    CGGradientRelease(gradient);
//}

@end
