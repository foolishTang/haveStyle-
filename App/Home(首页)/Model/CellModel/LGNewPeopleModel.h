//
//  LGNewPeopleModel.h
//  有范吗?
//
//  Created by 唐磊guang on 15/12/31.
//  Copyright (c) 2015年 唐磊guang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LGBaseModel.h"
@interface LGNewPeopleModel : LGBaseModel
/**"" = "2015-12-31 23:59:18";*/
@property (copy , nonatomic)NSString *end_time;
/**id = 453;*/
/** = "http://7xjir4.com2.z0.glb.qiniucdn.com/FptR9OREk7KgsvCtBygdRiRQn9bZ";*/
@property (copy , nonatomic)NSString *img;
/**"" = 230;*/
@property (assign , nonatomic)int img_height;
/**"" = 750;*/
@property (assign , nonatomic)int img_width;
/** = 0;*/
@property (assign , nonatomic)int index;
/**"" = 1;*/
@property (assign , nonatomic)int is_h5;
/**"" = 1329;*/
@property (assign , nonatomic)int jump_id;
/**"" = 6;*/
@property (assign , nonatomic)int jump_type;
/** = "\U6709\U8303\U65b0\U4eba\U4e13\U4eab";*/
@property (copy , nonatomic)NSString *name;
/** = 0;*/
@property (assign , nonatomic)int share;
/** = 0;*/
@property (assign , nonatomic)int tid;
/** = 100;*/
@property (assign , nonatomic)int type;
/** = "http://m.funwear.com/wx/?p=3105&a=";*/
@property (copy , nonatomic)NSString *url;
@end
