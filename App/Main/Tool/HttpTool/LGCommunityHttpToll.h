//
//  LGCommunityHttpToll.h
//  有范吗?
//
//  Created by 千锋 on 16/1/6.
//  Copyright (c) 2016年 唐磊guang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LGCommunityHttpToll : NSObject

+(void)communityGet:(NSString *)urlString success:(void(^)(NSArray *combineArr))success wrong:(void(^)(NSError *error))wrong;

@end
