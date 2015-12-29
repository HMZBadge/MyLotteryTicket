//
//  HMZNavigationController.m
//  UI-MyLotteryTicket
//
//  Created by 赵志丹 on 15/11/2.
//  Copyright © 2015年 赵志丹. All rights reserved.
//

#import "HMZNavigationController.h"

@interface HMZNavigationController ()

@end

@implementation HMZNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];

   
    //设置导航条的背景图片
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
    // 设置文字的颜色为白色
    [self.navigationBar setTitleTextAttributes:@{ NSForegroundColorAttributeName : [UIColor whiteColor] }];
    
    // 设置默认渲染的颜色白色
    [self.navigationBar setTintColor:[UIColor whiteColor]];
//    [self.navigationBar setBarTintColor:[UIColor whiteColor]];
}

//重写导航控制器的push方法,让所有push进来的控制器隐藏bottom Bar.
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    viewController.hidesBottomBarWhenPushed = YES;
    [super pushViewController:viewController animated:animated];
}

//状态栏设为白色
- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

@end
