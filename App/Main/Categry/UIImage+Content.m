//
//  UIImage+Content.m
//  学习微博
//
//  Created by 唐磊guang on 15/12/19.
//  Copyright (c) 2015年 唐磊guang. All rights reserved.
//

#import "UIImage+Content.h"
@implementation UIImage (Content)

+(UIImage *)imageWithName:(NSString *)name
{
    UIImage *image = nil;
    
    //判断是不是iOS87及以上版本，如果是加后缀
    if ([UIDevice currentDevice].systemVersion.floatValue>=7) {
        image = [UIImage imageNamed:[NSString stringWithFormat:@"%@_os7",name]];
    }
    if (image == nil) {
        image = [UIImage imageNamed:name];
    }
    return image;
}
+(UIImage *)resizedImage:(NSString *)name
{
    UIImage *image = [UIImage imageNamed:name];
    //从中心拉伸图片。
    return [image stretchableImageWithLeftCapWidth:image.size.width*0.5 topCapHeight:image.size.height*0.5];
//    UIEdgeInsets edge = {20,20,20,20};
//    return [image imageWithAlignmentRectInsets:edge];
}

+(CGSize)sizeToFitScreenWith:(NSString *)name
{
    UIImage *image = [UIImage imageNamed:name];
    CGFloat imageW = image.size.width/2;
    CGFloat imageH = image.size.height/2;
    CGSize fitSize = CGSizeMake(imageW, imageH);
    return fitSize;
}

@end
