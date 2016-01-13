//
//  LGClassifuSecondHttpTool.m
//  有范吗?
//
//  Created by 唐磊guang on 16/1/12.
//  Copyright (c) 2016年 唐磊guang. All rights reserved.
//

#import "LGClassifuSecondHttpTool.h"
#import "LGClassifySecondModel.h"
#import "LGHTTPTool.h"
#import "MJExtension.h"
@implementation LGClassifuSecondHttpTool

+(void)classifySecondPost:(NSString *)urlString param:(LGClassifyPostModel *)paramas success:(void (^)(NSArray *))success wrong:(void (^)(NSError *))wrong
{
//    NSDictionary *param = paramas.mj_keyValues;
    
    
    [LGHTTPTool post:urlString prama:nil succese:^(id result)
     {
        
         NSArray *dicArray = result[@"results"];
         NSMutableArray *modelArr = [NSMutableArray array];
         for (NSDictionary *dic in dicArray) {
             LGClassifySecondModel *model = [LGClassifySecondModel mj_objectWithKeyValues:dic];
             [modelArr addObject:model];
         }
//         NSArray *allArr = result[@"results"];
//         NSDictionary *allDic = [allArr firstObject];
//         
//         
//         LGHomePayModel *model = [LGHomePayModel mj_objectWithKeyValues:allDic];
         
         success(modelArr);
         
     } error:^(NSError *error) {
         NSLog(@"%@",error);
     }];
}

@end
