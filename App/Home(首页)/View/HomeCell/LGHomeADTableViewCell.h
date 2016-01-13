//
//  LGHomeADTableViewCell.h
//  有范吗?
//
//  Created by 唐磊guang on 15/12/30.
//  Copyright (c) 2015年 唐磊guang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LGHomeADModel;
typedef void(^LGADBlock)(NSString *urlString);
@interface LGHomeADTableViewCell : UITableViewCell

@property (strong , nonatomic)NSArray *ADArray;

@property (copy , nonatomic)LGADBlock ADBlock;
-(void)setADBlock:(LGADBlock)ADBlock;
@end
