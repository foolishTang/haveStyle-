//
//  MoreStructADCell.h
//  有范吗?
//
//  Created by 唐磊guang on 16/1/9.
//  Copyright (c) 2016年 唐磊guang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TowHomeADModel;
typedef void(^LGADBlock)(NSString *urlString);
@interface MoreStructADCell : UITableViewCell

@property (strong , nonatomic)TowHomeADModel *model;


@property (copy , nonatomic)LGADBlock ADBlock;
-(void)setADBlock:(LGADBlock)ADBlock;

@end
