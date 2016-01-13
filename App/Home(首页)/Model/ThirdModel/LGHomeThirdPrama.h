//
//  LGHomeThirdPrama.h
//  有范吗?
//
//  Created by 千锋 on 16/1/6.
//  Copyright (c) 2016年 唐磊guang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LGHomeThirdPrama : NSObject

/**	就是othermodel的code*/
@property (nonatomic , copy)NSString *IDS;
/**	1*/
@property (nonatomic , copy)NSString *_platform;
/**	54d4e3ca-c7d8-d8c6-7bec-2ccde21cb1d2*/
@property (nonatomic , copy)NSString *loginUserId;

/**	d5abe0bd3a3a75e498da4127270c772b*/
@property (nonatomic , copy)NSString *token;

+(LGHomeThirdPrama *)prama;

@end
