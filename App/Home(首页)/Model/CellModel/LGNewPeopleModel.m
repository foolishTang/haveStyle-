//
//  LGNewPeopleModel.m
//  有范吗?
//
//  Created by 唐磊guang on 15/12/31.
//  Copyright (c) 2015年 唐磊guang. All rights reserved.
//

#import "LGNewPeopleModel.h"

@implementation LGNewPeopleModel
-(void)setImg_width:(int)img_width
{
    
    _img_width = img_width;
    self.fitW = img_width/750.0f*ScreenW;
}
-(void)setImg_height:(int)img_height
{
    _img_height = img_height;
    self.fitH = img_height/1334.0f*ScreenH;
}
@end
