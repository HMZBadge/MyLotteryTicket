//
//  HMZProductCell.m
//  UI-MyLotteryTicket
//
//  Created by 赵志丹 on 15/11/5.
//  Copyright © 2015年 赵志丹. All rights reserved.
//

#import "HMZProductCell.h"

@interface HMZProductCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel  *title;

@end
@implementation HMZProductCell

- (void)setProduct:(HMZProduct *)product{
    _product = product;
    self.iconView.layer.cornerRadius = 10;
    self.iconView.layer.masksToBounds = YES;
    self.iconView.image = [UIImage imageNamed:product.icon];
    self.title.text = product.title;
}
@end
