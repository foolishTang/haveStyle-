//
//  LGOtherTableViewCell.h
//  有范吗?
//
//  Created by 唐磊guang on 15/12/31.
//  Copyright (c) 2015年 唐磊guang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LGOtherFrame,LGNewClothFrame,LGOtherModel;

@protocol LGOtherTableViewCellDelegate <NSObject>

@optional
-(void)toGoDetail:(LGOtherModel *)model;

@end




typedef void(^LGOtherBlock)(LGOtherModel *model,int tag);
@interface LGOtherTableViewCell : UITableViewCell

@property (strong , nonatomic)LGOtherFrame *otherFrame;
@property (strong , nonatomic)LGNewClothFrame *brandFrame;

@property (weak , nonatomic)id<LGOtherTableViewCellDelegate> LGOtherDelegate;

@end
