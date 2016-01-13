//
//  LGClassifyBrandCell.m
//  有范吗?
//
//  Created by 唐磊guang on 16/1/5.
//  Copyright (c) 2016年 唐磊guang. All rights reserved.
//

#import "LGClassifyBrandCell.h"
#import "LGClassifyBrandModel.h"
#import "UIButton+WebCache.h"
#define BtnCount 8
@interface LGClassifyBrandCell()

@property (strong , nonatomic)NSMutableArray *btnArray;

@end

@implementation LGClassifyBrandCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        
        
        [self createUI];
    }
    return self;
}
-(NSMutableArray *)btnArray
{
    if (!_btnArray) {
        _btnArray = [[NSMutableArray alloc]init];
    }
    return _btnArray;
}
-(void)createUI
{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.width, 18)];
    [self.contentView addSubview:label];
    label.text = @"精选品牌";
    label.font = [UIFont boldSystemFontOfSize:16];
    label.contentMode = UIViewContentModeCenter;
    
    float itemW = self.width/BtnCount*2;
    float itemH = 80;
    for (int i = 0; i<BtnCount ; i++)
    {
        UIButton *button = [[UIButton alloc]init];
        button.tag = i;
        button.adjustsImageWhenHighlighted = NO;
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        button.layer.borderWidth = 0.3;
        button.layer.borderColor = [UIColor grayColor].CGColor;
        button.backgroundColor = [UIColor whiteColor];
        
        CGFloat  topX = itemW *(i%4);
        CGFloat  topY = 26+itemH *(i/4);
        CGFloat  topW = itemW;
        CGFloat  topH = itemH;
        button.frame = CGRectMake(topX, topY, topW, topH);
        [self.btnArray addObject:button];
        [self.contentView addSubview:button];
    }
}
-(void)setBrandArray:(NSArray *)brandArray
{
    _brandArray = brandArray;
    for (int i = 0; i<BtnCount; i++)
    {
        UIButton *button = self.btnArray[i];
        if (i<brandArray.count)
        {
            LGClassifyBrandModel *model = brandArray[i];
            [button sd_setImageWithURL:[NSURL URLWithString:model.logo_img] forState:UIControlStateNormal];
        }
        if (i==7) {
            [button setTitle:@"MORE..." forState:UIControlStateNormal];
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        }
    }
}
-(void)buttonClick:(UIButton *)button
{
    LGLog(@"%d",button.tag);
}
@end
