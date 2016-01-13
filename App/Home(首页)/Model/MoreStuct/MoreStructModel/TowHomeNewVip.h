//
//  TowHomeNewVip.h
//  有范吗?
//
//  Created by 唐磊guang on 16/1/9.
//  Copyright (c) 2016年 唐磊guang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NewConfig;
@interface TowHomeNewVip : NSObject

@property (nonatomic, strong) NSArray *config;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *type;

@end
@interface NewConfig : NSObject

@property (nonatomic, copy) NSString *ID;

@property (nonatomic, copy) NSString *index;

@property (nonatomic, copy) NSString *jump_id;

@property (nonatomic, copy) NSString *url;

@property (nonatomic, copy) NSString *img;

@property (nonatomic, copy) NSString *is_h5;

@property (nonatomic, copy) NSString *jump_type;

@property (nonatomic, copy) NSString *type;

@property (nonatomic, copy) NSString *share;

@property (nonatomic, copy) NSString *img_width;

@property (nonatomic, copy) NSString *end_time;

@property (nonatomic, copy) NSString *img_height;

@property (nonatomic, copy) NSString *tid;

@property (nonatomic, copy) NSString *name;

@property (assign , nonatomic)float fitW;
@property (assign , nonatomic)float fitH;

@end

