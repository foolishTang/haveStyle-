//
//  LGClassifyPostModel.m
//  有范吗?
//
//  Created by 唐磊guang on 16/1/12.
//  Copyright (c) 2016年 唐磊guang. All rights reserved.
//

#import "LGClassifyPostModel.h"

@implementation LGClassifyPostModel
+(LGClassifyPostModel *)prama
{
    LGClassifyPostModel *model = [[self alloc]init];
    model._platform = @"1";
    model.loginUserId = @"54d4e3ca-c7d8-d8c6-7bec-2ccde21cb1d2";
    model.token = @"d5abe0bd3a3a75e498da4127270c772b";
    return model;
}
@end
