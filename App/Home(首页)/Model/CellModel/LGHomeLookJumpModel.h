//
//  LGHomeLookJumpModel.h
//  有范吗?
//
//  Created by 唐磊guang on 15/12/30.
//  Copyright (c) 2015年 唐磊guang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LGBaseModel.h"
@interface LGHomeLookJumpModel :LGBaseModel

/**"" = 1;*/
@property (assign , nonatomic)int is_h5;
/**"" = 6;*/
@property (assign , nonatomic)int jump_type;
/**name = "\U6700IN\U642d\U914d\Uff5c\U65b0\U5e74\U8840\U62fc\U5b63";*/
@property (copy , nonatomic)NSString *name;
/** = 0;*/
@property (assign , nonatomic)int share;
/** = 0;*/
@property (assign , nonatomic)int tid;
/** = 6;*/
@property (assign , nonatomic)int type;
/**url = "http://m.funwear.com/wx/?p=3271&a=";*/
@property (copy , nonatomic)NSString *url;
@end
