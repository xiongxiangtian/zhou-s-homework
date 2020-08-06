//
//  MyNavigationController.m
//  AFN
//
//  Created by 夕厚大魔王 on 2020/8/5.
//  Copyright © 2020 夕厚大魔王. All rights reserved.
//

#import "MyNavigationController.h"

@interface MyNavigationController () <UINavigationBarDelegate>

@end

@implementation MyNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (BOOL)navigationBar:(UINavigationBar *)navigationBar shouldPushItem:(UINavigationItem *)item {
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    [backItem setTintColor:[UIColor whiteColor]];
    item.backBarButtonItem = backItem;
    return YES;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
