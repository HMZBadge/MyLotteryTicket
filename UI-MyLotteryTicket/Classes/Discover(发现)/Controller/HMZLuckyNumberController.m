//
//  HMZLuckyNumberController.m
//  UI-MyLotteryTicket
//
//  Created by 赵志丹 on 15/11/2.
//  Copyright © 2015年 赵志丹. All rights reserved.
//

#import "HMZLuckyNumberController.h"

@interface HMZLuckyNumberController ()
@property (weak, nonatomic) IBOutlet UIImageView *lightImageView;

@end

@implementation HMZLuckyNumberController

- (void)viewDidLoad{
    [super viewDidLoad];
    
    self.lightImageView.animationImages = @[ [UIImage imageNamed:@"lucky_entry_light0"],  [UIImage imageNamed:@"lucky_entry_light1"]];
    self.lightImageView.animationDuration = 1;
    [self.lightImageView startAnimating];
}

@end
