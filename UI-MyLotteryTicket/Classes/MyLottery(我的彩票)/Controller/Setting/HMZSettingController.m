//
//  HMZSettingController.m
//  UI-MyLotteryTicket
//
//  Created by 赵志丹 on 15/11/2.
//  Copyright © 2015年 赵志丹. All rights reserved.
//

#import "HMZSettingController.h"
#import "HMZSettingCell.h"

@interface HMZSettingController ()

@property (weak ,nonatomic) NSArray *groups;

@end
@implementation HMZSettingController

- (instancetype)init
{
    return [super initWithStyle:UITableViewStyleGrouped];
}

- (instancetype)initWithStyle:(UITableViewStyle)style{
    return [super initWithStyle:style];
}

- (NSArray *)groups{
    if (!_groups) {
        _groups = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:self.plistName ofType:@"plist"]];
    }
    return _groups;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    
    UIBarButtonItem *barItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"NavBack"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    self.navigationItem.leftBarButtonItem = barItem;
    
    // 1.创建手势对象
    UISwipeGestureRecognizer* swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeFunc:)];
     UISwipeGestureRecognizer* swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeFunc:)];
    swipe.direction = UISwipeGestureRecognizerDirectionLeft;
    swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipe];
    [self.view addGestureRecognizer:swipeRight];
}

- (void)swipeFunc:(UISwipeGestureRecognizer *)swipeGesture{
    if (swipeGesture.direction == UISwipeGestureRecognizerDirectionRight) {
        NSLog(@"向右滑");
        [self back];
    }else if(swipeGesture.direction == UISwipeGestureRecognizerDirectionLeft){
        NSLog(@"像左滑");
    }else{
        NSLog(@"乱花");
    }
}




- (void)back{
    [self.navigationController popViewControllerAnimated:YES];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return self.groups[section][@"header"];
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    return self.groups[section][@"footer"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    return [self.groups[section][@"items"] count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.groups.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HMZSettingCell *cell = [HMZSettingCell settingCellWithTableView:tableView withItem:self.groups[indexPath.section][@"items"][indexPath.row]];
    
    cell.item = self.groups[indexPath.section][@"items"][indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    // 获取数据
    NSDictionary* group = self.groups[indexPath.section]; // 获取组
    NSArray* items = group[@"items"]; // 获取所有的cell
    NSDictionary* item = items[indexPath.row]; // 点击的cell的信息
    
    if (item[@"funcName"] && item[@"funcName"]) {
        //根据字符串 获取 sel对象
        SEL sel = NSSelectorFromString(item[@"funcName"]);
        
        [self performSelector:sel];
    }
    
    // 判断是否有这个key并且这个key有值
    if (item[@"targetVC"] && [item[@"targetVC"] length] > 0) {
        
        NSString* targetVC = item[@"targetVC"]; // @"CZRedeemController"
        Class Clz = NSClassFromString(targetVC); // CZRedeemController
        
        UIViewController* vc = [[Clz alloc] init];
        vc.title = item[@"title"]; // 设置跳转到的控制器的标题
        
        if ([vc isKindOfClass:[HMZSettingController class]]) { // 判断跳转到的这个控制器是不是setting类型的
            HMZSettingController *setting = (HMZSettingController *)vc;
            setting.plistName = item[@"plistName"];
        }
        
        // push
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (void)checkUpdate{
    //    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"您当前已是最新的版本" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"温馨提示" message:@"您当前已经是最新版本了" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];
    
}

- (void)mark{
    NSIndexPath *path = [self.tableView indexPathForSelectedRow];
    NSDictionary *item = self.groups[path.section][@"items"][path.row];
    
    if (item[@"markUrl"] && [item[@"markUrl"] length] >0) {
        UIApplication *app = [UIApplication sharedApplication];
        NSString *urlStr = item[@"markUrl"];
        NSURL *url = [NSURL URLWithString:urlStr];
        [app openURL:url];
    }else{
        [NSException raise:@"no value exception" format:@"zhe markUrl is not set"];
    }
    
}

- (void)makeCall{
    NSIndexPath *path = [self.tableView indexPathForSelectedRow];
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:path];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"tel://%@",cell.detailTextLabel.text]];
    [[UIApplication sharedApplication] openURL:url];
}

- (void)makeSms{
    NSIndexPath *path = [self.tableView indexPathForSelectedRow];
    
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:path];
    
    UIApplication *app = [UIApplication sharedApplication];
    NSString *urlStr = [NSString stringWithFormat:@"sms://%@",cell.detailTextLabel];
    NSURL *url = [NSURL URLWithString:urlStr];
    [app openURL:url];
}





















@end
