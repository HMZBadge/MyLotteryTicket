//
//  HMZAboutHeaderView.m
//  UI-MyLotteryTicket
//
//  Created by 赵志丹 on 15/11/6.
//  Copyright © 2015年 赵志丹. All rights reserved.
//

#import "HMZAboutHeaderView.h"

@implementation HMZAboutHeaderView

+ (instancetype)aboutHeaderView{
    return [[NSBundle mainBundle] loadNibNamed:@"HMZAboutHeaderView" owner:nil options:nil][0];
}

@end
