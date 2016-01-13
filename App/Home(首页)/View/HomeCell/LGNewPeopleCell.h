//
//  LGNewPeopleCell.h
//  有范吗?
//
//  Created by 唐磊guang on 15/12/31.
//  Copyright (c) 2015年 唐磊guang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LGNewPeopleFrame;
typedef void(^newBlock)(NSString *urlString);
@interface LGNewPeopleCell : UITableViewCell

@property (nonatomic , strong)LGNewPeopleFrame *people;

@property (copy , nonatomic)newBlock block;

-(void)setBlock:(newBlock)block;

@end
