//
//  LGClassifuSecondHttpTool.h
//  有范吗?
//
//  Created by 唐磊guang on 16/1/12.
//  Copyright (c) 2016年 唐磊guang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LGClassifyPostModel.h"

@interface LGClassifuSecondHttpTool : NSObject

+(void)classifySecondPost:(NSString *)urlString param:(LGClassifyPostModel *)paramas success:(void(^)(NSArray *modelArray))success wrong:(void(^)(NSError *error))wrong;

@end
