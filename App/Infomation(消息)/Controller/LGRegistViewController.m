//
//  LGRegistViewController.m
//  有范吗?
//
//  Created by 唐磊guang on 16/1/9.
//  Copyright (c) 2016年 唐磊guang. All rights reserved.
//

#import "LGRegistViewController.h"
#import "XMPPFramework.h"
#import "MBProgressHUD+MJ.h"
#import "AppDelegate.h"
@interface LGRegistViewController ()<XMPPStreamDelegate>

{
    XMPPStream *_stream;
}

@property (weak, nonatomic) IBOutlet UITextField *accountText;
@property (weak, nonatomic) IBOutlet UITextField *passWord;



@end

@implementation LGRegistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
//    AppDelegate *app = [UIApplication sharedApplication].delegate;
    UIApplication *appcation = [UIApplication sharedApplication];
    id delegate = [appcation delegate];
    
    _stream = [delegate XMPPStream];
    [_stream addDelegate:self delegateQueue:dispatch_get_main_queue()];
    
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

- (IBAction)regist:(UIButton *)sender
{
    if (_stream.isConnected)
    {
        [self goOffline];
    }
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    [user setValue:self.accountText.text forKey:LGAccount];
    [user setValue:self.passWord.text forKey:LGPassWord];
    [user synchronize];
    [_stream setMyJID:[XMPPJID jidWithString:[NSString stringWithFormat:@"%@@%@",self.accountText.text,HOST]]];
    _stream.tag = @"注册";
    [_stream connectWithTimeout:6 error:nil];
}
- (IBAction)toLogin:(UIButton *)sender
{
    
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)xmppStreamDidRegister:(XMPPStream *)sender
{
    [MBProgressHUD showSuccess:@"注册成功"];
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    [user setValue:self.accountText.text forKey:LGAccount];
    [user setValue:self.passWord.text forKey:LGPassWord];
    [user synchronize];
    [self.registDelegate registViewToChatView:self];
    [self.navigationController popViewControllerAnimated:NO];
}

-(void)xmppStream:(XMPPStream *)sender didNotRegister:(DDXMLElement *)error
{
    [MBProgressHUD showError:@"注册失败"];
}




//连接成功的回调


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
