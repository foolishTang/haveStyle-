//
//  LGHomeLookModel.h
//  有范吗?
//
//  Created by 唐磊guang on 15/12/30.
//  Copyright (c) 2015年 唐磊guang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LGHomeLookJumpModel.h"
#import "LGBaseModel.h"
@interface LGHomeLookModel : LGBaseModel


/** = "http://metersbonwe.qiniucdn.com/CS2015_12_29_05.jpg";*/
@property (copy , nonatomic)NSString *img;
/**jump =     {
   
};*/
@property (strong , nonatomic)LGHomeLookJumpModel *jump;
/**"" = 1393;*/
@property (assign , nonatomic)int jump_id;
/**"" = 461;*/
@property (assign , nonatomic)int temp_id;
/** = 351;*/
@property (assign , nonatomic)int width;
/** = 421;*/
@property (assign , nonatomic)int height;
/** = 0;*/
@property (assign , nonatomic)int x;
/** = 79;*/
@property (assign , nonatomic)int y;




@end
