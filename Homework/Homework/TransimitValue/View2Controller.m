//
//  View2Controller.m
//  Homework
//
//  Created by xihou damowang on 2020/8/11.
//  Copyright © 2020 夕厚大魔王. All rights reserved.
//

#import "View2Controller.h"
#import "VIew3Controller.h"

@interface View2Controller ()

@property (nonatomic, strong) VIew3Controller *vc3;

@end

@implementation View2Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    UIButton * button = [[UIButton alloc] initWithFrame:CGRectMake(100, 200, 50, 50)];
    button.backgroundColor = [UIColor blackColor];
    [self.view addSubview: button];
    [button addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
}
- (void)btnClick {
    [self.navigationController pushViewController:self.vc3 animated:YES];
}

- (VIew3Controller *)vc3 {
    if (!_vc3) {
        _vc3 = [VIew3Controller new];        
    }
    return _vc3;
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
