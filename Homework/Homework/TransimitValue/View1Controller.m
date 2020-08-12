//
//  View1Controller.m
//  Homework
//
//  Created by xihou damowang on 2020/8/11.
//  Copyright © 2020 夕厚大魔王. All rights reserved.
//

#import "View1Controller.h"
#import "View2Controller.h"

@interface View1Controller ()

@property (nonatomic, strong) View2Controller *vc2;

@end

@implementation View1Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton * button = [[UIButton alloc] initWithFrame:CGRectMake(200, 200, 50, 50)];
    button.backgroundColor = [UIColor blackColor];
    [self.view addSubview: button];
    [button addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    // Do any additional setup after loading the view.
}

- (void)btnClick {
    [self.navigationController pushViewController:self.vc2 animated:YES];
}

- (View2Controller *)vc2 {
    if (!_vc2) {
        _vc2 = [View2Controller new];
    }
    return _vc2;
}

@end
