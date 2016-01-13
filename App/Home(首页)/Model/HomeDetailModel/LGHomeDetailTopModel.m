//
//  LGHomeDetailTopModel.m
//  有范吗?
//
//  Created by 唐磊guang on 16/1/4.
//  Copyright (c) 2016年 唐磊guang. All rights reserved.
//

#import "LGHomeDetailTopModel.h"
#import "MJExtension.h"
@implementation LGHomeDetailTopModel

+(NSDictionary *)mj_objectClassInArray
{
    return @{@"middle":[LGHomeDetailMidModel class]};
}

@end
