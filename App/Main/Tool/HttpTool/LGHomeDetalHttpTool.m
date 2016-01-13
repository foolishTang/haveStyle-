//
//  LGHomeDetalHttpTool.m
//  有范吗?
//
//  Created by 唐磊guang on 16/1/4.
//  Copyright (c) 2016年 唐磊guang. All rights reserved.
//

#import "LGHomeDetalHttpTool.h"
#import "LGHomeDetailTopModel.h"
#import "LGHomeDetailOtherModel.h"
#import "MJExtension.h"
@implementation LGHomeDetalHttpTool
+(void)homeDetailGet:(NSString *)urlString success:(void (^)(LGHomeDetailTopModel *))success wrong:(void (^)(NSError *))wrong
{
    
    [LGHTTPTool get:urlString succese:^(id responseObject)
     {
         NSDictionary *dic = responseObject[@"data"];
         [LGHomeDetailMidModel mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
             return @{@"ID":@"id"};
         }];
         
//         [LGHomeDetailMidModel mj_setupReplacedKeyFromPropertyName121:^NSString *(NSString *propertyName) {
//            
//         }];
         LGHomeDetailTopModel *model = [LGHomeDetailTopModel mj_objectWithKeyValues:dic];
         success(model);
         
         
         
     } error:^(NSError *error)
     {
         wrong(error);
     }];
}

+(void)homeDetailOtherGet:(NSString *)urlString success:(void (^)(NSArray *))success wrong:(void (^)(NSError *))wrong
{
    [LGHTTPTool get:urlString succese:^(id responseObject)
     {
         NSArray *array =responseObject[@"data"];
         
         NSArray *modelArray = [LGHomeDetailOtherModel mj_objectArrayWithKeyValuesArray:array];
         success(modelArray);
     } error:^(NSError *error)
     {
         wrong(error);
     }];
}
@end
