//
//  LGNewPeopleFrame.h
//  有范吗?
//
//  Created by 唐磊guang on 15/12/31.
//  Copyright (c) 2015年 唐磊guang. All rights reserved.
//

#import "LGBaseModel.h"

@class LGNewPeopleModel;
@interface LGNewPeopleFrame : LGBaseModel

@property (strong , nonatomic)LGNewPeopleModel* people;

@property(assign , nonatomic)CGRect frame;


@end
