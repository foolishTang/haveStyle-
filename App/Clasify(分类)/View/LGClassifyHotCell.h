//
//  LGClassifyHotCell.h
//  有范吗?
//
//  Created by 唐磊guang on 16/1/5.
//  Copyright (c) 2016年 唐磊guang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^LGClassifyHotCellBlock)(NSString *tid);
@interface LGClassifyHotCell : UITableViewCell

@property (strong , nonatomic)NSArray *hotArray;

@property (copy , nonatomic)LGClassifyHotCellBlock block;

-(void)setBlock:(LGClassifyHotCellBlock)block;

@end
