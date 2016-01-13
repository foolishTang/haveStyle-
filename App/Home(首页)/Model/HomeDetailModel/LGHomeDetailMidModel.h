//
//  LGHomeDetailMidModel.h
//  有范吗?
//
//  Created by 唐磊guang on 16/1/4.
//  Copyright (c) 2016年 唐磊guang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LGHomeDetailMidModel : NSObject

/**"" = "";*/
@property (nonatomic , copy)NSString *big_img;

/**"" = 3;*/
@property (nonatomic , assign)int fixed_id;
/**id = 41;*/

/** = 1;*/
@property (nonatomic , assign)int index;
/** = "\U6e29\U67d4\U8212\U9002";*/
@property (nonatomic , copy)NSString *info;
/** = "\U957f\U8896T\U6064";*/
@property (nonatomic , copy)NSString *name;
/**"" = "http://metersbonwe.qiniucdn.com/nvzhuang3_8.jpg";*/
@property (nonatomic , copy)NSString *small_img;
/**"" = 102,下面数据请求要用*/
@property (nonatomic , copy)NSString *temp_id;



@end
