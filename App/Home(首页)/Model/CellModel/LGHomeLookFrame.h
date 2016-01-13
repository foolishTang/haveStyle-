//
//  LGHomeLookFrame.h
//  有范吗?
//
//  Created by 唐磊guang on 15/12/31.
//  Copyright (c) 2015年 唐磊guang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "LGBaseModel.h"
@interface LGHomeLookFrame : LGBaseModel

@property (strong , nonatomic)NSArray *lookArr;

@property (assign , nonatomic)CGRect topFrame;
@property (assign , nonatomic)CGRect bigFrame;
@property (assign , nonatomic)CGRect leftFrame;
@property (assign , nonatomic)CGRect rightFrame;

@end
