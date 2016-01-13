//
//  LGBrandTableViewCell.m
//  有范吗?
//
//  Created by 唐磊guang on 15/12/31.
//  Copyright (c) 2015年 唐磊guang. All rights reserved.
//

#import "LGBrandTableViewCell.h"
#import "LGBrandFrame.h"
#import "UIButton+WebCache.h"
#import "LGHomeLookJumpModel.h"
#import "LGHomeLookModel.h"
#define ImageCount 7

@interface LGBrandTableViewCell()

@property (weak , nonatomic)UIButton *brand;
@property (weak , nonatomic)UIButton *leftUp;
@property (weak , nonatomic)UIButton *leftDown;
@property (weak , nonatomic)UIButton *right;
@property (weak , nonatomic)UIButton *bottomLeft;
@property (weak , nonatomic)UIButton *bottomMiddle;
@property (weak , nonatomic)UIButton *bottomRight;
@property (strong , nonatomic)NSMutableArray *buttonArr;

@end


@implementation LGBrandTableViewCell

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
-(void)setBrandFrame:(LGBrandFrame *)brandFrame
{
    _brandFrame = brandFrame;
    //头部的条
    UIButton *button = self.buttonArr[0];
    button.frame = brandFrame.brandFrame;
    [button sd_setBackgroundImageWithURL:[NSURL URLWithString:brandFrame.brand] forState:UIControlStateNormal];
    //组图中左上角的
    button = self.buttonArr[1];
    button.frame = brandFrame.leftUpFrame;
    [button sd_setBackgroundImageWithURL:[NSURL URLWithString:brandFrame.leftUp] forState:UIControlStateNormal];
    //组图中左下角的
    button = self.buttonArr[2];
    button.frame = brandFrame.leftDownFrame;
    [button sd_setBackgroundImageWithURL:[NSURL URLWithString:brandFrame.leftDown] forState:UIControlStateNormal];
    //组图中右边的
    button = self.buttonArr[3];
    button.frame = brandFrame.rightFrame;
    [button sd_setBackgroundImageWithURL:[NSURL URLWithString:brandFrame.right] forState:UIControlStateNormal];
    //底部1角的
    button = self.buttonArr[4];
    button.frame = brandFrame.bottomLeftFrame;
    [button sd_setBackgroundImageWithURL:[NSURL URLWithString:brandFrame.bottomLeft] forState:UIControlStateNormal];
    //底部2的
    button = self.buttonArr[5];
    button.frame = brandFrame.bottomMiddleFrame;
    [button sd_setBackgroundImageWithURL:[NSURL URLWithString:brandFrame.bottomMiddle] forState:UIControlStateNormal];
    
    //底部3的
    button = self.buttonArr[6];
    button.frame = brandFrame.bottomRightFrame;
    [button sd_setBackgroundImageWithURL:[NSURL URLWithString:brandFrame.bottomRight] forState:UIControlStateNormal];
    
}

-(void)buttonClick:(UIButton *)btn
{
    LGHomeLookModel *model = self.brandFrame.brandArr[ImageCount-1-btn.tag];
    self.block(model.jump.url);
}


@end
