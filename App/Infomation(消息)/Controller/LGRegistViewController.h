//
//  LGRegistViewController.h
//  有范吗?
//
//  Created by 唐磊guang on 16/1/9.
//  Copyright (c) 2016年 唐磊guang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LGRegistViewController;
@protocol LGRegistViewControllerDelegate <NSObject>

-(void)registViewToChatView:(LGRegistViewController *)LGRegistViewController;

@end

@interface LGRegistViewController : UIViewController

@property (weak , nonatomic)id<LGRegistViewControllerDelegate> registDelegate;


@end
