//
//  LGHaveStyleTool.m
//  有范吗?
//
//  Created by 唐磊guang on 15/12/30.
//  Copyright (c) 2015年 唐磊guang. All rights reserved.
//

#import "LGHaveStyleTool.h"

#import "TowHomeADModel.h"
#import "TowHomeHSBrandModel.h"
#import "TowHomeIntervalModel.h"
#import "TowHomeNewVip.h"

#import "testModel.h"
@implementation LGHaveStyleTool

+(void)haveStyleGet:(NSString *)urlString success:(void (^)(NSArray *))success wrong:(void (^)(NSError *))wrong
{
    
    [LGHTTPTool get:urlString succese:^(id responseObject)
    {
        
        NSArray *dataArr = responseObject[@"data"];
        
       // NSLog(@"%@",dataArr);
        //滚动广告模型 0
        TowHomeADModel *ADModel = [TowHomeADModel mj_objectWithKeyValues:dataArr[0]];
        //图片混合模型数组
        //1,3,5,7,9
        NSMutableArray *allModelArray = [[NSMutableArray alloc]init];
        [allModelArray addObject:ADModel];
        //间隔模型数组
        //2,4,6,8,10
        
        //新人专享
        
        for (int i = 1; i <= dataArr.count-2;) {
            
            NSDictionary *modelDic = dataArr[i];
            NSArray *modelArr = modelDic[@"config"];
            NSDictionary *last = [modelArr firstObject];
            if (i==3)
            {
                TowHomeNewVip *new = [TowHomeNewVip mj_objectWithKeyValues:last];
                [allModelArray addObject:new];
                i+= 2;
                continue;
            }
            testModel *model = [testModel mj_objectWithKeyValues:last];
            [allModelArray addObject:model];
            i+=2;
        }

        success(allModelArray);
        
    } error:^(NSError *error)
    {
        wrong(error);
    }];
}

@end
