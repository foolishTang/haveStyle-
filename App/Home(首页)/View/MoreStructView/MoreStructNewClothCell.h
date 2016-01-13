//
//  MoreStructNewClothCell.h
//  有范吗?
//
//  Created by 唐磊guang on 16/1/9.
//  Copyright (c) 2016年 唐磊guang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class testModel;
typedef void(^MoreStructNewClothBlock)(NSString *urlString);
@interface MoreStructNewClothCell : UITableViewCell


@property (nonatomic , strong)testModel *model;


@property (copy , nonatomic)MoreStructNewClothBlock block;
-(void)setBlock:(MoreStructNewClothBlock)block;


@end
