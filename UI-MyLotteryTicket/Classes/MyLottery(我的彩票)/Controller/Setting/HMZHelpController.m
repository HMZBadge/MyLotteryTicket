//
//  HMZHelpController.m
//  UI-MyLotteryTicket
//
//  Created by 赵志丹 on 15/11/5.
//  Copyright © 2015年 赵志丹. All rights reserved.
//

#import "HMZHelpController.h"
#import "HMZHelp.h"
#import "HMZHelpWebController.h"
#import "HMZNavigationController.h"

@interface HMZHelpController ()
@property (nonatomic, strong) NSArray *helps;
@end
@implementation HMZHelpController

static NSString *cellID = @"helpCellID";

- (void)viewDidLoad{
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
    //    self.tableView re
    self.title = @"常见问题";
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //点击之后跳到webkongzhiqi
    HMZHelpWebController *webVc = [[HMZHelpWebController alloc] init];
    
    webVc.help = self.helps[indexPath.row];
    
//    self.navigationController.viewControllers =
    HMZNavigationController *nav = [[HMZNavigationController alloc] initWithRootViewController:webVc];
    [self presentViewController:nav animated:YES completion:nil];
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.helps.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    HMZHelp *help = self.helps[indexPath.row];
    
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow_right"]];
    [imageView sizeToFit];
    
    cell.textLabel.text = help.title;
    cell.accessoryView = imageView;
    
    
    return cell;
}

//lanjaizai
-(NSArray *)helps{
    if (!_helps) _helps = [HMZHelp helps];
    return _helps;
}
@end
