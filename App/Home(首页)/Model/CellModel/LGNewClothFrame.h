//
//  LGNewClothFrame.h
//  有范吗?
//
//  Created by 唐磊guang on 15/12/31.
//  Copyright (c) 2015年 唐磊guang. All rights reserved.
//

#import "LGBaseModel.h"

@interface LGNewClothFrame : LGBaseModel

@property (strong , nonatomic)NSArray *clothArr;

@property (assign , nonatomic)CGRect titleFrame;
@property (copy , nonatomic)NSString *title;

@property (assign , nonatomic)CGRect introFrame;
@property (copy , nonatomic)NSString *intro;

@property (assign , nonatomic)CGRect leftFrame;
@property (copy , nonatomic)NSString *left;

@property (assign , nonatomic)CGRect middleUpFrame;
@property (copy , nonatomic)NSString *middleUp;

@property (assign , nonatomic)CGRect middleDownFrame;
@property (copy , nonatomic)NSString *middleDown;

@property (assign , nonatomic)CGRect rightUpFrame;
@property (copy , nonatomic)NSString *rightUp;

@property (assign , nonatomic)CGRect rightDownFrame;
@property (copy , nonatomic)NSString *rightDown;



@end
