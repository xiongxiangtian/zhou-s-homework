//
//  AppDelegate.m
//  Homework
//
//  Created by 夕厚大魔王 on 2020/8/3.
//  Copyright © 2020 夕厚大魔王. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    _window = [[UIWindow alloc] initWithFrame: [UIScreen mainScreen].bounds];
    
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
    
    
    ViewController *vc = [ViewController new];
    
    MyNavigationController *nvCV = [[MyNavigationController alloc] initWithRootViewController:vc];
    
    
    [_window setRootViewController:nvCV];
    [_window makeKeyAndVisible];
    return YES;
}





@end
