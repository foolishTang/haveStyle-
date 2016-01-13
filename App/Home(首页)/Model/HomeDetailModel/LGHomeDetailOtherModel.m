//
//  LGHomeDetailOtherModel.m
//  有范吗?
//
//  Created by 唐磊guang on 16/1/4.
//  Copyright (c) 2016年 唐磊guang. All rights reserved.
//

#import "LGHomeDetailOtherModel.h"
#import "MJExtension.h"
#import "LGHomeDetailBrandModel.h"
@implementation LGHomeDetailOtherModel

+(NSDictionary *)mj_objectClassInArray
{
    return @{@"brandArr":[LGHomeDetailBrandModel class]};
}


@end
