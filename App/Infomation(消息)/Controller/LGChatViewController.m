//
//  LGLoginViewController.m
//  有范吗?
//
//  Created by 唐磊guang on 16/1/9.
//  Copyright (c) 2016年 唐磊guang. All rights reserved.
//

#import "LGChatViewController.h"
#import "XMPPFramework.h"
#import "MBProgressHUD+MJ.h"
#import "AppDelegate.h"
#import "AddFriendViewController.h"
#import "LGChatDetailViewController.h"
//数据管理模型
#import "LGXMPPInfoManagerModel.h"
@interface LGChatViewController ()<XMPPStreamDelegate,UITableViewDataSource,UITableViewDelegate>

{
    XMPPStream *_stream;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong , nonatomic)NSMutableArray *friendArr;

@property (strong , nonatomic)NSMutableDictionary *infoManager;
@end

@implementation LGChatViewController
-(NSMutableArray *)friendArr
{
    if (!_friendArr) {
        _friendArr = [NSMutableArray array];
    }
    return _friendArr;
}
-(NSMutableDictionary *)infoManager
{
    if (!_infoManager) {
        _infoManager = [[NSMutableDictionary alloc]init];
    }
    return _infoManager;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    UIApplication *appcation = [UIApplication sharedApplication];
    id delegate = [appcation delegate];
    _stream = [delegate XMPPStream];
    [self goOnline];
    [_stream addDelegate:self delegateQueue:dispatch_get_main_queue()];
    
    [self setNavBar];
    [self getFriendInfo];
}
-(void)setNavBar
{
    UIButton *button = [self buttonWithTitle:@"退出" AndSel:@selector(drowChat)];
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc]initWithCustomView:button];
    self.navigationItem.leftBarButtonItem = barButton;
    
    UIButton *button1 = [self buttonWithTitle:@"添加" AndSel:@selector(addFriend)];
    UIBarButtonItem *barButton1 = [[UIBarButtonItem alloc]initWithCustomView:button1];
    self.navigationItem.rightBarButtonItem = barButton1;
}
#pragma mark- 获取好友信息
-(void)getFriendInfo
{
    XMPPIQ *iq = [XMPPIQ iqWithType:@"get"];
    [iq addAttributeWithName:@"id" stringValue:@"roster"];
    NSXMLElement *query = [NSXMLElement elementWithName:@"query" xmlns:@"jabber:iq:roster"];
    [iq addChild:query];
    [_stream sendElement:iq];
}

#pragma mark- xmpp的Delegate
-(BOOL)xmppStream:(XMPPStream *)sender didReceiveIQ:(XMPPIQ *)iq
{
    NSXMLElement *query = iq.children[0];
    for (NSXMLElement *item in query.children) {
        NSString *str = item.XMLString;
        
        NSString *nameStr = [self clipTool:str];
        
        [self.friendArr addObject:nameStr];
    }
    [self.tableView reloadData];
    return YES;
}

-(void)xmppStreamDidConnect:(XMPPStream *)sender
{
    NSLog(@"朋友界面已经连接");
}

-(NSString *)clipTool:(NSString *)str
{
    NSRange range = [str rangeOfString:@"\""];
    NSRange rangeEnd = [str rangeOfString:@"@"];
    NSRange result;
    result.location = range.location+1;
    result.length = rangeEnd.location-range.location-1;
    
    NSString *resultStr = [str substringWithRange:result];
    return resultStr;
}

-(UIButton *)buttonWithTitle:(NSString *)titlt AndSel:(SEL)selector
{
    UIButton *button = [[UIButton alloc]init];
    
    button.adjustsImageWhenHighlighted = NO;
    [button addTarget:self action:selector forControlEvents:UIControlEventTouchUpInside];
    button.frame = CGRectMake(0, 0, 44, 44);
    [button setTitle:titlt forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    return button;
}

//上线
- (void)goOnline{
    //<presence/>
    XMPPPresence* presence = [XMPPPresence presence];
    [_stream sendElement:presence];
}

//下线
//- (void)goOffline{
//    //<presence type="unavailable"/>
//    XMPPPresence* presence = [XMPPPresence presenceWithType:@"unavailable"];
//    [_stream sendElement:presence];
//    [_stream disconnect];
//}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
        NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
        [user removeObjectForKey:LGPassWord];
        [user synchronize];
        [self.navigationController popViewControllerAnimated:YES];
    }
}
-(void)addFriend
{
    AddFriendViewController *add = [[AddFriendViewController alloc]init];
    [self.navigationController pushViewController:add animated:YES];
}
-(void)drowChat
{
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"提示" message:@"妹子,不再玩会??" delegate:self cancelButtonTitle:@"再玩会!" otherButtonTitles:@"真有事!", nil];
    [alertView show];
}
#pragma mark- tableView delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.friendArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
        
    }
    cell.textLabel.text = self.friendArr[indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    LGChatDetailViewController *detail = [[LGChatDetailViewController alloc]initWithNibName:@"LGChatDetailViewController" bundle:nil];
    detail.friendID = [self.friendArr[indexPath.row] copy];
    detail.infoArray = [self.infoManager objectForKey:detail.friendID];
    detail.stream = _stream;
    [self.navigationController pushViewController:detail animated:YES];
}

-(void)xmppStream:(XMPPStream *)sender didReceiveMessage:(XMPPMessage *)message
{
    NSLog(@"%@",message.stringValue);
    for (NSString *name in self.friendArr)
    {
        NSRange range = [message.fromStr rangeOfString:@"@"];
        NSString *info = [message.fromStr substringToIndex:range.location];
        if ([info isEqualToString:name])
        {
            static NSMutableArray *array = nil;
            if (!array)
            {
                array = [NSMutableArray array];
            }
            [array addObject:message.stringValue];
            [self.infoManager setValue:array forKey:name];
        }
    }
}
@end
