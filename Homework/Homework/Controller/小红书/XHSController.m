//
//  XHSController.m
//  Homework
//
//  Created by xihou damowang on 2020/8/9.
//  Copyright © 2020 夕厚大魔王. All rights reserved.
//

#import "XHSController.h"
#import "XHSTableViewCell.h"

@interface XHSController () <UITableViewDelegate,
                             UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation XHSController



#pragma mark - Life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupView];
    [self setupNvbar];
}

#pragma mark - Action
#pragma mark - Custom Function
- (void)setupView {
    [self.view addSubview:self.tableView];
}

- (void)setupNvbar {
    self.navigationController.navigationBar.translucent = NO;
}
#pragma mark - Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    XHSTableViewCell *cell =  [XHSTableViewCell cellWithTableview:tableView];
    
//    CGFloat r = arc4random() % 256.0;
//    CGFloat g = arc4random() % 256.0;
//    CGFloat b = arc4random() % 256.0;
//    UIColor *color = [UIColor colorWithRed:r green:g blue:b alpha:1];
    
    return cell;
}
#pragma mark - 数据请求
#pragma mark - Lazy
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 30, self.view.bounds.size.height)];
        _tableView.backgroundColor = [UIColor redColor];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}


@end
