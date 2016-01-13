//
//  MoreStructAllClothCell.h
//  有范吗?
//
//  Created by 唐磊guang on 16/1/9.
//  Copyright (c) 2016年 唐磊guang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class testModel;
typedef void(^MoreStructAllClothBlock)(NSString *urlString);
@interface MoreStructAllClothCell : UITableViewCell

@property (nonatomic , strong)testModel *model;


@property (copy , nonatomic)MoreStructAllClothBlock block;
-(void)setBlock:(MoreStructAllClothBlock)block;

@end
