//
//  LGBrandFrame.m
//  有范吗?
//
//  Created by 唐磊guang on 15/12/31.
//  Copyright (c) 2015年 唐磊guang. All rights reserved.
//

#import "LGBrandFrame.h"
#import "LGHomeLookModel.h"
@implementation LGBrandFrame

-(void)setBrandArr:(NSArray *)brandArr
{
    _brandArr = brandArr;
    NSInteger count = brandArr.count;
    
    
    LGHomeLookModel *model = [brandArr lastObject];
    CGFloat  topX = 0;
    CGFloat  topY = 0;
    CGFloat  topW = model.fitW;
    CGFloat  topH = model.fitH;
    _brand = model.img;
    self.brandFrame = CGRectMake(topX, topY, topW, topH);
    
    model = brandArr [count-2];
    CGFloat  leftUpX = 0;
    CGFloat  leftUpY = CGRectGetMaxY(self.brandFrame);
    CGFloat  leftUpW = model.fitW;
    CGFloat  leftUpH = model.fitH;
    self.leftUpFrame = CGRectMake(leftUpX, leftUpY, leftUpW, leftUpH);
    _leftUp = model.img;
    
    model = brandArr [count-3];
    CGFloat  rightX = CGRectGetMaxX(self.leftUpFrame);
    CGFloat  rightY = leftUpY;
    CGFloat  rightW = model.fitW;
    CGFloat  rightH = model.fitH;
    self.rightFrame = CGRectMake(rightX, rightY, rightW, rightH);
    _right = model.img;
    
    model = brandArr [count-4];
    CGFloat  leftDownX = leftUpX;
    CGFloat  leftDownY = CGRectGetMaxY(self.leftUpFrame);
    CGFloat  leftDownW = model.fitW;
    CGFloat  leftDownH = model.fitH;
    self.leftDownFrame = CGRectMake(leftDownX, leftDownY, leftDownW, leftDownH);
    _leftDown = model.img;
    
    
    model = brandArr [count-5];
    CGFloat  bottomLeftX = leftUpX;
    CGFloat  bottomLeftY = CGRectGetMaxY(self.leftDownFrame);
    CGFloat  bottomLeftW = model.fitW;
    CGFloat  bottomLeftH = model.fitH;
    self.bottomLeftFrame = CGRectMake(bottomLeftX, bottomLeftY, bottomLeftW, bottomLeftH);
    _bottomLeft = model.img;
    
    
    model = brandArr [count-6];
    CGFloat  bottomMiddleX = CGRectGetMaxX(self.bottomLeftFrame);
    CGFloat  bottomMiddleY = bottomLeftY;
    CGFloat  bottomMiddleW = model.fitW;
    CGFloat  bottomMiddleH = model.fitH;
    self.bottomMiddleFrame = CGRectMake(bottomMiddleX, bottomMiddleY, bottomMiddleW, bottomMiddleH);
    _bottomMiddle = model.img;
    
    model = brandArr [count-7];
    CGFloat  bottomRightX = CGRectGetMaxX(self.bottomMiddleFrame);
    CGFloat  bottomRightY = bottomMiddleY;
    CGFloat  bottomRightW = model.fitW;
    CGFloat  bottomRightH = model.fitH;
    self.bottomRightFrame = CGRectMake(bottomRightX, bottomRightY, bottomRightW, bottomRightH);
    _bottomRight = model.img;
}


@end
