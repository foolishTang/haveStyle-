//
//  LGHomePayModel.m
//  有范吗?
//
//  Created by 千锋 on 16/1/7.
//  Copyright (c) 2016年 唐磊guang. All rights reserved.
//

#import "LGHomePayModel.h"
#import "MJExtension.h"
@implementation LGHomePayModel


+ (NSDictionary *)mj_objectClassInArray{
    return @{@"specList" : [Speclist class], @"activity" : [Activity class], @"colorList" : [Colorlist class], @"proPicUrl" : [Propicurl class], @"clsPicUrl" : [Clspicurl class]};
}

@end
@implementation Clsinfo

+(NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{@"desc":@"description"};
}

-(void)setPrice:(NSString *)price
{
    NSRange range = [price rangeOfString:@"."];
    NSString *str = [price substringToIndex:range.location];
    _price = [NSString stringWithFormat:@"¥%@",str];
}
-(void)setSale_price:(NSString *)sale_price
{
    if ([sale_price isKindOfClass:[NSNull class]]) {
        return;
    }
    NSRange range = [sale_price rangeOfString:@"."];
    if (range.location == NSNotFound) {
        _sale_price = sale_price;
        return;
    }
    NSString *str = [sale_price substringToIndex:range.location];
    _sale_price = [NSString stringWithFormat:@"¥%@",str];
}



@end


@implementation Commoncounttotal




@end


@implementation Speclist

@end


@implementation Activity

@end


@implementation Colorlist

@end


@implementation Propicurl

@end


@implementation Clspicurl

@end


