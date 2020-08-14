//
//  View2Controller.m
//  Homework
//
//  Created by xihou damowang on 2020/8/11.
//  Copyright © 2020 夕厚大魔王. All rights reserved.
//

#import "View2Controller.h"
#import "VIew3Controller.h"

@interface View2Controller ()<View3Delegate>

@property (nonatomic, copy)NSString *textStr;

@property (nonatomic, copy)NSString *delegeteStr;


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
    VIew3Controller *vc3 = [VIew3Controller new];
    
    [self.navigationController pushViewController:vc3 animated:YES];
    vc3.delegate = self;
    
    
    vc3.block = ^(NSString *str) {
        self.textStr = str;
        self.block(str);
    };
}

-(void)dealloc {
    NSLog(@"222222222222释放");;
}



- (void)View3Transimit:(NSString *)str {
//    self.delegeteStr = str;
    [self.delegate View3Transimit:str];
}


@end
