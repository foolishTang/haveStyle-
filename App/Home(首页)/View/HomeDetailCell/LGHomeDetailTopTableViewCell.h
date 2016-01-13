//
//  LGHomeDetailTopTableViewCell.h
//  有范吗?
//
//  Created by 唐磊guang on 16/1/4.
//  Copyright (c) 2016年 唐磊guang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LGHomeDetailTopFrame;
typedef void(^midBlock)(int tid);
@interface LGHomeDetailTopTableViewCell : UITableViewCell

@property (strong , nonatomic)LGHomeDetailTopFrame *topFrame;

@property (copy , nonatomic)midBlock block;

-(void)setBlock:(midBlock)block;

@end
