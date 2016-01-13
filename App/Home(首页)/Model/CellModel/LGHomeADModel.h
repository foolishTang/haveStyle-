//
//  LGHomeADModel.h
//  有范吗?
//
//  Created by 唐磊guang on 15/12/30.
//  Copyright (c) 2015年 唐磊guang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LGHomeADModel : NSObject

/**"" = "2016-12-31 18:59:39";*/
@property (copy , nonatomic)NSString *end_time;

/** = "http://7xjir4.com2.z0.glb.qiniucdn.com/FqU9gCmWBawe8HYQFQUAdKr00qFy";*/
@property (copy , nonatomic)NSString *img;
/**"" = 344;*/
@property (copy , nonatomic)NSString *img_height;
/**"" = 750;*/
@property (copy , nonatomic)NSString *img_width;
/** = 0;*/
@property (copy , nonatomic)NSString *index;
/**"" = 1;*/
@property (copy , nonatomic)NSString *is_h5;
/**"" = 1453;*/
@property (copy , nonatomic)NSString *jump_id;
/**"" = 6;*/
@property (copy , nonatomic)NSString *jump_type;
/** = "\U8de8\U5e74\U7115\U65b0\U5b63 \U8303\U7968\U9884\U9886";*/
@property (copy , nonatomic)NSString *name;
/** = 0;*/
@property (copy , nonatomic)NSString *share;
/** = 0;*/
@property (copy , nonatomic)NSString *tid;
/** = 1021;*/
@property (copy , nonatomic)NSString *type;
/** = "http://m.funwear.com/wx/?p=3219&a=";*/
@property (copy , nonatomic)NSString *url;

@end
