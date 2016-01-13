//
//  LGPayToolBar.m
//  有范吗?
//
//  Created by 唐磊guang on 16/1/8.
//  Copyright (c) 2016年 唐磊guang. All rights reserved.
//

#import "LGPayToolBar.h"

#define RightBtnW 90

@interface LGPayToolBar()

@property (weak , nonatomic)UIButton *serviceBtn;
@property (weak , nonatomic)UIButton *favoBtn;
@property (weak , nonatomic)UIButton *sackBtn;
@property (weak , nonatomic)UIButton *addBtn;


@end

@implementation LGPayToolBar

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        
        [self addItem];
        self.backgroundColor = [UIColor redColor];
    }
    return self;
}

-(void)addItem
{
    self.serviceBtn = [self createButtonWithTitle:@"客服" andTag:0];
    self.favoBtn = [self createButtonWithTitle:@"收藏" andTag:1];
    self.sackBtn = [self createButtonWithTitle:@"购物袋" andTag:2];
    self.addBtn = [self createButtonWithTitle:@"加入购物袋" andTag:3];
    self.addBtn.backgroundColor = [UIColor blackColor];
    [self.addBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
}

-(UIButton *)createButtonWithTitle:(NSString *)title andTag:(int)tag
{
    UIButton *button = [[UIButton alloc]init];
    button.tag = tag;
    button.adjustsImageWhenHighlighted = NO;
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor yellowColor] forState:UIControlStateSelected];
    button.layer.borderWidth = 0.3;
    button.layer.borderColor = [UIColor grayColor].CGColor;
    button.backgroundColor = [UIColor whiteColor];
    button.titleLabel.font = [UIFont systemFontOfSize:14];
//    CGFloat  topX = itemW *(i%3);
//    CGFloat  topY = 26+itemH *(i/3);
//    CGFloat  topW = itemW;
//    CGFloat  topH = itemH;
//    button.frame = CGRectMake(topX, topY, topW, topH);
//    [self.btnArray addObject:button];
    [self addSubview:button];
    return button;
}

-(void)buttonClick:(UIButton *)button
{
    NSLog(@"%d",(int)button.tag);
    if (button.tag == 3) {
        self.block();
    }
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    float itemW = (self.width - RightBtnW)/3.0f;
    float itemH = self.height;
        CGFloat  topX = 0;
        CGFloat  topY = 0;
        CGFloat  topW = itemW;
        CGFloat  topH = itemH;
        self.serviceBtn.frame = CGRectMake(topX, topY, topW, topH);
    
    CGFloat  favoX = itemW;
    CGFloat  favoY = 0;
    CGFloat  favoW = itemW;
    CGFloat  favoH = itemH;
    self.favoBtn.frame = CGRectMake(favoX, favoY, favoW, favoH);
    
    CGFloat  sackX = 2*itemW;
    CGFloat  sackY = 0;
    CGFloat  sackW = itemW;
    CGFloat  sackH = itemH;
    self.sackBtn.frame = CGRectMake(sackX, sackY, sackW, sackH);

    CGFloat  addX = 3*itemW;
    CGFloat  addY = 0;
    CGFloat  addW = RightBtnW;
    CGFloat  addH = itemH;
    self.addBtn.frame = CGRectMake(addX, addY, addW, addH);
}
+(id)payToolBar
{
    return [[self alloc]initWithFrame:CGRectMake(0, ScreenH-49, ScreenW, 49)];
}
@end
