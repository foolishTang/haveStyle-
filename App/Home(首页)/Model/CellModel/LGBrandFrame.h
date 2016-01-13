//
//  LGBrandFrame.h
//  有范吗?
//
//  Created by 唐磊guang on 15/12/31.
//  Copyright (c) 2015年 唐磊guang. All rights reserved.
//

#import "LGBaseModel.h"
@interface LGBrandFrame : LGBaseModel

@property (strong , nonatomic)NSArray *brandArr;

/**标题栏*/
@property (assign , nonatomic)CGRect brandFrame;
@property (copy , nonatomic)NSString *brand;
/**组图左上*/
@property (assign , nonatomic)CGRect leftUpFrame;
@property (copy , nonatomic)NSString *leftUp;
/**作图左下*/
@property (assign , nonatomic)CGRect leftDownFrame;
@property (copy , nonatomic)NSString *leftDown;
/**组图右图*/
@property (assign , nonatomic)CGRect rightFrame;
@property (copy , nonatomic)NSString *right;
/**底部第一个*/
@property (assign , nonatomic)CGRect bottomLeftFrame;
@property (copy , nonatomic)NSString *bottomLeft;
/**底部第2个*/
@property (assign , nonatomic)CGRect bottomMiddleFrame;
@property (copy , nonatomic)NSString *bottomMiddle;
/**底部第3个*/
@property (assign , nonatomic)CGRect bottomRightFrame;
@property (copy , nonatomic)NSString *bottomRight;

@end
