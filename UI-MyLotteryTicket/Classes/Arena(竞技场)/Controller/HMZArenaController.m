//
//  HMZArenaController.m
//  UI-MyLotteryTicket
//
//  Created by 赵志丹 on 15/11/2.
//  Copyright © 2015年 赵志丹. All rights reserved.
//

#import "HMZArenaController.h"

@interface HMZArenaController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *seg;

@end

@implementation HMZArenaController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"NLArenaNavBar64"] forBarMetrics:UIBarMetricsDefault];
    
    self.view.layer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"NLArenaBackground"].CGImage);
 
    //[self.seg setTintColor:[UIColor whiteColor]];
    [self.seg setBackgroundImage:[UIImage imageNamed:@"CPArenaSegmentBG"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [self.seg setBackgroundImage:[UIImage imageNamed:@"CPArenaSegmentSelectedBG"] forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
    
    [self.seg setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]} forState:UIControlStateNormal];
    [self.seg setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]} forState:UIControlStateSelected];
    
    [self.seg setTintColor:[UIColor clearColor]];
    
    
}

@end
