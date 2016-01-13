//
//  LGHomeDetailTopModel.h
//  有范吗?
//
//  Created by 唐磊guang on 16/1/4.
//  Copyright (c) 2016年 唐磊guang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LGHomeDetailMidModel.h"
@interface LGHomeDetailTopModel : NSObject
/** = 344;*/
@property (assign , nonatomic)float height;
/** = 3;*/
@property (assign , nonatomic)int ID;
/** = "http://metersbonwe.qiniucdn.com/20151230nvzhuangchangjing.jpg";*/
@property (copy , nonatomic)NSString *img;
/**info = "";*/
/**middle =*/
@property (strong , nonatomic)NSArray *middle;
@end
