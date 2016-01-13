//
//  LGPayToolBar.h
//  有范吗?
//
//  Created by 唐磊guang on 16/1/8.
//  Copyright (c) 2016年 唐磊guang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^LGPayToolBarBlock)();

@interface LGPayToolBar : UIView

@property (copy , nonatomic)LGPayToolBarBlock block;

+(id)payToolBar;

-(void)setBlock:(LGPayToolBarBlock)block;


@end
