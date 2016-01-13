//
//  AddFriendViewController.m
//  有范吗?
//
//  Created by 唐磊guang on 16/1/11.
//  Copyright (c) 2016年 唐磊guang. All rights reserved.
//

#import "AddFriendViewController.h"
#import "XMPPFramework.h"
#import "MBProgressHUD+MJ.h"
#import "AppDelegate.h"
@interface AddFriendViewController ()<XMPPStreamDelegate>


{
    XMPPStream *_stream;
}
@property (weak, nonatomic) IBOutlet UITextField *addAcount;
@property (weak, nonatomic) IBOutlet UIButton *addButton;

@end

@implementation AddFriendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIApplication *appcation = [UIApplication sharedApplication];
    id delegate = [appcation delegate];
    _stream = [delegate XMPPStream];
    //[self goOnline];
    [_stream addDelegate:self delegateQueue:dispatch_get_main_queue()];
}
- (IBAction)add:(UIButton *)sender
{
    if (!_stream.isConnected)
    {
        XMPPPresence* presence = [XMPPPresence presence];
        [_stream sendElement:presence];

    }
    
    XMPPPresence *presence = [XMPPPresence presenceWithType:@"subscribe" to:[XMPPJID jidWithString:[NSString stringWithFormat:@"%@@%@",self.addAcount.text,HOST]]];
    [_stream sendElement:presence];
}

//接收好友请求
- (void)xmppStream:(XMPPStream *)sender didReceivePresence:(XMPPPresence *)presence{
    //判断是否是一个好友请求
    if ([presence.type isEqualToString:@"subscribe"]) {
        //同意好友请求
        XMPPPresence* pre = [XMPPPresence presenceWithType:@"subscribed" to:presence.from];
        [_stream sendElement:pre];
    }
    //判断是否添加成功
    if ([presence.type isEqualToString:@"subscribed"]) {
        NSLog(@"添加好友 %@ 成功", presence.fromStr);
    }
}



@end
