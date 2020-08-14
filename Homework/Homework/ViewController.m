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
#import "MyCell.h"
#import "XHSController.h"
#import "SelectTageController.h"
#import "View1Controller.h"
#import "VIew3Controller.h"
#import "PayLiveController.h"
#import "TimingHomeController.h"

@interface ViewController () <UITableViewDelegate,
UITableViewDataSource,
View3Delegate>
@property (nonatomic, strong) UITableView *tableview;
@property (nonatomic, strong) NSArray *VCArr;
@property (nonatomic, strong) NSDictionary *payLiveDic;
@property (nonatomic, strong) NSDictionary *xhsDic;
@property (nonatomic, strong) NSDictionary *selecTagDic;
@property (nonatomic, strong) NSDictionary *vc1Dic;
@property (nonatomic, strong) NSDictionary *timingDic;

@end

@implementation ViewController

#pragma mark - Life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.payLiveDic = [[NSDictionary alloc] initWithObjectsAndKeys:@"payLiveVC", @"title",
                                                                   @"2020-08-09", @"createTime", nil];
    self.xhsDic = [[NSDictionary alloc] initWithObjectsAndKeys:@"小红书页面", @"title",
                                                               @"2020-08-09", @"createTime", nil];
    self.selecTagDic = [[NSDictionary alloc] initWithObjectsAndKeys:@"selectTagVC", @"title",
                                                                    @"2020-08-11", @"createTime",nil];
    self.vc1Dic = [[NSDictionary alloc] initWithObjectsAndKeys: @"transimitVC", @"title",
                                                                @"2020-08-11", @"createTime", nil];
    self.timingDic = [[NSDictionary alloc] initWithObjectsAndKeys:@"Timing首页", @"title",
                                                                 @"2020-08-14", @"createTime", nil];
    self.VCArr = [[NSArray alloc] initWithObjects:self.payLiveDic, self.xhsDic,self.selecTagDic, self.vc1Dic, self.timingDic, nil];
    self.navigationItem.title = @"作业";
    [self.view addSubview:self.tableview];
    
    [self setupNotification];
    
    

    
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:nil object:self];
}

#pragma mark - Notification
- (void)setupNotification {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(transimit:) name:@"transimit" object:nil];
}

- (void)transimit:(NSNotification *)notification {
    NSLog(@"Notification---%@", notification.userInfo[@"transimit"]);
}


#pragma mark - Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.VCArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MyCell *cell = [MyCell cellWithTableview:tableView];
    cell.dic = self.VCArr[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    UIViewController *controller = [self getVC:indexPath.row];
//    [self.navigationController pushViewController:controller animated:YES];
    UIViewController *controller = [self getVC:indexPath.row];
    [self.navigationController pushViewController:controller animated:YES];
}

- (id)getVC:(NSInteger)i {
    id controller;
    switch (i) {
        case 0:
            controller = [PayLiveController new];
            break;
        case 1:
            controller = [XHSController new];
            break;
        case 2:
            controller = [SelectTageController new];
            break;
        case 3:
            {NSLog(@"");
            View1Controller *vc1 = [View1Controller new];
            vc1.block = ^(NSString *str){
                NSLog(@"block----%@",str);
            };
            vc1.delegate = self;
            controller = vc1;
            break;
            
            }
        case 4:
            controller = [TimingHomeController new];
            break;
    }
    return controller;
}



#pragma mark - 代理传值
- (void)View3Transimit:(NSString *)str {
    NSLog(@"delegate-------%@",str);
}

#pragma mark - Lazy
- (UITableView *)tableview {
    if (!_tableview) {
        _tableview = [UITableView new];
        _tableview.delegate = self;
        _tableview.dataSource = self;
        _tableview.frame = self.view.frame;
        _tableview.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
        ///cell高度自适应
        _tableview.estimatedRowHeight = 100;
        _tableview.rowHeight = UITableViewAutomaticDimension;
    }
    return _tableview;
}




@end

