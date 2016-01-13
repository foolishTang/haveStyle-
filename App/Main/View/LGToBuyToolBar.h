//
//  LGToBuyToolBar.h
//  有范吗?
//
//  Created by 唐磊guang on 16/1/13.
//  Copyright (c) 2016年 唐磊guang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LGToBuyToolBarDelegate <NSObject>

-(void)toBayViewController;

-(void)calculateAllMoney:(BOOL)allOrZero;
@end

@interface LGToBuyToolBar : UIView

@property (assign , nonatomic)NSInteger allMoney;

@property (weak , nonatomic)id<LGToBuyToolBarDelegate> delegate;

+(LGToBuyToolBar *)toBayToolBar;

@end
