//
//  TowHomeIntervalModel.m
//  有范吗?
//
//  Created by 唐磊guang on 16/1/8.
//  Copyright (c) 2016年 唐磊guang. All rights reserved.
//

#import "TowHomeIntervalModel.h"

@implementation TowHomeIntervalModel


+ (NSDictionary *)objectClassInArray{
    return @{@"config" : [Config class]};
}
@end
@implementation Config

-(void)setImg_width:(NSString *)img_width
{
    
    _img_width = img_width;
    
    self.fitW= [img_width floatValue]/750.0f*ScreenW;
}
-(void)setImg_height:(NSString *)img_height
{
    _img_height = img_height;
    self.fitH = [img_height floatValue]/1334.0f*ScreenH;
}


@end


