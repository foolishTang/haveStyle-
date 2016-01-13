//
//  LGLeftTableViewController.m
//  有范吗?
//
//  Created by 唐磊guang on 16/1/12.
//  Copyright (c) 2016年 唐磊guang. All rights reserved.
//

#import "LGLeftTableViewController.h"
#import "ZBarSDK.h"
@interface LGLeftTableViewController ()<UINavigationControllerDelegate,UIImagePickerControllerDelegate
>
@property (weak, nonatomic) IBOutlet UIButton *scanButton;
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;

@end

@implementation LGLeftTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}
- (IBAction)scanBtnClick:(id)sender
{
    ZBarReaderController *zbarController = [[ZBarReaderController alloc]init];
   zbarController.delegate = self;
    [self presentViewController:zbarController animated:YES completion:^{
        
    }];
    
}
#pragma mark- 扫一扫回调的代理方法
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    id<NSFastEnumeration>results = [info objectForKey:ZBarReaderControllerResults];
    ZBarSymbol *symbol  = nil;
    for (symbol in results) {
        break;
    }
    NSLog(@"%@",symbol.data);
    [picker dismissViewControllerAnimated:YES completion:^{
        
    }];
    
}
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
}
@end
