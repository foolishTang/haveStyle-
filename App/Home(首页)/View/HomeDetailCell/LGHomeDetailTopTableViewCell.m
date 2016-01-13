//
//  LGHomeDetailTopTableViewCell.m
//  有范吗?
//
//  Created by 唐磊guang on 16/1/4.
//  Copyright (c) 2016年 唐磊guang. All rights reserved.
//

#import "LGHomeDetailTopTableViewCell.h"
#import "LGDetailTopSelectView.h"
#import "LGHomeDetailTopModel.h"
#import "LGHomeDetailTopFrame.h"
#import "UIButton+WebCache.h"
@interface LGHomeDetailTopTableViewCell()

@property (weak , nonatomic)UIButton *imageBtn;
@property (weak , nonatomic)LGDetailTopSelectView *selectView;

@end

@implementation LGHomeDetailTopTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        UIButton *button = [[UIButton alloc]init];
        [self.contentView addSubview:button];
        self.imageBtn = button;
        
        LGDetailTopSelectView *selector = [[LGDetailTopSelectView alloc]init];
        [selector setBlock:^(int tid) {
            self.block(tid);
        }];
        [self.contentView addSubview:selector];
        self.selectView = selector;
    }
    return self;
}


-(void)setTopFrame:(LGHomeDetailTopFrame *)topFrame
{
    //大图
    LGHomeDetailTopModel *model = topFrame.topModel;
    
    [self.imageBtn sd_setBackgroundImageWithURL:[NSURL URLWithString:model.img] forState:UIControlStateNormal];
    self.imageBtn.frame = topFrame.imageBtnFrame;
    
    //选择的小图
    self.selectView.frame = topFrame.selectViewFrame;
    self.selectView.backgroundColor = [UIColor whiteColor];
    self.selectView.array = model.middle;
}


@end
