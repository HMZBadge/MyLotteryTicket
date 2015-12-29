//
//  HMZGroupBuyButton.m
//  UI-MyLotteryTicket
//
//  Created by 赵志丹 on 15/11/2.
//  Copyright © 2015年 赵志丹. All rights reserved.
//

#import "HMZGroupBuyButton.h"
#import "UIView+HMZFrame.h"

@implementation HMZGroupBuyButton

- (void)layoutSubviews{
    [super layoutSubviews];
    self.titleLabel.x = 0; //交换一下 label 和图片的位置
    self.imageView.x = self.titleLabel.w;
}
@end
