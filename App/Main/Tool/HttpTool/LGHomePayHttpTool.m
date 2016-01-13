//
//  LGHomePayHttpTool.m
//  有范吗?
//
//  Created by 千锋 on 16/1/6.
//  Copyright (c) 2016年 唐磊guang. All rights reserved.
//

#import "LGHomePayHttpTool.h"
#import "LGHTTPTool.h"
#import "MJExtension.h"
#import "LGHomeThirdPrama.h"
#import "LGHomePayModel.h"
@implementation LGHomePayHttpTool

+(void)homePayPost:(NSString *)urlString param:(LGHomeThirdPrama *)paramas success:(void (^)(LGHomePayModel *))success wrong:(void (^)(NSError *))wrong
{
    NSDictionary *param = paramas.mj_keyValues;
    
    
    [LGHTTPTool post:urlString prama:param succese:^(id result)
    {
        NSArray *allArr = result[@"results"];
        NSDictionary *allDic = [allArr firstObject];
        
        
        LGHomePayModel *model = [LGHomePayModel mj_objectWithKeyValues:allDic];
        
        success(model);
        
    } error:^(NSError *error) {
        NSLog(@"%@",error);
    }];
}

-(NSString*)dicToJson:(NSDictionary *)dic

{
    
    NSError *parseError = nil;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&parseError];
    
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
}


@end


