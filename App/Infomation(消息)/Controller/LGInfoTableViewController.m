//
//  LGInfoTableViewController.m
//  有范吗?
//
//  Created by 唐磊guang on 15/12/30.
//  Copyright (c) 2015年 唐磊guang. All rights reserved.
//

#import "LGInfoTableViewController.h"
#import "LGRegistViewController.h"
#import "LGChatViewController.h"
#import "XMPPFramework.h"
#import "AppDelegate.h"
#import "MBProgressHUD+MJ.h"
@interface LGInfoTableViewController ()<UIAlertViewDelegate,LGRegistViewControllerDelegate,XMPPStreamDelegate>

{
    XMPPStream *_stream;
}

@property (weak, nonatomic) IBOutlet UITextField *accountText;
@property (weak, nonatomic) IBOutlet UITextField *passWordText;



@end

@implementation LGInfoTableViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIApplication *appcation = [UIApplication sharedApplication];
    id delegate = [appcation delegate];
    
    _stream = [delegate XMPPStream];
    [_stream addDelegate:self delegateQueue:dispatch_get_main_queue()];
    [self selectViewController];
}

-(void)selectViewController
{
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    if (![user objectForKey:LGAccount] || ![user objectForKey:LGPassWord])
    {
        if ([user objectForKey:LGAccount])
        {
            self.accountText.text = [user objectForKey:LGAccount];
            self.passWordText.text = [user objectForKey:LGPassWord];
        }
    }
    else
    {
        self.accountText.text = self.accountText.text = [user objectForKey:LGAccount];
        self.passWordText.text = [user objectForKey:LGPassWord];
        [self tochatView];
    }
}
//上线
//- (void)goOnline{
//    //<presence/>
//    XMPPPresence* presence = [XMPPPresence presence];
//    [_stream sendElement:presence];
//}

//下线
- (void)goOffline{
    //<presence type="unavailable"/>
    XMPPPresence* presence = [XMPPPresence presenceWithType:@"unavailable"];
    [_stream sendElement:presence];
    [_stream disconnect];
}
-(void)toRegist
{
    LGRegistViewController *regist = [[LGRegistViewController alloc]initWithNibName:@"LGRegistViewController" bundle:nil];
    regist.registDelegate = self;
    [self.navigationController pushViewController:regist animated:YES];
}
-(void)tochatView
{
    if ([_stream isConnected]) {
        [self goOffline];
    }
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSString *account = [user objectForKey:LGAccount];
    [_stream setMyJID:[XMPPJID jidWithString:[NSString stringWithFormat:@"%@@%@",account,HOST]]];
    [_stream connectWithTimeout:9 error:nil];
    
}
#pragma mark- xmpp代理方法
-(void)xmppStreamDidConnect:(XMPPStream *)sender
{
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSString *passWord = [user objectForKey:LGPassWord];
    if (passWord == nil) {
        passWord = self.passWordText.text;
        [user setObject:passWord forKey:LGPassWord];
        [user synchronize];
    }
    //登录界面
    if ([sender.tag isEqual:@"注册"]) {
        
        
        [_stream registerWithPassword:passWord error:nil];
    }
    else
    {
    [_stream authenticateWithPassword:passWord error:nil];
    }
}

-(void)xmppStreamDidAuthenticate:(XMPPStream *)sender
{
//    [self goOnline];

    self.passWordText.text = @"";
    LGChatViewController *chat = [[LGChatViewController alloc]initWithNibName:@"LGChatViewController" bundle:nil];
    [self.navigationController pushViewController:chat animated:YES];
}

//登录失败调用
-(void)xmppStream:(XMPPStream *)sender didNotAuthenticate:(DDXMLElement *)error
{
    [MBProgressHUD showError:@"密码错误"];
    
}
//断开连接时调用
-(void)xmppStreamDidDisconnect:(XMPPStream *)sender withError:(NSError *)error
{
    NSLog(@"断开连接");
}
//连接超时
-(void)xmppStreamConnectDidTimeout:(XMPPStream *)sender
{
    
}

#pragma mark - alert view delegate



-(void)registViewToChatView:(LGRegistViewController *)LGRegistViewController
{
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
  
     NSString * passWord = [user objectForKey:LGPassWord];

    [_stream authenticateWithPassword:passWord error:nil];

}

- (IBAction)login:(UIButton *)sender {
    [self tochatView];
    
}
- (IBAction)regist:(UIButton *)sender {
    [self toRegist];
}
- (IBAction)findPassWord:(id)sender {
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    if (touch.view == self.view) {
        [self.accountText resignFirstResponder];
        [self.passWordText resignFirstResponder];
    }
}

@end
