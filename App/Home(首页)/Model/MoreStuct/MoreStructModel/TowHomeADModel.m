//
//  TowHomeADModel.m
//  有范吗?
//
//  Created by 唐磊guang on 16/1/8.
//  Copyright (c) 2016年 唐磊guang. All rights reserved.
//1

#import "TowHomeADModel.h"

@implementation TowHomeADModel


+ (NSDictionary *)mj_objectClassInArray
{
    return @{@"config":[ADConfig class]};
}

+(NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{@"ID":@"id"};
}
@end
@implementation ADConfig

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


