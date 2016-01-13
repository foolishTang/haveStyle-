//
//  testModel.h
//  有范吗?
//
//  Created by 唐磊guang on 16/1/9.
//  Copyright (c) 2016年 唐磊guang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TestConfig,TestJump;
@interface testModel : NSObject


@property (nonatomic, strong) NSArray *config;

@property (nonatomic, copy) NSString *height;

@property (nonatomic, copy) NSString *info;

@property (nonatomic, copy) NSString *ID;

@property (nonatomic, copy) NSString *width;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, assign) NSInteger index;

@property (assign , nonatomic)float fitW;
@property (assign , nonatomic)float fitH;

@end
@interface TestConfig : NSObject

@property (nonatomic, copy) NSString *height;

@property (nonatomic, copy) NSString *img;

@property (nonatomic, copy) NSString *temp_id;

@property (nonatomic, copy) NSString *x;

@property (nonatomic, copy) NSString *y;

@property (nonatomic, copy) NSString *width;

@property (nonatomic, strong) TestJump *jump;

@property (nonatomic, copy) NSString *jump_id;

@property (assign , nonatomic)float fitW;
@property (assign , nonatomic)float fitH;
@property (assign , nonatomic)float fitX;
@property (assign , nonatomic)float fitY;

@end

@interface TestJump : NSObject

@property (nonatomic, copy) NSString *url;

@property (nonatomic, copy) NSString *is_h5;

@property (nonatomic, copy) NSString *jump_type;

@property (nonatomic, copy) NSString *ID;

@property (nonatomic, copy) NSString *share;

@property (nonatomic, copy) NSString *type;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *tid;

@end

