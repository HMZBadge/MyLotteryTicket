//
//  HMZAboutController.m
//  UI-MyLotteryTicket
//
//  Created by 赵志丹 on 15/11/6.
//  Copyright © 2015年 赵志丹. All rights reserved.
//

#import "HMZAboutController.h"
#import "HMZAboutHeaderView.h"

@interface HMZAboutController ()

@end

@implementation HMZAboutController

- (void)viewDidLoad {
    [super viewDidLoad];
    HMZAboutHeaderView *header = [HMZAboutHeaderView aboutHeaderView];
    self.tableView.tableHeaderView = header;
}



@end
