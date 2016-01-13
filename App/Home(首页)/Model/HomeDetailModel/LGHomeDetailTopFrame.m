//
//  LGHomeDetailTopFrame.m
//  有范吗?
//
//  Created by 唐磊guang on 16/1/4.
//  Copyright (c) 2016年 唐磊guang. All rights reserved.
//

#import "LGHomeDetailTopFrame.h"
#import "LGHomeDetailTopModel.h"
#define selectMargon 5
@implementation LGHomeDetailTopFrame

-(void)setTopModel:(LGHomeDetailTopModel *)topModel
{
    _topModel = topModel;
    
    CGFloat  imageX = 0;
    CGFloat  imageY = 0;
    CGFloat  imageW = ScreenW;
    CGFloat  imageH = topModel.height/2.0f;
    self.imageBtnFrame = CGRectMake(imageX, imageY, imageW, imageH);
    
    CGFloat  selectX = selectMargon;
    CGFloat  selectY = CGRectGetMaxY(self.imageBtnFrame)+10;
    CGFloat  selectW = ScreenW-selectMargon*2;
    CGFloat  selectH = 50;
    self.selectViewFrame = CGRectMake(selectX, selectY, selectW, selectH);
    
}

@end
