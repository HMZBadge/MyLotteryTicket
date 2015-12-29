//
//  HMZGroupBuyController.m
//  UI-MyLotteryTicket
//
//  Created by 赵志丹 on 15/11/2.
//  Copyright © 2015年 赵志丹. All rights reserved.
//

#import "HMZGroupBuyController.h"
#import "UIView+HMZFrame.h"
@interface HMZGroupBuyController ()
@property (weak, nonatomic) UIView *blueView;

@end

@implementation HMZGroupBuyController
- (IBAction)groupBuyClick:(UIButton *)sender {
    [UIView animateWithDuration:0.25 animations:^{
        self.blueView.h = self.blueView.h ? 0 : 300;
        sender.imageView.transform = CGAffineTransformRotate(sender.imageView.transform, M_PI);
    }];
}

- (UIView *)blueView{
    if (_blueView ==nil) {
        UIView *blueView = [[UIView alloc] init];
        blueView.backgroundColor = [UIColor blueColor];
        blueView.frame = CGRectMake(0, 64, kScreenWidth, 0);
        
        _blueView = blueView;
        [self.view addSubview:blueView];
    }
    return _blueView;
}




- (void)viewDidLoad {
    [super viewDidLoad];
    [self blueView];
}

@end
