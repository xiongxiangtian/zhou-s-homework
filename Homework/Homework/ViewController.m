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

@interface ViewController () <UITableViewDelegate, UITableViewDataSource,View3Delegate>
@property (nonatomic, strong) UITableView *tableview;
@property (nonatomic, strong) NSArray *VCArr;
@property (nonatomic, strong) PayLiveController *payLiveVC;
@property (nonatomic, strong) XHSController *xhsVC;
@property (nonatomic, strong) NSDictionary *payLiveDic;
@property (nonatomic, strong) NSDictionary *xhsDic;
@property (nonatomic, strong) SelectTageController *selectTagVC;
@property (nonatomic, strong) NSDictionary *selecTagDic;
@property (nonatomic ,strong) View1Controller *vc1;
@property (nonatomic, strong) NSDictionary *vc1Dic;
@property (nonatomic, strong) VIew3Controller *vc3;

@end

@implementation ViewController


- (instancetype)init
{
    static ViewController *instance;
    if (!instance) {
        instance = [super init];
    }
    return instance;
}

#pragma mark - Life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.payLiveDic = [[NSDictionary alloc] initWithObjectsAndKeys:self.payLiveVC,@"controller1",
                                                              @"payLiveVC", @"title",
                                                              @"2020-08-09", @"createTime", nil];
    self.xhsDic = [[NSDictionary alloc] initWithObjectsAndKeys:self.xhsVC, @"controller2",
                                                              @"小红书页面", @"title",
                                                              @"2020-08-09", @"createTime", nil];
    self.selecTagDic = [[NSDictionary alloc] initWithObjectsAndKeys:self.selectTagVC,@"controller3",
                                                              @"selectTagVC", @"title",
                                                              @"2020-08-11", @"createTime",nil];
    self.vc1Dic = [[NSDictionary alloc] initWithObjectsAndKeys:self.vc1, @"controller4",
                                                              @"transimitVC", @"title",
                                                              @"2020-08-11", @"createTime", nil];
    self.VCArr = [[NSArray alloc] initWithObjects:self.payLiveDic, self.xhsDic,self.selecTagDic, self.vc1Dic, nil];
    self.navigationItem.title = @"作业";
    [self.view addSubview:self.tableview];
    
    [self setupNotification];
    [self setupBlock];
    
    
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:nil object:self];
}

#pragma mark - Notification
- (void)setupNotification {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(transimit:) name:@"transimit" object:nil];
}

- (void)transimit:(NSNotification *)notification {
    NSLog(@"Notification---%@", notification.userInfo[@"transimit"]);
}

#pragma mark - Block
- (void)setupBlock {
    self.vc3.block = ^(NSString *str) {
        NSLog(@"block----------%@",str);
    };
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
    NSString *controller = [NSString stringWithFormat:@"controller%ld", (long)indexPath.row+1];
    NSDictionary *dic = self.VCArr[indexPath.row];
    [self.navigationController pushViewController:[dic objectForKey:controller] animated:YES];
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

- (PayLiveController *)payLiveVC {
    if (!_payLiveVC) {
        _payLiveVC = [PayLiveController new];
    }
    return _payLiveVC;
}

- (XHSController *)xhsVC {
    if (!_xhsVC) {
        _xhsVC = [XHSController new];
    }
    return _xhsVC;
}

- (SelectTageController *)selectTagVC {
    if (!_selectTagVC) {
        _selectTagVC = [SelectTageController new];
    }
    return _selectTagVC;
}

- (View1Controller *)vc1 {
    if (!_vc1) {
        _vc1 = [View1Controller new];
    }
        return _vc1;
}

- (VIew3Controller *)vc3 {
    if (!_vc3) {
        _vc3 = [[VIew3Controller alloc] init];
        _vc3.delegate = self;
    }
    return _vc3;
}

@end

