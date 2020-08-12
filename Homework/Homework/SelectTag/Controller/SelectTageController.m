//
//  SelectTageController.m
//  Homework
//
//  Created by xihou damowang on 2020/8/11.
//  Copyright © 2020 夕厚大魔王. All rights reserved.
//

#import "SelectTageController.h"
#import "SelectTagCell.h"
#import <AFNetworking/AFNetworking.h>
#import "DataModel.h"

@interface SelectTageController () <
UITableViewDelegate,
UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) TableModel *tableModel;
@property (nonatomic, strong) DataModel *dataModel;

@end

@implementation SelectTageController




#pragma mark - Life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupView];
    [self setupNav];
    [self requestData];
    
    
    
    
    
    
    
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
    return self.dataModel.category_list.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SelectTagCell *cell = [SelectTagCell cellWithTablView:tableView];
    cell.model = self.dataModel.category_list[indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableModel *model = self.dataModel.category_list[indexPath.row];
    return [model.lenOfTitle intValue]*40;
}

#pragma mark - 数据请求
- (void)requestData {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSString *url = @"http://118.31.222.92:8088/app-user/get-category";
    NSMutableDictionary *dic = [NSMutableDictionary new];
    //模拟post参数
    [dic setObject:@"3bd7tLqzPl169PMBM5lpfOb3-l5NQ-QXRGWgMYk5DCwjnQ" forKey:@"sp_id"];
    [dic setObject:@"yiATtHsMUwKdlm-yonTCpFWlZKCFyEO-" forKey:@"token"];
    
    
    [manager POST:url parameters:dic headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        

        self.dataModel = [DataModel modelWithdic:[responseObject objectForKey:@"data"]];
        
        for(int i=0; i<self.dataModel.category_list.count; i++) {
            TableModel *tableModel = self.dataModel.category_list[i];
            NSInteger lenOftitle = 0;
            for (int j=0; j<tableModel.list.count; j++) {

                CollectionModel *collectionModel = tableModel.list[j];
                lenOftitle += collectionModel.name.length*18+10;
                
//                NSLog(@"%d",height);
                
            }
            int height = lenOftitle/(self.view.bounds.size.width-50);
            tableModel.lenOfTitle = @(height+1);
//            [tableModel setValue:[NSString stringWithFormat:@"%ld",lenOftitle] forKey:@"length"];
        }
        
        NSLog(@"123");

        [self.tableView reloadData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(error);
    }];
    
}



#pragma mark - Lazy


- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [UITableView new];
        CGRect frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
        _tableView.frame = frame;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
        _tableView.estimatedRowHeight = 100;
        _tableView.rowHeight = UITableViewAutomaticDimension;
    }
    return _tableView;
}

- (DataModel *)dataModel {
    if (!_dataModel) {
        _dataModel = [DataModel new];
    }
    return _dataModel;
}
@end
