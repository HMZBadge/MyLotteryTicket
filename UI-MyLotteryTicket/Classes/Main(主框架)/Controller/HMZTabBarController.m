//
//  HMZTabBarController.m
//  UI-MyLotteryTicket
//
//  Created by 赵志丹 on 15/11/2.
//  Copyright © 2015年 赵志丹. All rights reserved.
//

#import "HMZTabBarController.h"
#import "HMZTabBar.h"

@interface HMZTabBarController () <HMZTabBarDelegate>

@end

@implementation HMZTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //创建箭头所指的控制器
    UIViewController *vc1 = [self loadViewControllerWithSBName:@"Hall"];
    UIViewController *vc2 = [self loadViewControllerWithSBName:@"Arena"];
    UIViewController *vc3 = [self loadViewControllerWithSBName:@"Discover"];
    UIViewController *vc4 = [self loadViewControllerWithSBName:@"History"];
    UIViewController *vc5 = [self loadViewControllerWithSBName:@"MyLottery"];
    
    //添加到tabBar 控制器中
    self.viewControllers = @[vc1,vc2,vc3,vc4,vc5];
    
    HMZTabBar *tabBar = [[HMZTabBar alloc] init];
    tabBar.frame = self.tabBar.bounds;
    tabBar.delegate = self;
    //为按钮添加图片
    for (int i = 0 ; i < self.viewControllers.count; ++i) {
        NSString *imageName = [NSString stringWithFormat:@"TabBar%d",i+1];
        NSString *imageNameSel = [NSString stringWithFormat:@"TabBar%dSel",i+1];
        UIImage *image = [UIImage imageNamed:imageName];
        UIImage *imageSel = [UIImage imageNamed:imageNameSel];
        
        [tabBar addButtonWithImage:image withImageSel:imageSel];//创建的按钮的时候不会调用tabBar 的 LayoutSubViews 方法.
    }
    self.tabBar.userInteractionEnabled = YES;
    [self.tabBar addSubview:tabBar];//只有当要把tabBar添加到视图上要显示的时候才会调用LayoutSubViews 方法
    
}

//实现tabBar 点击按钮 来切换控制器
- (void)tabBar:(HMZTabBar *)tabBar didBtnClick:(UIButton *)sender{
    self.selectedIndex = sender.tag;
}

//根据storyboard文件名称 获取控制器
- (UIViewController *)loadViewControllerWithSBName:(NSString *)name{
    UIStoryboard *sb = [UIStoryboard storyboardWithName:name bundle:nil];
    return sb.instantiateInitialViewController;
}

@end
