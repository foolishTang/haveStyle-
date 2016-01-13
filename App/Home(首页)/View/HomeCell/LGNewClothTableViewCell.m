//
//  LGNewClothTableViewCell.m
//  有范吗?
//
//  Created by 唐磊guang on 15/12/31.
//  Copyright (c) 2015年 唐磊guang. All rights reserved.
//

#import "LGNewClothTableViewCell.h"
#import "UIButton+WebCache.h"
#import "LGNewClothFrame.h"
#define ImageCount 7

@interface LGNewClothTableViewCell()

@property (strong , nonatomic)NSMutableArray *buttonArr;

@end


@implementation LGNewClothTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.buttonArr = [[NSMutableArray alloc]init];
        for (int i = 0; i<ImageCount; i++)
        {
            UIButton *button = [[UIButton alloc]init];
            button.tag = i;
            button.adjustsImageWhenHighlighted = NO;
            [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
            [self.buttonArr addObject:button];
            [self.contentView addSubview:button];
        }
    }
    return self;
}
-(void)createUI
{
    
}
-(void)setClothFrame:(LGNewClothFrame *)brandFrame
{
    //标题
    UIButton *button = self.buttonArr[0];
    button.frame = brandFrame.titleFrame;
    [button sd_setBackgroundImageWithURL:[NSURL URLWithString:brandFrame.title] forState:UIControlStateNormal];
    //介绍
    button = self.buttonArr[1];
    button.frame = brandFrame.introFrame;
    [button sd_setBackgroundImageWithURL:[NSURL URLWithString:brandFrame.intro] forState:UIControlStateNormal];
    //左
    button = self.buttonArr[2];
    button.frame = brandFrame.leftFrame;
    [button sd_setBackgroundImageWithURL:[NSURL URLWithString:brandFrame.left] forState:UIControlStateNormal];
    //中上
    button = self.buttonArr[3];
    button.frame = brandFrame.middleUpFrame;
    [button sd_setBackgroundImageWithURL:[NSURL URLWithString:brandFrame.middleUp] forState:UIControlStateNormal];
    //中下
    button = self.buttonArr[4];
    button.frame = brandFrame.middleDownFrame;
    [button sd_setBackgroundImageWithURL:[NSURL URLWithString:brandFrame.middleDown] forState:UIControlStateNormal];
    //右上
    button = self.buttonArr[5];
    button.frame = brandFrame.rightUpFrame;
    [button sd_setBackgroundImageWithURL:[NSURL URLWithString:brandFrame.rightUp] forState:UIControlStateNormal];
    
    //右下
    button = self.buttonArr[6];
    button.frame = brandFrame.rightDownFrame;
    [button sd_setBackgroundImageWithURL:[NSURL URLWithString:brandFrame.rightDown] forState:UIControlStateNormal];
    
}

-(void)buttonClick:(UIButton *)btn
{
    NSLog(@"%d******",(int)btn.tag);
}
@end




