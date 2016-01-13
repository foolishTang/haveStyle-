//
//  LGClassifyHttpTool.h
//  有范吗?
//
//  Created by 唐磊guang on 16/1/5.
//  Copyright (c) 2016年 唐磊guang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LGClassifyBrandModel;
@interface LGClassifyHttpTool : NSObject

+(void)classifyGet:(NSString *)urlString success:(void(^)(NSArray *brandArray,NSArray *hotArray))success wrong:(void(^)(NSError *error))wrong;

@end
