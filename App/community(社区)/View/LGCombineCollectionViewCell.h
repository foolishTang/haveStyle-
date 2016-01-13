//
//  LGCombineCollectionViewCell.h
//  有范吗?
//
//  Created by 千锋 on 16/1/6.
//  Copyright (c) 2016年 唐磊guang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^LGCombineBlock)(int type,int currentPage);
@interface LGCombineCollectionViewCell : UICollectionViewCell

@property (strong , nonatomic)NSMutableArray *imageArray;

@property (copy , nonatomic)LGCombineBlock block;

-(void)setBlock:(LGCombineBlock)block;

@end
