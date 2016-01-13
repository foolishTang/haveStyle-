//
//  LGCommunityCombineModel.m
//  有范吗?
//
//  Created by 千锋 on 16/1/6.
//  Copyright (c) 2016年 唐磊guang. All rights reserved.
//

#import "LGCommunityCombineModel.h"
#import "MJExtension.h"
@implementation LGCommunityCombineModel

+(NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{@"ID":@"id"};
}
-(void)setImg_width:(NSString *)img_width
{
    
    _img_width = img_width;
    
    self.fitW= [img_width floatValue]/750.0f*ScreenW;
}
-(void)setImg_height:(NSString *)img_height
{
    _img_height = img_height;
    
    self.fitH= [img_height floatValue]/750.0f*ScreenH;
}
@end
