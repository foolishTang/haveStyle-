//
//  LGHaveStyleTool.h
//  有范吗?
//
//  Created by 唐磊guang on 15/12/30.
//  Copyright (c) 2015年 唐磊guang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LGHTTPTool.h"

@class TowHomeADModel,TowHomeNewVip;
@interface LGHaveStyleTool : NSObject

+(void)haveStyleGet:(NSString *)urlString success:(void(^)(NSArray *allModelArray))success wrong:(void(^)(NSError *error))wrong;



@end
