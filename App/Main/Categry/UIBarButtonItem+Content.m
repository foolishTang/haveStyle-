//
//  UIBarButtonItem+Content.m
//  学习微博
//
//  Created by 唐磊guang on 15/12/19.
//  Copyright (c) 2015年 唐磊guang. All rights reserved.
//

#import "UIBarButtonItem+Content.h"
#import "UIImage+Content.h"
#import "UIView+Extension.h"
@implementation UIBarButtonItem (Content)

+(UIBarButtonItem *)ItemWithNomalName:(NSString *)nomal andSelected:(NSString *)selected Target:(id)target action:(SEL)action
{
    UIButton *button = [[UIButton alloc]init];
    [button setBackgroundImage:[UIImage imageWithName:nomal] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageWithName:selected] forState:UIControlStateHighlighted];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    button.size = button.currentBackgroundImage.size;
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:button];
    return item;
}


@end
