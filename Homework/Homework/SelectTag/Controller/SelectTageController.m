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
#import "SelectTagCell.h"
#import "TagHeader.h"
#import "UAAController.h"

@interface SelectTageController () <
UITableViewDelegate,
UITableViewDataSource,
CollectionItemClickDelegate>

@property (nonatomic, strong) UITableView *tableView;

//@property (nonatomic, strong) TableModel *tableModel;
@property (nonatomic, strong) DataModel *dataModel;

//@property (nonatomic, strong) NSArray<CollectionModel *> *oneModels;

@property (nonatomic, strong) NSMutableDictionary *selectedModels;


@property (nonatomic, strong) NSMutableArray *userSelectedArr;

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
- (void)doneButtonClick {
//    NSArray *arr = self.selectedModels.allKeys;
//    for (int i=0 ; i<arr.count; i++) {
//        NSLog(@"%@",arr[i]);
//    }
//
    UAAController *controller = [UAAController new];
    [self.navigationController pushViewController:controller animated:YES];

    
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
    NSString *dictPath = [docPath stringByAppendingPathComponent:@"123.123"];
    [NSKeyedArchiver archiveRootObject:self.selectedModels toFile:dictPath];

    
    
    
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSDictionary *dict = [NSDictionary dictionaryWithDictionary:self.selectedModels];
    NSData * _Nonnull data = [NSKeyedArchiver archivedDataWithRootObject:dict];
    [user setObject:data forKey:@"selectedTags"];
    [user synchronize];
}

#pragma mark - Custom Function
- (void)setupView {
    [self.view addSubview:self.tableView];
}

- (void)setupNav {
    self.navigationController.navigationBar.translucent = NO;
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStyleDone target:self action:@selector(doneButtonClick)];
    self.navigationItem.rightBarButtonItem = doneButton;
}
#pragma mark - Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataModel.category_list.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SelectTagCell *cell = [SelectTagCell cellWithTablView:tableView];
    cell.model = self.dataModel.category_list[indexPath.row];
    cell.oneModel = self.oneModel;
    cell.delegate = self;
//    cell.oneModel = self.oneModell;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableModel *model = self.dataModel.category_list[indexPath.row];
    return [model.heightForCell intValue]*40;
}

- (void)reloadData:(CollectionModel *)model {
#pragma mark - 单选
//    self.oneModel = model;
    
#pragma mark - 多选
    switch ([model.tag intValue]) {
        case -1:
            [self.selectedModels setObject:model forKey:model.name];
            break;
        case 1:
            [self.selectedModels removeObjectForKey:model.name];
        default:
            break;
    }
    [self.tableView reloadData];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [TagHeader new];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 20;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offsetY = scrollView.contentOffset.y;
    if (offsetY<0) {
        [scrollView setContentOffset:CGPointMake(0, 0)];
    }
        
    
}

#pragma mark - 数据请求
- (void)requestData {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSString *url = @"http://118.31.222.92:8088/app-user/get-category";
    NSMutableDictionary *dic = [NSMutableDictionary new];
    [dic setObject:@"3bd7tLqzPl169PMBM5lpfOb3-l5NQ-QXRGWgMYk5DCwjnQ" forKey:@"sp_id"];
    [dic setObject:@"yiATtHsMUwKdlm-yonTCpFWlZKCFyEO-" forKey:@"token"];
    [manager POST:url parameters:dic headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        self.dataModel = [DataModel modelWithdic:[responseObject objectForKey:@"data"]];
        //用户已选标签
        NSArray *arr= self.dataModel.user_category;
        for(NSDictionary *dic in arr) {
            [self.userSelectedArr addObject:[dic objectForKey:@"name"]];
        }
        //预计算cell的高度
        for(int i=0; i<self.dataModel.category_list.count; i++) {
            TableModel *tableModel = self.dataModel.category_list[i];
            NSInteger len = 0;
            NSInteger height = 0;
            for (int j=0; j<tableModel.list.count; j++) {
                CollectionModel *collectionModel = tableModel.list[j];
                collectionModel.tag = @(1);
                for (int i=0; i<self.userSelectedArr.count; i++) {
                    if (collectionModel.name == self.userSelectedArr[i]) {
                        collectionModel.tag = @(-1);
                        
                        
                        
                        [self.selectedModels setObject:collectionModel forKey:collectionModel.name];
                        //单选
                        self.oneModel = collectionModel;
                    }
                }
                len += collectionModel.name.length*13+20;
                if (len > self.view.bounds.size.width-45) {
                    height += 1;
                    len = collectionModel.name.length*13+20;
                }
                len += 10;
            }
            tableModel.heightForCell = @(height+1);
        }
        [self.tableView reloadData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(error);
    }];
    
}



#pragma mark - Lazy


- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [UITableView new];
        CGRect frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height-55);
        _tableView.frame = frame;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
        _tableView.showsVerticalScrollIndicator = NO;
    }
    return _tableView;
}

- (DataModel *)dataModel {
    if (!_dataModel) {
        _dataModel = [DataModel new];
    }
    return _dataModel;
}

- (NSMutableDictionary *)selectedModels {
    if (!_selectedModels) {
        _selectedModels = [NSMutableDictionary new];
    }
    return _selectedModels;
}

- (NSMutableArray *)userSelectedArr {
    if (!_userSelectedArr) {
        _userSelectedArr = [NSMutableArray new];
    }
    return _userSelectedArr;
}

//- (CollectionModel *)oneModel {
//    if (!_oneModel) {
//        _oneModel= [CollectionModel new];
//    }
//    return _oneModel;
//}

@end
