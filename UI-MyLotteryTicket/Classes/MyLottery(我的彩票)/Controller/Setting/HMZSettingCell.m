//
//  HMZSettingCell.m
//  UI-MyLotteryTicket
//
//  Created by 赵志丹 on 15/11/3.
//  Copyright © 2015年 赵志丹. All rights reserved.
//

#import "HMZSettingCell.h"

@interface HMZSettingCell ()

@end
@implementation HMZSettingCell

+ (instancetype)settingCellWithTableView:(UITableView *)tableView withItem:(NSDictionary *)item{
    NSString* cellid = @"";
    if (item[@"cellType"] && [item[@"cellType"] length] > 0) {
        cellid = item[@"cellType"];
    }
    else {
        cellid = @"UITableViewCellStyleDefault";
    }

    HMZSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if (!cell) {
        cell = [[HMZSettingCell alloc ] initWithStyle:[self loadTableViewCellStyleWithItem:item] reuseIdentifier:cellid];
    }
    return cell;
}

- (void)setItem:(NSDictionary *)item{
    _item = item;
    self.textLabel.text = item[@"title"];
    
    // 判断icon是不是有值
    if (item[@"icon"] && [item[@"icon"] length] > 0) {
        self.imageView.image = [UIImage imageNamed:item[@"icon"]];
    }
    
    // 设置subtitle
    self.detailTextLabel.text = item[@"subTitle"];
    
    // 设置颜色
    if ([item[@"isRed"] boolValue]) {
        self.detailTextLabel.textColor = [UIColor redColor];
    }
    NSString* accessoryView = item[@"accessoryView"]; // 某一个类型的字符串 比如 @"UISwitch" @"UIImageView"
    Class Clz = NSClassFromString(accessoryView); // 某一个类型 比如 UISwitch UIImageView
    UIView* accView = [[Clz alloc] init]; // 某一个对象 比如  UISwith对象  UIImageView对象
    
    if ([accView isKindOfClass:[UIImageView class]]) { // 如果创建出来的对象是UIImageView类型
        // 设置图片
        UIImageView* imageView = (UIImageView*)accView;
        imageView.image = [UIImage imageNamed:item[@"accessoryContent"]];
        [imageView sizeToFit]; // 把大小变成和内容一样的大小 仅仅是大小
    }
    else if ([accView isKindOfClass:[UISwitch class]]){
        UISwitch *switcher = (UISwitch *)accView;
        NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
        switcher.on = [ud boolForKey:item[@"switchKey"]];
        
        [switcher addTarget:self action:@selector(valueChage:) forControlEvents:UIControlEventValueChanged];
    }
    self.accessoryView = accView; // 设置右边的view
}

- (void)valueChage:(UISwitch *)sender{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud setBool:sender.on forKey:self.item[@"switchKey"]];
    [ud synchronize];
}


/**
 *  通过cell的信息的cellType不同的值 返回不同的cell的样式
 *
 *  @param item cell的信息
 *
 *  @return cell的样式
 */
+ (UITableViewCellStyle)loadTableViewCellStyleWithItem:(NSDictionary*)item
{
    NSString* cellType = item[@"cellType"];
    
    if ([cellType isEqualToString:@"UITableViewCellStyleSubtitle"]) {
        return UITableViewCellStyleSubtitle;
    }
    else if ([cellType isEqualToString:@"UITableViewCellStyleValue1"]) {
        return UITableViewCellStyleValue1;
    }
    else if ([cellType isEqualToString:@"UITableViewCellStyleValue2"]) {
        return UITableViewCellStyleValue2;
    }
    else {
        return UITableViewCellStyleDefault;
    }
}
@end
