//
//  LGLookTableViewCell.m
//  有范吗?
//
//  Created by 唐磊guang on 15/12/30.
//  Copyright (c) 2015年 唐磊guang. All rights reserved.
//

#import "LGLookTableViewCell.h"
#import "LGHomeLookModel.h"
#import "UIView+Extension.h"
#import "UIImageView+WebCache.h"
#import "LGHomeLookFrame.h"
#import "LGHomeLookJumpModel.h"
#define ScreenW [UIScreen mainScreen].bounds.size.width
#define ScreenH [UIScreen mainScreen].bounds.size.height
#define ImageCount 4;
@interface LGLookTableViewCell()

@property (nonatomic , weak)UIImageView *topImage;
@property (nonatomic , weak)UIImageView *bigImage;
@property (nonatomic , weak)UIImageView *leftImage;
@property (nonatomic , weak)UIImageView *rightImage;

@end

@implementation LGLookTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        [self createUI];
    }
    return self;
}
-(void)createUI
{
    self.topImage = [self getImageView];
    self.topImage.tag = 3;
    self.bigImage = [self getImageView];
    self.bigImage.tag = 2;
    self.leftImage = [self getImageView];
    self.leftImage.tag = 1;
    self.rightImage = [self getImageView];
    self.rightImage.tag = 0;
    
}

-(UIImageView *)getImageView
{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapPress:)];
    UIImageView *topImage = [[UIImageView alloc]init];
    topImage.userInteractionEnabled = YES;
    [topImage addGestureRecognizer:tap];
    [self.contentView addSubview:topImage];
    return topImage;
}
-(void)tapPress:(UITapGestureRecognizer *)tap
{
    LGHomeLookModel *model = self.lookFrame.lookArr[tap.view.tag];
    NSLog(@"------click %d",(int)tap.view.tag);
    self.lookBlock(model.jump.url);
    
}
-(void)setLookFrame:(LGHomeLookFrame *)lookFrame
{
    if (lookFrame.lookArr.count == 0) {
        return;
    }
    _lookFrame = lookFrame;
    
    LGHomeLookModel *topModel = [lookFrame.lookArr lastObject];
    self.topImage.frame = lookFrame.topFrame;
    
    [self.topImage sd_setImageWithURL:[NSURL URLWithString:topModel.img]];
    
    LGHomeLookModel *bigModel = lookFrame.lookArr[2];

    self.bigImage.frame = lookFrame.bigFrame;
    [self.bigImage sd_setImageWithURL:[NSURL URLWithString:bigModel.img]];
    
    LGHomeLookModel *leftModel = lookFrame.lookArr[1];
    self.leftImage.frame = lookFrame.leftFrame;
    [self.leftImage sd_setImageWithURL:[NSURL URLWithString:leftModel.img]];
    
    LGHomeLookModel *right = lookFrame.lookArr[0];
    self.rightImage.frame = lookFrame.rightFrame;
    [self.rightImage sd_setImageWithURL:[NSURL URLWithString:right.img]];
}

@end
