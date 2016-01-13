//
//  LGBaseModel.m
//  有范吗?
//
//  Created by 唐磊guang on 15/12/31.
//  Copyright (c) 2015年 唐磊guang. All rights reserved.
//

#import "LGBaseModel.h"

@implementation LGBaseModel

-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString: @"id"]) {
        return;
    }
}

@end
