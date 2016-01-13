//
//  LGChatDetailViewController.h
//  有范吗?
//
//  Created by 唐磊guang on 16/1/11.
//  Copyright (c) 2016年 唐磊guang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XMPPFramework.h"
@interface LGChatDetailViewController : UIViewController

@property (nonatomic , strong)XMPPStream *stream;
@property (nonatomic , strong)NSArray *infoArray;
@property(nonatomic , copy)NSString *friendID;

@end
