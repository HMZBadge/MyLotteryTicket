//
//  HMZHallController.m
//  UI-MyLotteryTicket
//
//  Created by 赵志丹 on 15/11/2.
//  Copyright © 2015年 赵志丹. All rights reserved.
//

#import "HMZHallController.h"

@interface HMZHallController ()
@property (weak, nonatomic) UIView *coverView;
@property (weak, nonatomic) UIImageView *imageView;
@end

@implementation HMZHallController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage *image = [UIImage imageNamed:@"CS50_activity_image"];
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    //创建左上角的item
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithImage:image style:UIBarButtonItemStylePlain target:self action:@selector(activity)];
    self.navigationItem.leftBarButtonItem = item;
}

// 点击活动按钮调用
- (void)activity{
    UIView *coverView = [[UIView alloc] init];
    coverView.frame = kScreenSize;
    coverView.backgroundColor = [UIColor blackColor];
    coverView.alpha = 0.5;
    self.coverView = coverView;
    [self.view addSubview: coverView];
    
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"showActivity"]];
    self.imageView = imageView;
    
    imageView.center = CGPointMake(kScreenWidth*0.5, kScreenHeight*0.5);
    imageView.userInteractionEnabled = YES;
    [self.tabBarController.view addSubview:imageView];
    
    
    UIButton *closeBtn = [[UIButton alloc] init];
    UIImage *closeImg = [UIImage imageNamed:@"alphaClose"];
    [closeBtn setImage:closeImg forState:UIControlStateNormal];
    CGFloat x, y, w, h = 0.0;
    w = closeImg.size.width;
    h = closeImg.size.height;
    x = imageView.bounds.size.width - w;
    closeBtn.frame = CGRectMake(x, y, w, h);
    
    [closeBtn addTarget:self action:@selector(closeBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [imageView addSubview:closeBtn];
    
    
}

- (void)closeBtnClick{
    [UIView animateWithDuration:0.25 animations:^{
        self.imageView.alpha = 0;
        self.coverView.alpha = 0;
    } completion:^(BOOL finished) {
        [self.imageView removeFromSuperview];
        [self.coverView removeFromSuperview];
    }];
}



@end
