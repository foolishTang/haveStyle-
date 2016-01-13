//
//  LGHomePayHttpTool.h
//  有范吗?
//
//  Created by 千锋 on 16/1/6.
//  Copyright (c) 2016年 唐磊guang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LGHomeThirdPrama,LGHomePayModel;
@interface LGHomePayHttpTool : NSObject

+(void)homePayPost:(NSString *)urlString param:(LGHomeThirdPrama *)paramas success:(void(^)(LGHomePayModel *model))success wrong:(void(^)(NSError *error))wrong;

@end
