//
//  LGHTTPTool.h
//  有范吗?
//
//  Created by 唐磊guang on 15/12/30.
//  Copyright (c) 2015年 唐磊guang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LGHTTPTool : NSObject

+(void)get:(NSString *)urlString succese:(void(^)(id result))success error:(void(^)(NSError *error))error;

+(void)post:(NSString *)urlString prama:(NSDictionary *)param succese:(void(^)(id result))success error:(void(^)(NSError *error))error;


@end
