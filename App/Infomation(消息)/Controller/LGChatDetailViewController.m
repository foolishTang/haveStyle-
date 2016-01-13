//
//  LGChatDetailViewController.m
//  有范吗?
//
//  Created by 唐磊guang on 16/1/11.
//  Copyright (c) 2016年 唐磊guang. All rights reserved.
//

#import "LGChatDetailViewController.h"

#import "MBProgressHUD+MJ.h"

@interface LGChatDetailViewController ()<XMPPStreamDelegate,UITextFieldDelegate>


@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong , nonatomic)NSMutableArray *messageArray;
@property (weak, nonatomic) IBOutlet UIView *textField;
@property (weak, nonatomic) IBOutlet UITextField *realTextFiled;


@end

@implementation LGChatDetailViewController

-(NSMutableArray *)messageArray
{
    if (!_messageArray) {
        _messageArray = [NSMutableArray array];
        [_messageArray addObjectsFromArray:self.infoArray];
    }
    return _messageArray;
}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    return YES;
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    XMPPMessage *message = [XMPPMessage messageWithType:@"chat" to:[XMPPJID jidWithString:[NSString stringWithFormat:@"%@@%@",self.friendID,HOST]]];
    
    NSXMLElement* body = [NSXMLElement elementWithName:@"body" stringValue:textField.text];
    [message addChild:body];
    [_stream sendElement:message];
    textField.text = @"";
    
    return YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
//    UIApplication *appcation = [UIApplication sharedApplication];
//    id delegate = [appcation delegate];
//    _stream = [delegate XMPPStream];
//    //[self goOnline];
    [_stream addDelegate:self delegateQueue:dispatch_get_main_queue()];
    [self.tableView reloadData];
    
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyBoardWillAppear:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyBoardWillDisappear:) name:UIKeyboardWillHideNotification object:nil];
}
#pragma mark- 键盘弹起收起的监听
-(void)keyBoardWillAppear:(NSNotification *)notice
{
    CGFloat duration = [notice.userInfo[UIKeyboardAnimationDurationUserInfoKey] floatValue];
    CGRect rect = [notice.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue] ;
    [UIView animateWithDuration:duration animations:^{
        self.textField.transform = CGAffineTransformMakeTranslation(0, -rect.size.height);
    }];
}
-(void)keyBoardWillDisappear:(NSNotification *)notice
{
    CGFloat duration = [notice.userInfo[UIKeyboardAnimationDurationUserInfoKey] floatValue];
    
    [UIView animateWithDuration:duration animations:^{
        self.textField.transform = CGAffineTransformIdentity;
    }];
}
-(void)xmppStream:(XMPPStream *)sender didReceiveMessage:(XMPPMessage *)message
{
    NSRange range = [message.fromStr rangeOfString:@"@"];
    NSString *info = [message.fromStr substringToIndex:range.location];
    NSLog(@"%@",info);
    if ([info isEqualToString:self.friendID]) {
        [self.messageArray addObject:message.stringValue];
        [self.tableView reloadData];
        [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForItem:self.messageArray.count-1 inSection:0] atScrollPosition:UITableViewScrollPositionBottom animated:YES];
    }
}

#pragma mark- tableView delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return self.messageArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
        
    }
    NSString *info = [NSString stringWithFormat:@"%@:%@",self.friendID,self.messageArray[indexPath.row]];
    cell.textLabel.text = info;
    return cell;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
