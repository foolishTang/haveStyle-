//
//  LGHomeDetailOtherModel.h
//  有范吗?
//
//  Created by 唐磊guang on 16/1/4.
//  Copyright (c) 2016年 唐磊guang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LGHomeDetailMainModle,LGHomeDetailBrandModel;
@interface LGHomeDetailOtherModel : NSObject
/*
 clsInfo =         {

 };

 isFavorite = 0;
 prodClsTag =         (
 {
 remark = "";
 tagName = "\U6298\U6263";
 tagType = 0;
 tagUrl = "http://metersbonwe.qiniucdn.com/zhekoutubiao.png";
 }
 );
 }
 */
@property (strong , nonatomic)LGHomeDetailMainModle *clsInfo;
@property (strong , nonatomic)NSArray *prodClsTag;
@property (nonatomic , assign)int isFavorite;

@end
