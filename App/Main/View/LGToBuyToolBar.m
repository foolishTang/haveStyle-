//
//  LGToBuyToolBar.m
//  有范吗?
//
//  Created by 唐磊guang on 16/1/13.
//  Copyright (c) 2016年 唐磊guang. All rights reserved.
//

#import "LGToBuyToolBar.h"
#define RightBtnW 90
@interface LGToBuyToolBar()
@property (weak , nonatomic)UIButton *serviceBtn;
@property (weak , nonatomic)UIButton *addBtn;
@property (weak , nonatomic)UILabel *allSelectLabel;
@property (weak , nonatomic)UILabel *allPrice;
@end

@implementation LGToBuyToolBar

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        
        [self addItem];
        self.backgroundColor = [UIColor lightGrayColor];
    }
    return self;
}

-(void)creatButtonWithTitle:(NSString*)title action:(SEL)selector frame:(CGRect)frame
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = frame;
    [self addSubview:button];
    [button setTitle:title forState:UIControlStateNormal];
    button.backgroundColor = [UIColor blackColor];
    [button addTarget:self action:selector forControlEvents:UIControlEventTouchUpInside];
    CALayer *layer = button.layer;
    layer.borderWidth = 1;
    layer.borderColor = [UIColor redColor].CGColor;
    layer.cornerRadius = 15;
}

-(void)addItem
{
    self.serviceBtn = [self createButtonWithTitle:@"" andTag:0];
    self.addBtn = [self createButtonWithTitle:@"去结算" andTag:1];
    
    self.addBtn.backgroundColor = [UIColor blackColor];
    [self.addBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    UILabel *label = [[UILabel alloc]init];
    self.allSelectLabel = label;
    label.text = @"全选";
    [self addSubview:label];
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
    if (button.tag == 0) {
        button.selected = !button.selected;
        if (button.selected == YES) {
            button.backgroundColor =[UIColor redColor];
        }else{
            button.backgroundColor = [UIColor cyanColor];
        }
    }
    if (button.tag == 1) {
        if ([self.delegate respondsToSelector:@selector(toBayViewController)]) {
            [self.delegate toBayViewController];
        }
        
    }
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    float itemH = self.height-39;
    CGFloat  topX = 10;
    CGFloat  topY = 20;
    CGFloat  topW = 10;
    CGFloat  topH = itemH;
    self.serviceBtn.frame = CGRectMake(topX, topY, topW, topH);
    
    CGFloat  addX = self.width-80;
    CGFloat  addY = 10;
    CGFloat  addW = 80;
    CGFloat  addH = 29;
    self.addBtn.frame = CGRectMake(addX, addY, addW, addH);
    
    CGFloat  allSelectX = CGRectGetMaxX(self.serviceBtn.frame)+15;
    CGFloat  allSelectY = 10;
    CGFloat  allSelectW = 80;
    CGFloat  allSelectH = 29;
    self.allSelectLabel.frame = CGRectMake(allSelectX, allSelectY, allSelectW, allSelectH);
    
}

+(LGToBuyToolBar *)toBayToolBar
{
    return [[self alloc]initWithFrame:CGRectMake(0, ScreenH-49, ScreenW, 49)];
}

@end
