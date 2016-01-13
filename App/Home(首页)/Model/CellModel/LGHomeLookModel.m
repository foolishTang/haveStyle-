//
//  LGHomeLookModel.m
//  有范吗?
//
//  Created by 唐磊guang on 15/12/30.
//  Copyright (c) 2015年 唐磊guang. All rights reserved.
//

#import "LGHomeLookModel.h"
#import <UIKit/UIKit.h>

@implementation LGHomeLookModel

-(void)setWidth:(int)width
{
    
    _width = width;
    
     self.fitW= width/750.0f*ScreenW;
}
-(void)setHeight:(int)height
{
    _height = height;
    self.fitH = height/1334.0f*ScreenH;
}
@end
