//
//  LGNewClothFrame.m
//  有范吗?
//
//  Created by 唐磊guang on 15/12/31.
//  Copyright (c) 2015年 唐磊guang. All rights reserved.
//

#import "LGNewClothFrame.h"
#import "LGHomeLookModel.h"
@implementation LGNewClothFrame

-(void)setClothArr:(NSArray *)clothArr
{
    NSInteger count = clothArr.count;
    
    LGHomeLookModel *model = clothArr[count-1];
    CGFloat  titleX = 0;
    CGFloat  titleY = 0;
    CGFloat  titleW = model.fitW;
    CGFloat  titleH = model.fitH;
    _title = model.img;
    self.titleFrame = CGRectMake(titleX, titleY, titleW, titleH);
    model = clothArr[count-2];
    CGFloat  introX = 0;
    CGFloat  introY = CGRectGetMaxY(self.titleFrame);
    CGFloat  introW = model.fitW;
    CGFloat  introH = model.fitH;
    _intro = model.img;
    self.introFrame = CGRectMake(introX, introY, introW, introH);
    
    model = clothArr[count-3];
    CGFloat  leftX = introX;
    CGFloat  leftY = CGRectGetMaxY(self.introFrame);
    CGFloat  leftW = model.fitW;
    CGFloat  leftH = model.fitH;
    _left = model.img;
    self.leftFrame = CGRectMake(leftX, leftY, leftW, leftH);
    
    model = clothArr[count-4];
    CGFloat  middleUpX = CGRectGetMaxX(self.leftFrame);
    CGFloat middleUpY = leftY;
    CGFloat  middleUpW = model.fitW;
    CGFloat  middleUpH = model.fitH;
    _middleUp = model.img;
    self.middleUpFrame = CGRectMake(middleUpX, middleUpY, middleUpW, middleUpH);
    
    model = clothArr[count-5];
    CGFloat  rightUpX = CGRectGetMaxX(self.middleUpFrame);
    CGFloat  rightUpY = middleUpY;
    CGFloat  rightUpW = model.fitW;
    CGFloat  rightUpH = model.fitH;
    _rightUp = model.img;
    self.rightUpFrame = CGRectMake(rightUpX, rightUpY, rightUpW, rightUpH);
    
    model = clothArr[count-6];
    CGFloat  middleDownX = middleUpX;
    CGFloat  middleDownY = CGRectGetMaxY(self.middleUpFrame);
    CGFloat  middleDownW = model.fitW;
    CGFloat  middleDownH = model.fitH;
    _middleDown = model.img;
    self.middleDownFrame = CGRectMake(middleDownX, middleDownY, middleDownW, middleDownH);
    
    
    
    model = clothArr[count-7];
    CGFloat  rightDownX = rightUpX;
    CGFloat  rightDownY = CGRectGetMaxY(self.rightUpFrame);
    CGFloat  rightDownW = model.fitW;
    CGFloat  rightDownH = model.fitH;
    _rightDown = model.img;
    self.rightDownFrame = CGRectMake(rightDownX, rightDownY, rightDownW, rightDownH);
    
    
    
    
    
    
    
}


@end
