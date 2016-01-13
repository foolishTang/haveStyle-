//
//  LGBrandTableViewCell.h
//  有范吗?
//
//  Created by 唐磊guang on 15/12/31.
//  Copyright (c) 2015年 唐磊guang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LGBrandFrame;
typedef void(^brandBlock)(NSString *urlString);
@interface LGBrandTableViewCell : UITableViewCell

@property (strong , nonatomic)LGBrandFrame *brandFrame;

@property (copy , nonatomic)brandBlock block;

-(void)setBlock:(brandBlock)block;


@end
