//
//  TowHomeHSBrandModel.h
//  有范吗?
//
//  Created by 唐磊guang on 16/1/8.
//  Copyright (c) 2016年 唐磊guang. All rights reserved.
//1,3,5,7,9

#import <Foundation/Foundation.h>

@class ImageConfig,TowConfig,Jump;
@interface TowHomeHSBrandModel : NSObject


@property (nonatomic, strong) NSArray *config;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *type;

//+(ImageConfig *)configModel;

@end

@interface ImageConfig : NSObject

@property (nonatomic, strong) NSArray *towConfig;

@property (nonatomic, copy) NSString *height;

@property (nonatomic, copy) NSString *info;

@property (nonatomic, copy) NSString *ID;

@property (nonatomic, copy) NSString *width;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, assign) NSInteger index;

@property (assign , nonatomic)float fitW;
@property (assign , nonatomic)float fitH;

@end

@interface TowConfig : NSObject

@property (nonatomic, copy) NSString *height;

@property (nonatomic, copy) NSString *img;

@property (nonatomic, copy) NSString *temp_id;

@property (nonatomic, copy) NSString *x;

@property (nonatomic, copy) NSString *y;

@property (nonatomic, copy) NSString *width;

@property (nonatomic, strong) Jump *jump;

@property (nonatomic, copy) NSString *jump_id;

@property (assign , nonatomic)float fitW;
@property (assign , nonatomic)float fitH;
@property (assign , nonatomic)float fitX;
@property (assign , nonatomic)float fitY;

@end

@interface Jump : NSObject

@property (nonatomic, copy) NSString *url;

@property (nonatomic, copy) NSString *is_h5;

@property (nonatomic, copy) NSString *jump_type;

@property (nonatomic, copy) NSString *ID;

@property (nonatomic, copy) NSString *share;

@property (nonatomic, copy) NSString *type;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *tid;

@end

