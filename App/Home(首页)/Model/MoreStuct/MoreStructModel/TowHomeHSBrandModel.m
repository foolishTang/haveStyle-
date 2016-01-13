//
//  TowHomeHSBrandModel.m
//  有范吗?
//
//  Created by 唐磊guang on 16/1/8.
//  Copyright (c) 2016年 唐磊guang. All rights reserved.
//

#import "TowHomeHSBrandModel.h"

@implementation TowHomeHSBrandModel


+ (NSDictionary *)mj_objectClassInArray{
    return @{@"config" : [ImageConfig class]};
}

//+(ImageConfig *)configModel
//{
//    self.config[0];
//   
//}

@end
@implementation ImageConfig

+ (NSDictionary *)mj_objectClassInArray{
    return @{@"towConfig" : [TowConfig class]};
}

+(NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{@"ID":@"id"};
}

-(void)setWidth:(NSString *)width
{
    
    _width = width;
    
    self.fitW= [width floatValue]/750.0f*ScreenW;
}
-(void)setHeight:(NSString *)height
{
    _height = height;
    self.fitH = [height floatValue]/1334.0f*ScreenH;
}

@end


@implementation TowConfig

-(void)setWidth:(NSString *)width
{
    
    _width = width;
    
    self.fitW= [width floatValue]/750.0f*ScreenW;
}
-(void)setHeight:(NSString *)height
{
    _height = height;
    self.fitH = [height floatValue]/1334.0f*ScreenH;
}

-(void)setX:(NSString *)x
{
    _x = x;
    self.fitX = [x floatValue]/750.0f*ScreenW;
}

-(void)setY:(NSString *)y
{
    _y = y;
    self.fitY = [y floatValue]/1334.0f*ScreenH;
}


@end


@implementation Jump

+(NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{@"ID":@"id"};
}



@end


