//
//  LGXMPPInfoManagerModel.m
//  有范吗?
//
//  Created by 唐磊guang on 16/1/11.
//  Copyright (c) 2016年 唐磊guang. All rights reserved.
//

#import "LGXMPPInfoManagerModel.h"

@implementation LGXMPPInfoManagerModel


-(NSMutableArray *)info
{
    if (!_info) {
        _info = [NSMutableArray array];
    }
    return _info;
}


@end
