//
//  LGNewPeopleFrame.m
//  有范吗?
//
//  Created by 唐磊guang on 15/12/31.
//  Copyright (c) 2015年 唐磊guang. All rights reserved.
//

#import "LGNewPeopleFrame.h"
#import "LGNewPeopleModel.h"
@implementation LGNewPeopleFrame

-(void)setPeople:(LGNewPeopleModel *)people
{
    _people = people;
    CGFloat  X = 0;
    CGFloat  Y = 0;
    CGFloat  W = people.fitW;
    CGFloat  H = people.fitH;
    self.frame = CGRectMake(X, Y, W, H);
}

@end
