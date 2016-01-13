//
//  MoreStructMoreInfoModel.h
//  有范吗?
//
//  Created by 唐磊guang on 16/1/9.
//  Copyright (c) 2016年 唐磊guang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Productlist,Prodclstag,Prodpcclstag;
@interface MoreStructMoreInfoModel : NSObject



@property (nonatomic, copy) NSString *end_time;

@property (nonatomic, strong) NSArray *productList;

@property (nonatomic, copy) NSString *site;

@property (nonatomic, copy) NSString *ID;

@property (nonatomic, copy) NSString *is_delete;

@property (nonatomic, copy) NSString *start_time;

@property (nonatomic, copy) NSString *create_time;

@property (nonatomic, copy) NSString *type;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *index;


@end
@interface Productlist : NSObject

@property (nonatomic, copy) NSString *on_sale_date;

@property (nonatomic, copy) NSString *product_name;

@property (nonatomic, copy) NSString *product_url;

@property (nonatomic, copy) NSString *product_sys_code;

@property (nonatomic, copy) NSString *brandUrl;

@property (nonatomic, copy) NSString *brand_id;

@property (nonatomic, copy) NSString *market_price;

@property (nonatomic, copy) NSString *price;

@property (nonatomic, strong) NSArray *prodClsTag;

@property (nonatomic, strong) NSArray *prodPcClsTag;

@property (nonatomic, copy) NSString *brandName;

@property (nonatomic, strong) NSArray *spec_price_list;

@property (nonatomic, assign) NSInteger status;

@end

@interface Prodclstag : NSObject

@property (nonatomic, copy) NSString *tagName;

@property (nonatomic, assign) NSInteger tagType;

@property (nonatomic, copy) NSString *tagUrl;

@property (nonatomic, copy) NSString *remark;

@end

@interface Prodpcclstag : NSObject

@property (nonatomic, copy) NSString *tagName;

@property (nonatomic, assign) NSInteger tagType;

@property (nonatomic, copy) NSString *tagUrl;

@property (nonatomic, copy) NSString *remark;

@end

