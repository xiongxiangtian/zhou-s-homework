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

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableview;
@property (nonatomic, strong) PayLiveController *payLiveVC;
@property (nonatomic, strong) NSArray *arr;
@property (nonatomic, strong) NSArray *arr1;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableview];
    self.arr = [[NSArray alloc] initWithObjects:@"payLiveVC", nil];
    self.arr1 = [[NSArray alloc] initWithObjects:self.payLiveVC, nil];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MyCell *cell = [MyCell cellWithTableview:tableView];
    cell.title = self.arr[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.navigationController pushViewController:self.arr1[indexPath.row] animated:YES];
}

- (UITableView *)tableview {
    if (!_tableview) {
        _tableview = [UITableView new];
        _tableview.delegate = self;
        _tableview.dataSource = self;
        _tableview.frame = self.view.frame;
    }
    return _tableview;
}

- (PayLiveController *)payLiveVC {
    if (!_payLiveVC) {
        _payLiveVC = [PayLiveController new];
    }
    return _payLiveVC;
}
@end
