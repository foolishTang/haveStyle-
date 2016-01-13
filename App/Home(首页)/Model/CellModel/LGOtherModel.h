//
//  LGOtherModel.h
//  有范吗?
//
//  Created by 唐磊guang on 15/12/31.
//  Copyright (c) 2015年 唐磊guang. All rights reserved.
//

#import "LGBaseModel.h"

@interface LGOtherModel : LGBaseModel
/**"big_img" = "http://metersbonwe.qiniucdn.com/nanzhuangda8_8.jpg";*/
@property (nonatomic ,copy)NSString *big_img;
/**"fixed_id" = 2;*/
@property (assign , nonatomic)int fixed_id;

/**info = "\U6e29\U6696\U6709\U578b";*/
@property (nonatomic ,copy)NSString *info;
/**name = "\U5f00\U886b\U6bdb\U8863";*/
@property (nonatomic ,copy)NSString *name;
/**"small_img" = "http://metersbonwe.qiniucdn.com/nanzhuang8_8.jpg";*/
@property (nonatomic ,copy)NSString *small_img;
/**"temp_id" = 8;*/
@property (assign , nonatomic)int temp_id;
@end
