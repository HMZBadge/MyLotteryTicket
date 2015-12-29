//
//  HMZTabBar.m
//  UI-MyLotteryTicket
//
//  Created by 赵志丹 on 15/11/2.
//  Copyright © 2015年 赵志丹. All rights reserved.
//

#import "HMZTabBar.h"

@interface HMZTabBar ()
@property (nonatomic,weak) UIButton *currentButton;
@end
@implementation HMZTabBar

//创建按钮 并设置图片.
- (void)addButtonWithImage:(UIImage *)image withImageSel:(UIImage *)imageSel{
    UIButton *btn = [[UIButton alloc] init];
    [btn setImage:image forState:UIControlStateNormal];
    [btn setImage:imageSel forState:UIControlStateSelected];
    
    
    //添加高亮状态的图片
    [btn setImage:imageSel forState:UIControlStateHighlighted];
    
    //设置frame 在layoutSubViews 中,这个一定不要忘
     [self addSubview:btn];
    
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
   
}

- (void)btnClick:(UIButton *)sender{
    self.currentButton.selected = NO;
    sender.selected = YES;
    self.currentButton = sender;
    
    if ([self.delegate respondsToSelector:@selector(tabBar:didBtnClick:)]) {
        [self.delegate tabBar:self didBtnClick:sender];
    }
}

- (void)layoutSubviews{//了解一下 他的执行流程
    [super layoutSubviews];//这个千万 千万 不要忘了写
    
    for (int i = 0 ; i < self.subviews.count; ++i) {
        UIButton *btn = self.subviews[i];
        CGFloat x, y, w, h;
        w = kScreenWidth / 5;
        h = 49;
        x = w * i;
        y = 0;
        btn.frame = CGRectMake(x, y, w, h);
        
        btn.tag = i;//用来切换控制器;
        
        if (i == 4){
            [self btnClick:btn];
        }
    }
}

@end
