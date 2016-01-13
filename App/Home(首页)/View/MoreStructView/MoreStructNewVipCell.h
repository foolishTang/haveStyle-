//
//  MoreStructNewVipCell.h
//  有范吗?
//
//  Created by 唐磊guang on 16/1/9.
//  Copyright (c) 2016年 唐磊guang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TowHomeNewVip;
typedef void(^MoreStructNewVipBlock)(NSString *urlString);
@interface MoreStructNewVipCell : UITableViewCell


@property (nonatomic , strong)TowHomeNewVip *model;


@property (copy , nonatomic)MoreStructNewVipBlock block;
-(void)setBlock:(MoreStructNewVipBlock)block;


@end
