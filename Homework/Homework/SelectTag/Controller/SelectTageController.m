//
//  SelectTageController.m
//  Homework
//
//  Created by xihou damowang on 2020/8/11.
//  Copyright © 2020 夕厚大魔王. All rights reserved.
//

#import "SelectTageController.h"
#import "SelectTagCell.h"

@interface SelectTageController () <
UITableViewDelegate,
UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation SelectTageController




#pragma mark - Life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupView];
    [self setupNav];
    
}
#pragma mark - Action
#pragma mark - Custom Function
- (void)setupView {
    [self.view addSubview:self.tableView];
}

- (void)setupNav {
    self.navigationController.navigationBar.translucent = NO;
}
#pragma mark - Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SelectTagCell *cell = [SelectTagCell cellWithTablView:tableView];
    
    return cell;
}

#pragma mark - 数据请求
#pragma mark - Lazy


- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [UITableView new];
        CGRect frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
        _tableView.frame = frame;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor redColor];
    }
    return _tableView;
}
@end
