//
//  HMZLiveController.m
//  UI-MyLotteryTicket
//
//  Created by 赵志丹 on 15/11/4.
//  Copyright © 2015年 赵志丹. All rights reserved.
//

#import "HMZLiveController.h"
#import "UIView+HMZFrame.h"

@interface HMZLiveController ()

@property (nonatomic, weak) UIDatePicker *datePicker;

@end
@implementation HMZLiveController

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return;
    }
    
    UITextField *textField = [[UITextField alloc] init];
    
    UIDatePicker *datePicker = [[UIDatePicker alloc] init];
    datePicker.datePickerMode = UIDatePickerModeTime;
    datePicker.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh-CN"];
    
    self.datePicker = datePicker;
    
    UIToolbar *bar = [[UIToolbar alloc] init];
    
    UIBarButtonItem *cancelItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancel)];
    UIBarButtonItem *flexiblePlace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
     UIBarButtonItem *prepItem = [[UIBarButtonItem alloc] initWithTitle:@"上一项" style:UIBarButtonItemStylePlain target:self action:@selector(done)];
    UIBarButtonItem *nextItem = [[UIBarButtonItem alloc] initWithTitle:@"下一项" style:UIBarButtonItemStylePlain target:self action:@selector(done)];
    
    UIBarButtonItem *doneItem = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(done)];
    bar.items = @[cancelItem,flexiblePlace, prepItem, nextItem, doneItem];
    bar.h = 44;
    
    //进入编辑视图
    textField.inputView = datePicker;
    //添加辅助视图
    textField.inputAccessoryView = bar;
    
    //获取点击cell
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    [cell addSubview:textField];
    
    [textField becomeFirstResponder];
}

- (void)cancel{
    [self.view endEditing:YES];
}

- (void)done{
    //获取控件选取的时间
    NSDate *date = self.datePicker.date;
    
    //创建日期格式化对象
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    //设置格式化样式
    df.dateFormat = @"HH:mm";
    //获取格式化字符串
    NSString *time = [df stringFromDate:date];
    //获取当前选中行的indexPath
    NSIndexPath *path = [self.tableView indexPathForSelectedRow];
    //根据indexPath 获取当前选中的cell.
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:path];
    
    //设置subTitle
    cell.detailTextLabel.text = time;
    
    [self cancel];
}

@end
