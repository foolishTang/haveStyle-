//
//  LGClassifySecondModel.h
//  有范吗?
//
//  Created by 唐磊guang on 16/1/12.
//  Copyright (c) 2016年 唐磊guang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ClassifyClsinfo;
@interface LGClassifySecondModel : NSObject


@property (nonatomic, strong) ClassifyClsinfo *clsInfo;

@property (nonatomic, strong) NSArray *prodClsTag;


@end
@interface ClassifyClsinfo : NSObject

@property (nonatomic, copy) NSString *plaN_LIST_TIME;

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, assign) NSInteger uP_COUNT;

@property (nonatomic, copy) NSString *code;

@property (nonatomic, copy) NSString *brand;

@property (nonatomic, assign) NSInteger branD_ID;

@property (nonatomic, copy) NSString *brandCode;

@property (nonatomic, assign) long long marketTime;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *plaN_UNLIST_TIME;

@property (nonatomic, copy) NSString *brandUrl;

@property (nonatomic, assign) NSInteger collocationCount;

//@property (nonatomic, copy) NSString *id;

@property (nonatomic, copy) NSString *mainImage;

@property (nonatomic, assign) NSInteger stockCount;

@property (nonatomic, assign) NSInteger favoriteCount;

@property (nonatomic, assign) BOOL isFavorite;

@property (nonatomic, copy) NSString *offLineTime;

@property (nonatomic, copy) NSString *salE_ATTRIBUTE;

@property (nonatomic, assign) NSInteger sale_price;

@property (nonatomic, assign) NSInteger price;

@property (nonatomic, copy) NSString *remark;

@property (nonatomic, assign) NSInteger colL_COUNT;

@end

