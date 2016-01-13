//
//  LGHomeDetailMainModle.h
//  有范吗?
//
//  Created by 唐磊guang on 16/1/4.
//  Copyright (c) 2016年 唐磊guang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LGHomeDetailMainModle : NSObject

/**"branD_ID" = 348;*/
@property (nonatomic , assign)int branD_ID;
/**brand = "";*/
/**brandUrl = "http://img8.ibanggo.com/sources/cms/brand_logo/dusty.png";*/
@property (nonatomic , copy)NSString *brandUrl;
/** = 816370;*/
@property (nonatomic , assign)int code;

/** = "http://img5.ibanggo.com/sources/images/bgpicupload/816370/816370_00.jpg";*/
@property (nonatomic , copy)NSString *mainImage;
/** = "2015-10-29 14:48:04";*/
@property (nonatomic , copy)NSString *marketTime;
/** = "\U7537\U6b3e\U8ff7\U5f69\U536b\U8863";*/
@property (nonatomic , copy)NSString *name;
/** = "549.000000";*/
@property (nonatomic , copy)NSString *price;
/**"proD_FLAG" = 0;*/
/**remark = "";*/
/**"" = "\U96f6\U552e";*/
@property (nonatomic , copy)NSString *salE_ATTRIBUTE;
/**"" = "439.000000";*/
@property (nonatomic , copy)NSString *sale_price;
/** = 2;*/
@property (nonatomic , assign)int status;
/**statusname = "";*/
/** = 100;*/
@property (nonatomic , assign) int stockCount;
/**"" = 0;*/
@property (nonatomic , assign) int uP_COUNT;


@end
