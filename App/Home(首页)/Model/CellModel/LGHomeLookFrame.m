//
//  LGHomeLookFrame.m
//  有范吗?
//
//  Created by 唐磊guang on 15/12/31.
//  Copyright (c) 2015年 唐磊guang. All rights reserved.
//

#import "LGHomeLookFrame.h"
#import "LGHomeLookModel.h"
@implementation LGHomeLookFrame

-(void)setLookArr:(NSArray *)lookArr
{
    _lookArr = lookArr;
    LGHomeLookModel *topModel = [lookArr lastObject];
    CGFloat  topX = 0;
    CGFloat  topY = 0;
    CGFloat  topW = topModel.fitW;
    CGFloat  topH = topModel.fitH;
    self.topFrame = CGRectMake(topX, topY, topW, topH);
    
    LGHomeLookModel *bigModel = lookArr[2];
    CGFloat  bigX = bigModel.x/2;
    CGFloat  bigY = CGRectGetMaxY(self.topFrame);
    CGFloat  bigW = bigModel.fitW;
    CGFloat  bigH = bigModel.fitH;
    self.bigFrame = CGRectMake(bigX, bigY, bigW, bigH);
    
    LGHomeLookModel *leftModel = lookArr[1];
    CGFloat  leftX = CGRectGetMaxX(self.bigFrame);
    CGFloat  leftY = bigY;
    CGFloat  leftW = leftModel.fitW;
    CGFloat  leftH = leftModel.fitH;
    self.leftFrame = CGRectMake(leftX, leftY, leftW, leftH);

    
    LGHomeLookModel *right = lookArr [0];
    CGFloat  rightX = CGRectGetMaxX(self.leftFrame);
    CGFloat  rightY = bigY;
    CGFloat  rightW = right.fitW;
    CGFloat  rightH = right.fitH;
    self.rightFrame = CGRectMake(rightX, rightY, rightW, rightH);

}


@end
