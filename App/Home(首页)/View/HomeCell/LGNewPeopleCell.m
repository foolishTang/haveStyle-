//
//  LGNewPeopleCell.m
//  有范吗?
//
//  Created by 唐磊guang on 15/12/31.
//  Copyright (c) 2015年 唐磊guang. All rights reserved.
//

#import "LGNewPeopleCell.h"
#import "LGNewPeopleFrame.h"
#import "UIButton+WebCache.h"
#import "LGNewPeopleModel.h"
@interface LGNewPeopleCell()

@property (strong , nonatomic)UIButton *button;

@end

@implementation LGNewPeopleCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.button = [[UIButton alloc]init];
        [self.contentView addSubview:self.button];
        [self.button addTarget:self action:@selector(pressNewPeople:) forControlEvents:UIControlEventTouchUpInside];
        self.button.adjustsImageWhenHighlighted = NO;
    }
    return self;
}

-(void)setPeople:(LGNewPeopleFrame *)people
{
    _people = people;
    self.button.frame = people.frame;
    [self.button sd_setBackgroundImageWithURL:[NSURL URLWithString:people.people.img] forState:UIControlStateNormal];
}
-(void)pressNewPeople:(UIButton *)btn
{
    self.block(self.people.people.url);
}

@end
