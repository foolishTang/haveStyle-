//
//  UIBarButtonItem+Content.h
//  学习微博
//
//  Created by 唐磊guang on 15/12/19.
//  Copyright (c) 2015年 唐磊guang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Content)

+(UIBarButtonItem *)ItemWithNomalName:(NSString *)nomal andSelected:(NSString *)selected Target:(id)target action:(SEL)action;

@end
