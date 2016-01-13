//
//  TowHomeIntervalModel.h
//  有范吗?
//
//  Created by 唐磊guang on 16/1/8.
//  Copyright (c) 2016年 唐磊guang. All rights reserved.
//2,4,6,8,10

#import <Foundation/Foundation.h>

@class Config;
@interface TowHomeIntervalModel : NSObject


@property (nonatomic, strong) NSArray *config;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *type;


@end
@interface Config : NSObject

@property (nonatomic, copy) NSString *img_height;

@property (nonatomic, copy) NSString *img_width;

@property (assign , nonatomic)float fitW;
@property (assign , nonatomic)float fitH;

@end

