//
//  HMZTabBar.h
//  UI-MyLotteryTicket
//
//  Created by 赵志丹 on 15/11/2.
//  Copyright © 2015年 赵志丹. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HMZTabBar;

@protocol HMZTabBarDelegate <NSObject>

@optional
//按钮点击事件的代理方法
- (void)tabBar:(HMZTabBar *)tabBar didBtnClick:(UIButton *)sender;
@end

@interface HMZTabBar : UIView

@property (weak, nonatomic) id <HMZTabBarDelegate> delegate;

- (void)addButtonWithImage:(UIImage *)image withImageSel:(UIImage *)imageSel;
@end
