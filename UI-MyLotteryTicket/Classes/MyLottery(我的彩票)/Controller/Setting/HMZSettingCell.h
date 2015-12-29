//
//  HMZSettingCell.h
//  UI-MyLotteryTicket
//
//  Created by 赵志丹 on 15/11/3.
//  Copyright © 2015年 赵志丹. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HMZSettingCell : UITableViewCell
@property (nonatomic, strong) NSDictionary *item;

+ (instancetype)settingCellWithTableView:(UITableView *)tableView withItem:(NSDictionary *)item;
@end
