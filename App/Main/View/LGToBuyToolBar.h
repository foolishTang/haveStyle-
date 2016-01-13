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

@end

@interface LGToBuyToolBar : UIView

@property (weak , nonatomic)id<LGToBuyToolBarDelegate> delegate;

+(LGToBuyToolBar *)toBayToolBar;

@end
