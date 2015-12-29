//
//  HMZLotteryController.m
//  UI-MyLotteryTicket
//
//  Created by 赵志丹 on 15/11/2.
//  Copyright © 2015年 赵志丹. All rights reserved.
//

#import "HMZLotteryController.h"
#import "HMZSettingController.h"
#import "HMZHelpController.h"

@interface HMZLotteryController ()
@property (weak, nonatomic) IBOutlet UIButton *login;
@property (weak, nonatomic) IBOutlet UIButton *regs;

@end
@implementation HMZLotteryController
- (IBAction)jumpToSetting:(UIButton *)sender {
    HMZSettingController *vc = [[HMZSettingController alloc] init];
    vc.title = @"设置";
    vc.plistName = @"Setting";
    [self.navigationController pushViewController:vc animated:YES];
    
    //添加"常见问题" 按钮
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"常见问题" style:UIBarButtonItemStyleDone target:self action:@selector(help)];
    vc.navigationItem.rightBarButtonItem = rightItem;

}

- (void)help{
    HMZHelpController *helpVc = [[HMZHelpController alloc] init];
    [self.navigationController pushViewController:helpVc animated:YES];
}


- (void)viewDidLoad{
    UIImage *image = [UIImage imageNamed:@"RedButton"];
    UIImage *imagePress = [UIImage imageNamed:@"RedButtonPressed"];
    
    image = [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
    imagePress = [imagePress stretchableImageWithLeftCapWidth:imagePress.size.width * 0.5 topCapHeight:imagePress.size.height * 0.5];
    [self.login setBackgroundImage:image forState:UIControlStateNormal];
    [self.login setBackgroundImage:imagePress forState:UIControlStateHighlighted];
    
    [self.regs setBackgroundImage:image forState:UIControlStateNormal];
    [self.regs setBackgroundImage:imagePress forState:UIControlStateHighlighted];

    
    
}

@end
