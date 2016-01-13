//
//  LGDetailPhotoTableViewCell.h
//  有范吗?
//
//  Created by 唐磊guang on 16/1/4.
//  Copyright (c) 2016年 唐磊guang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class  LGClassifySecondModel,ClassifyClsinfo;

typedef void(^homeDetailOtherBlock)(ClassifyClsinfo *model);

@interface LGDetailPhotoTableViewCell : UITableViewCell

@property (copy , nonatomic)homeDetailOtherBlock block;

@property (strong , nonatomic)ClassifyClsinfo *model1;
@property (strong , nonatomic)ClassifyClsinfo *model2;

-(void)relayoutWithModel1:(LGClassifySecondModel *)model1 model2:(LGClassifySecondModel *)model2;

-(void)setBlock:(homeDetailOtherBlock)block;


@end
