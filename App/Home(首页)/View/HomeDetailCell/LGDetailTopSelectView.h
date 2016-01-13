//
//  LGDetailTopSelectView.h
//  有范吗?
//
//  Created by 唐磊guang on 16/1/4.
//  Copyright (c) 2016年 唐磊guang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LGHomeDetailMidModel;
typedef void(^buttonClick)(int tid);
@interface LGDetailTopSelectView : UIView

@property (strong , nonatomic)NSArray *array;

@property (copy , nonatomic)buttonClick block;

-(void)setBlock:(buttonClick)block;

@end
