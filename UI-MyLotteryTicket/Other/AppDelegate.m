//
//  AppDelegate.m
//  UI-MyLotteryTicket
//
//  Created by 赵志丹 on 15/11/2.
//  Copyright © 2015年 赵志丹. All rights reserved.
//

#import "AppDelegate.h"
#import "HMZTabBarController.h"
#import "HMZGudieController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.window = [[UIWindow alloc] initWithFrame:kScreenSize];
   
    
    
    self.window.rootViewController = [self pickViewController];
    
    //让窗口显示出来
    [self.window makeKeyAndVisible];
    
    return YES;
}

//判断 若版本一样 就进主界面,否则进 新特性界面
- (UIViewController *)pickViewController{
    if ([[self loadSaveAppVersion] isEqualToString:[self loadCurrentAppVersion]]) {
        return [[HMZTabBarController alloc] init];
    }else{
        [self saveAppVersion];
        return [[HMZGudieController alloc] init];
    }
    
}

- (NSString *)loadSaveAppVersion{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    return [ud stringForKey:@"appVersion"];
}

- (NSString *)loadCurrentAppVersion{
    NSDictionary *infoDict = [NSBundle mainBundle].infoDictionary;
    return infoDict[@"CFBundleShortVersionString"];
}

- (void)saveAppVersion{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud setObject:[self loadCurrentAppVersion] forKey:@"appVersion"];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
