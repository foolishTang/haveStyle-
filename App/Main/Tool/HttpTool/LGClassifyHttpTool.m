//
//  LGClassifyHttpTool.m
//  有范吗?
//
//  Created by 唐磊guang on 16/1/5.
//  Copyright (c) 2016年 唐磊guang. All rights reserved.
//

#import "LGClassifyHttpTool.h"
#import "LGHTTPTool.h"
#import "MJExtension.h"
#import "LGClassifyBrandModel.h"
#import "LGClassifyHotModel.h"
@implementation LGClassifyHttpTool

+(void)classifyGet:(NSString *)urlString success:(void (^)(NSArray *, NSArray *))success wrong:(void (^)(NSError *))wrong
{
    [LGHTTPTool get:urlString succese:^(id responseObject)
     {
         
         NSArray *array = responseObject[@"data"];
         
         
         NSDictionary *dic = array[1];
         NSArray *brandArr = dic[@"config"];
         NSArray *brandModelArr = [LGClassifyBrandModel mj_objectArrayWithKeyValuesArray:brandArr];
         
         NSDictionary *hotDic = array[3];
         NSArray *hotArr = hotDic[@"config"];
         NSArray *hotModelArr = [LGClassifyHotModel mj_objectArrayWithKeyValuesArray:hotArr];
         success(brandModelArr,hotModelArr);
         
         
     } error:^(NSError *error)
     {
         wrong(error);
     }];
}

@end
