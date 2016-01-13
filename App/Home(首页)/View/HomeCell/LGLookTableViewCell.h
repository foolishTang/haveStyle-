//
//  LGLookTableViewCell.h
//  有范吗?
//
//  Created by 唐磊guang on 15/12/30.
//  Copyright (c) 2015年 唐磊guang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LGHomeLookFrame;
typedef void(^lookBlock)(NSString *urlString);
@interface LGLookTableViewCell : UITableViewCell

@property (strong , nonatomic)LGHomeLookFrame *lookFrame;

@property (copy , nonatomic)lookBlock lookBlock;


-(void)setLookBlock:(lookBlock)lookBlock;
@end
