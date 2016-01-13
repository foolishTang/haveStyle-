//
//  LGCommunityHttpToll.m
//  有范吗?
//
//  Created by 千锋 on 16/1/6.
//  Copyright (c) 2016年 唐磊guang. All rights reserved.
//

#import "LGCommunityHttpToll.h"
#import "LGHTTPTool.h"
#import "MJExtension.h"
#import "LGCommunityCombineModel.h"
@implementation LGCommunityHttpToll

+(void)communityGet:(NSString *)urlString success:(void (^)(NSArray *))success wrong:(void (^)(NSError *))wrong
{
    [LGHTTPTool get:urlString succese:^(id responseObject)
     {
         NSLog(@"%@",responseObject);
         
         NSArray *combineDicArr = responseObject[@"data"];
         
         NSArray *combineModelArr = [LGCommunityCombineModel mj_objectArrayWithKeyValuesArray:combineDicArr];
         
         success(combineModelArr);
         
     } error:^(NSError *error)
     {
         wrong(error);
     }];
}


@end
