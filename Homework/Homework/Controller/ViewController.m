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

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableview;
@property (nonatomic, strong) NSArray *VCArr;
@property (nonatomic, strong) PayLiveController *payLiveVC;
@property (nonatomic, strong) XHSController *xhsVC;
@property (nonatomic, strong) NSDictionary *payLiveDic;
@property (nonatomic, strong) NSDictionary *xhsDic;

@end

@implementation ViewController

#pragma mark - Life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.payLiveDic = [[NSDictionary alloc] initWithObjectsAndKeys:self.payLiveVC,@"controller1",
                                                              @"payLiveVC", @"title",
                                                              @"2020-08-09", @"createTime", nil];
    self.xhsDic = [[NSDictionary alloc] initWithObjectsAndKeys:self.xhsVC,@"controller2",
                                                              @"小红书页面", @"title",
                                                              @"2020-08-09", @"createTime", nil];
    
    self.VCArr = [[NSArray alloc] initWithObjects:self.payLiveDic, self.xhsDic, nil];
    
    self.navigationItem.title = @"作业";
    [self.view addSubview:self.tableview];
    
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

@end

