//
//  LGHomeDetailMainModle.m
//  有范吗?
//
//  Created by 唐磊guang on 16/1/4.
//  Copyright (c) 2016年 唐磊guang. All rights reserved.
//

#import "LGHomeDetailMainModle.h"

@implementation LGHomeDetailMainModle

-(void)setPrice:(NSString *)price
{
    NSRange range = [price rangeOfString:@"."];
    NSString *str = [price substringToIndex:range.location];
    _price = [NSString stringWithFormat:@"%@:%@",@"折前",str];
}
-(void)setSale_price:(NSString *)sale_price
{
    NSRange range = [sale_price rangeOfString:@"."];
    NSString *str = [sale_price substringToIndex:range.location];
    _sale_price = [NSString stringWithFormat:@"%@:%@",@"折后",str];
}

@end
