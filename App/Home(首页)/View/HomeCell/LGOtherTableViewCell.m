//
//  LGOtherTableViewCell.m
//  有范吗?
//
//  Created by 唐磊guang on 15/12/31.
//  Copyright (c) 2015年 唐磊guang. All rights reserved.
//

#import "LGOtherTableViewCell.h"
#import "LGNewClothFrame.h"
#import "UIButton+WebCache.h"
#import "LGHomeADModel.h"
#import "LGOtherModel.h"
#import "LGOtherFrame.h"
#import "LGOtherButton.h"
#define ImageCount 6
@interface LGOtherTableViewCell()

@property (strong , nonatomic)NSMutableArray *buttonArr;



@end

@implementation LGOtherTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.buttonArr = [[NSMutableArray alloc]init];
        for (int i = 0; i<ImageCount; i++)
        {
            LGOtherButton *button = [[LGOtherButton alloc]init];
            button.tag = i;
            button.adjustsImageWhenHighlighted = NO;
            [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
            [self.buttonArr addObject:button];
            [self.contentView addSubview:button];
        }
    }
    return self;
}

-(void)setBrandFrame:(LGNewClothFrame *)brandFrame
{
    
    
#warning 自定义button
    
    //介绍
    LGOtherButton* button = self.buttonArr[5];
    button.frame = brandFrame.introFrame;
    [button sd_setBackgroundImageWithURL:[NSURL URLWithString:self.otherFrame.homeAdModel.img] forState:UIControlStateNormal];
    
    
    
    
    //左
    LGOtherModel *otherM = self.otherFrame.otherArr[0];
    button = self.buttonArr[0];
    button.frame = brandFrame.leftFrame;

    [button sd_setImageWithURL:[NSURL URLWithString:otherM.small_img] forState:UIControlStateNormal];
    [button setTitle:otherM.name subTitle:otherM.info];
    //中上
    otherM = self.otherFrame.otherArr[1];
    
    button = self.buttonArr[1];

    button.frame = brandFrame.middleUpFrame;
    [button sd_setImageWithURL:[NSURL URLWithString:otherM.small_img] forState:UIControlStateNormal];
    [button setTitle:otherM.name subTitle:otherM.info];
    //中下
    otherM = self.otherFrame.otherArr[3];
    button = self.buttonArr[2];
    button.frame = brandFrame.middleDownFrame;
    [button sd_setImageWithURL:[NSURL URLWithString:otherM.small_img] forState:UIControlStateNormal];
    [button setTitle:otherM.name subTitle:otherM.info];
    //右上
    otherM = self.otherFrame.otherArr[2];
    button = self.buttonArr[3];
    button.frame = brandFrame.rightUpFrame;
    [button sd_setImageWithURL:[NSURL URLWithString:otherM.small_img] forState:UIControlStateNormal];
    [button setTitle:otherM.name subTitle:otherM.info];
    //右下
    otherM = self.otherFrame.otherArr[4];
    button = self.buttonArr[4];
    button.frame = brandFrame.rightDownFrame;
    [button sd_setImageWithURL:[NSURL URLWithString:otherM.small_img] forState:UIControlStateNormal];
    [button setTitle:otherM.name subTitle:otherM.info];
    
}

-(void)buttonClick:(UIButton *)btn
{
#warning 这里有问题
    id model;
    if (btn.tag == 5) {
        model = self.otherFrame.otherArr[0];
    }
    else
    {
    model = self.otherFrame.otherArr[btn.tag];
    }
    if ([self.LGOtherDelegate respondsToSelector:@selector(toGoDetail:)])
    {
        [self.LGOtherDelegate toGoDetail:model];
    }
    
    
}

@end
