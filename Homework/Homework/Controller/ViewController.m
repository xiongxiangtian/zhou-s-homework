//
//  ViewController.m
//  Homework
//
//  Created by 夕厚大魔王 on 2020/8/3.
//  Copyright © 2020 夕厚大魔王. All rights reserved.
//

#import "ViewController.h"
#import <Masonry/Masonry.h>
#import <AFNetworking/AFNetworking.h>

@interface ViewController ()
@property(strong, nonatomic)PayLiveController *payLiveVC;
@property(strong, nonatomic)UIButton *btn;

@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.btn];
    [self layoutUI];
    self.btn.backgroundColor = [UIColor blueColor];
    [self.btn addTarget:self action:@selector(btnCllick) forControlEvents:UIControlEventTouchUpInside];
}


- (void)layoutUI {
    [_btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@30);
        make.height.equalTo(@30);
        make.centerX.equalTo(self.view.mas_centerX);
        make.centerY.equalTo(self.view.mas_centerY);
    }];
}

- (void)btnCllick {
    [self.navigationController pushViewController:self.payLiveVC animated:YES];
}

- (PayLiveController *)payLiveVC {
    if (!_payLiveVC) {
        _payLiveVC = [PayLiveController new];
    }
    return _payLiveVC;
}

- (UIButton *)btn {
    if (!_btn) {
        _btn = [[UIButton alloc] initWithFrame:CGRectZero];
    }
    return _btn;
}
@end
