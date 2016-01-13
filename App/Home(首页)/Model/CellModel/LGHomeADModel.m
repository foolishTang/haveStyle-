//
//  LGHomeADModel.m
//  有范吗?
//
//  Created by 唐磊guang on 15/12/30.
//  Copyright (c) 2015年 唐磊guang. All rights reserved.
//

#import "LGHomeADModel.h"

@implementation LGHomeADModel

-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString: @"id"]) {
        return;
    }
}

@end
