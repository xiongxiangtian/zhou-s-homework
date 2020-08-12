//
//  View1Controller.m
//  Homework
//
//  Created by xihou damowang on 2020/8/11.
//  Copyright © 2020 夕厚大魔王. All rights reserved.
//

#import "View1Controller.h"
#import "View2Controller.h"

@interface View1Controller ()<View3Delegate>

@property (nonatomic, copy) NSString *textStr;
@property (nonatomic, copy) NSString *delegateStr;

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
    View2Controller *vc = [View2Controller new];
    vc.block = ^(NSString *str) {
        self.textStr = str;
        self.block(str);
    };
    [self.navigationController pushViewController:vc animated:YES];
    
    vc.delegate = self;
}


-(void)dealloc {
    NSLog(@"view1view1view1view1view1view1view1view1释放");;
}

- (void)View3Transimit:(NSString *)str {
    self.delegateStr = str;
    [self.delegate View3Transimit:str];
}


@end
