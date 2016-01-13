//
//  testModel.m
//  有范吗?
//
//  Created by 唐磊guang on 16/1/9.
//  Copyright (c) 2016年 唐磊guang. All rights reserved.
//

#import "testModel.h"

@implementation testModel

+ (NSDictionary *)mj_objectClassInArray
{
    return @{@"config":[TestConfig class]};
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
@implementation TestConfig

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


@implementation TestJump

+(NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{@"ID":@"id"};
}

@end


