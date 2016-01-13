//
//  LGHTTPTool.m
//  有范吗?
//
//  Created by 唐磊guang on 15/12/30.
//  Copyright (c) 2015年 唐磊guang. All rights reserved.
//

#import "LGHTTPTool.h"
#import "AFNetworking.h"
@implementation LGHTTPTool


+(void)get:(NSString *)urlString succese:(void(^)(id result))success error:(void(^)(NSError *error))Lerror
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        success(responseObject);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        Lerror(error);
    }];
    
    
}

+(void)post:(NSString *)urlString prama:(NSDictionary *)param succese:(void (^)(id))success error:(void (^)(NSError *))Lerror
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager POST:urlString parameters:param success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        success(responseObject);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        Lerror(error);
    }];
}



@end
