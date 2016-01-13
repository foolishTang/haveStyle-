//
//  LGHomePayModel.h
//  有范吗?
//
//  Created by 千锋 on 16/1/7.
//  Copyright (c) 2016年 唐磊guang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Clsinfo,Commoncounttotal,Speclist,Activity,Colorlist,Propicurl,Clspicurl;
@interface LGHomePayModel : NSObject


@property (nonatomic, strong) NSArray *specList;

@property (nonatomic, assign) BOOL isFavorite;

@property (nonatomic, strong) NSArray *colorList;

@property (nonatomic, strong) NSArray *proPicUrl;

@property (nonatomic, strong) Commoncounttotal *commonCountTotal;

@property (nonatomic, strong) NSArray *clsPicUrl;

@property (nonatomic, strong) Clsinfo *clsInfo;

@property (nonatomic, strong) NSArray *activity;


@end
@interface Clsinfo : NSObject

@property (nonatomic, copy) NSString *ID;

@property (nonatomic, copy) NSString *desc;

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, assign) NSInteger stockCount;

@property (nonatomic, copy) NSString *marketTime;

@property (nonatomic, assign) NSInteger favoriteCount;

@property (nonatomic, copy) NSString *brand;

@property (nonatomic, copy) NSString *brandUrl;

@property (nonatomic, copy) NSString *code;

@property (nonatomic, copy) NSString *sale_price;

@property (nonatomic, copy) NSString *price;

@property (nonatomic, copy) NSString *branD_ID;

@property (nonatomic, copy) NSString *mainImage;

@property (nonatomic, copy) NSString *statusname;

@property (nonatomic, copy) NSString *name;

@property (nonatomic , assign)NSInteger number;

@end

@interface Commoncounttotal : NSObject

@property (nonatomic, assign) NSInteger saleQty;

@property (nonatomic, assign) NSInteger collocationCount;

@property (nonatomic, assign) NSInteger countScore;

@property (nonatomic, assign) NSInteger favoritCount;

@property (nonatomic, assign) NSInteger browserCount;

@property (nonatomic, assign) NSInteger commentCount;

@property (nonatomic, assign) NSInteger sharedCount;

@property (nonatomic, copy) NSString *percent;

@property (nonatomic, assign) NSInteger avgComment;

@property (nonatomic, copy) NSString *avgCommentNew;

@property (nonatomic, assign) NSInteger procodeCount;

@property (nonatomic, assign) NSInteger sourceID;

@end

@interface Speclist : NSObject

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *code;

@end

@interface Activity : NSObject

@property (nonatomic, copy) NSString *aid;

@property (nonatomic, copy) NSString *type;

@property (nonatomic, copy) NSString *url;

@property (nonatomic, copy) NSString *name;

@end

@interface Colorlist : NSObject

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *picurl;

@property (nonatomic, copy) NSString *code;

@end

@interface Propicurl : NSObject

//主页图片轮播
@property (nonatomic, copy) NSString *filE_PATH;

@property (nonatomic, assign) NSInteger isMainImage;

@property (nonatomic, copy) NSString *remark;

@end

@interface Clspicurl : NSObject

@property (nonatomic, copy) NSString *filE_PATH;

@property (nonatomic, assign) NSInteger isMainImage;

@property (nonatomic, copy) NSString *remark;

@end

