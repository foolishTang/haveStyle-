//
//  LGHomeDetalHttpTool.h
//  有范吗?
//
//  Created by 唐磊guang on 16/1/4.
//  Copyright (c) 2016年 唐磊guang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LGHTTPTool.h"
@class LGHomeDetailTopModel;
@interface LGHomeDetalHttpTool : NSObject


+(void)homeDetailGet:(NSString *)urlString success:(void(^)(LGHomeDetailTopModel *model))success wrong:(void(^)(NSError *error))wrong;

+(void)homeDetailOtherGet:(NSString *)urlString success:(void(^)(NSArray *modelArray))success wrong:(void(^)(NSError *error))wrong;


@end
