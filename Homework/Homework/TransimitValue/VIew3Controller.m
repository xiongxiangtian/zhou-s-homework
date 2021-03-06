//
//  VIew3Controller.m
//  Homework
//
//  Created by xihou damowang on 2020/8/12.
//  Copyright © 2020 夕厚大魔王. All rights reserved.
//

#import "VIew3Controller.h"
#import "ViewController.h"



@interface VIew3Controller ()

@property (nonatomic, strong) UITextField *textfield;
@property (nonatomic, strong) ViewController *vc;


@end

@implementation VIew3Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    self.textfield = [[UITextField alloc] initWithFrame:CGRectMake(30, 60, 100, 30)];
    self.textfield.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.textfield];
    UIButton * button = [[UIButton alloc] initWithFrame:CGRectMake(100, 200, 50, 50)];
    button.backgroundColor = [UIColor whiteColor];
    [self.view addSubview: button];
    [button addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)btnClick {
    
    NSArray *arr =  self.navigationController.viewControllers;
    ViewController *vc = [arr objectAtIndex:0];
    [self.navigationController popToRootViewControllerAnimated:YES];
    
    [self.delegate View3Transimit:self.textfield.text];
    [self notificationTransimit];
    self.block(self.textfield.text);
}

- (void)notificationTransimit {
    NSDictionary *dic = [[NSDictionary alloc] initWithObjectsAndKeys:self.textfield.text, @"transimit", nil];
    NSNotification *notification =[NSNotification notificationWithName:@"transimit" object:nil userInfo:dic];
    [[NSNotificationCenter defaultCenter] postNotification:notification];
}



-(void)dealloc {
    NSLog(@"333333333333释放");;
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
