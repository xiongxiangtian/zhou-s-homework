//
//  XHSController.m
//  Homework
//
//  Created by xihou damowang on 2020/8/9.
//  Copyright © 2020 夕厚大魔王. All rights reserved.
//

#import "XHSController.h"
#import "XHSTableViewCell.h"
#import "XHSCollectionTitleCell.h"
#import "XHSCollectionVIewCell.h"
#import <AFNetworking/AFNetworking.h>
#import "CollectionLeftFlowLayout.h"

#import "Model1.h"

/**
* @功能描述：仿小红书商品分类页面
* @创建时间：2020-8-11
* @创建人：祖文渝
* @备注:
*/
@interface XHSController () <UITableViewDelegate,
UITableViewDataSource,
UICollectionViewDelegate,
UICollectionViewDataSource>
/// 左则标题
@property (nonatomic, strong) UITableView *tableView;
/// 右侧商品
@property (nonatomic, strong) UICollectionView *collectioView;
/// 数据
@property (nonatomic, copy) NSMutableArray<Model1 *> *tableDataArr;
/// collectionView当前也的数据
@property (nonatomic ,copy) NSMutableArray *data;
/// 所有页的数据
@property (nonatomic ,copy) NSMutableArray *datas;
/// 自定义flowlayout
@property (nonatomic, strong) UICollectionViewFlowLayout *layout;

@end

@implementation XHSController
#pragma mark - Life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self requestDate];
    [self setupView];
    [self setupNvbar];
}

#pragma mark - Custom Function
- (void)setupView {
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.collectioView];
    self.view.backgroundColor = [UIColor colorWithRed:203/255.0 green:203/255.0 blue:208/255.0 alpha:1];
}

- (void)setupNvbar {
    self.navigationController.navigationBar.translucent = NO;
    [self.navigationItem setTitle:@"分类"];
    
}
#pragma mark - Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    return self.tableDataArr.count;
    return self.datas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    XHSTableViewCell *cell =  [XHSTableViewCell cellWithTableview:tableView];
    cell.model1 = self.tableDataArr[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 30;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.data = self.datas[indexPath.row];
    [self.collectioView reloadData];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.data.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *XHSCCELL = @"XHSCCELL";
    static NSString *XHSCTITLECELL = @"XHSCTITLECELL";
        if([self.data[indexPath.item] class] != [Model1 class]) {
            XHSCollectionTitleCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:XHSCTITLECELL forIndexPath:indexPath];
            cell.model = self.data[indexPath.row];
            if (indexPath.item == 0) {
                cell.divider.hidden = YES;
            }
            return cell;
        }
    XHSCollectionVIewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:XHSCCELL forIndexPath:indexPath];
    cell.model = self.data[indexPath.row];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.data[indexPath.item] class] != [Model1 class]) {
        return CGSizeMake(self.collectioView.bounds.size.width, 40);
    }else {
        return CGSizeMake((self.collectioView.bounds.size.width)/3-1, 110);
    }
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.data[indexPath.row] class]== [Model1 class]) {
        Model1 *model =  self.data[indexPath.row];
        NSLog(@"%@", model.name);
    }
}


#pragma mark - 数据请求
- (void)requestDate {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSString *url = @"https://www.xiaohongshu.com/api/store/v1/classifications";
    //请求
    [manager POST:url parameters:nil headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //成功回调
        NSArray *arr = [responseObject objectForKey:@"data"];
        for(NSDictionary *dic in arr) {
            Model1 *m1 = [Model1 modelWithdic:dic];
            [self.tableDataArr addObject:m1];
        }
 
        for (int i = 0; i<self.tableDataArr.count; i++) {
            Model1 *model1 = self.tableDataArr[i];
            NSMutableArray *arr = [NSMutableArray new];
            for (int j = 0; j<model1.entries.count; j++) {
                Model1 *model2 = model1.entries[j];
                [arr addObject:model2.name];
                for (int k = 0; k < model2.entries.count; k++) {
                    [arr addObject:model2.entries[k]];
                }
            }
                [self.datas addObject:arr];
        }
        self.data = self.datas[0];
        [self.tableView reloadData];
        [self.collectioView reloadData];
      
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //失败毁掉
        NSLog(@"%@",error);
    }];
}

#pragma mark - Lazy
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 80, self.view.bounds.size.height)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.tableFooterView = [UIView new];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.scrollEnabled = NO;
        
        [_tableView registerClass:[XHSTableViewCell class] forCellReuseIdentifier:@"xiaohongshutableviewcell"];
    }
    return _tableView;
}

- (UICollectionView *)collectioView {
    if (!_collectioView) {
        _collectioView = [[UICollectionView alloc] initWithFrame:CGRectMake(90, 10, self.view.bounds.size.width-100, self.view.bounds.size.height - self.navigationController.navigationBar.bounds.size.height-[[UIApplication sharedApplication] statusBarFrame].size.height) collectionViewLayout:self.layout];
        _collectioView.backgroundColor = [UIColor whiteColor];
        _collectioView.showsVerticalScrollIndicator = NO;
        _collectioView.delegate = self;
        _collectioView.dataSource = self;
        _collectioView.backgroundColor = [UIColor whiteColor];
        [_collectioView registerClass:[XHSCollectionVIewCell class] forCellWithReuseIdentifier:@"XHSCCELL"];
        [_collectioView registerClass:[XHSCollectionTitleCell class] forCellWithReuseIdentifier:@"XHSCTITLECELL"];
    }
    return _collectioView;
}

- (NSMutableArray *)data {
    if (!_data) {
        _data = [NSMutableArray new];
    }
    return _data;
}

- (NSMutableArray<Model1 *> *)tableDataArr {
    if (!_tableDataArr) {
        _tableDataArr = [NSMutableArray new];
    }
    return _tableDataArr;
}

- (NSMutableArray *)datas {
    if (!_datas) {
        _datas = [NSMutableArray new];
    }
    return _datas;
}

- (UICollectionViewFlowLayout *)layout {
    if (!_layout) {
        _layout = [CollectionLeftFlowLayout new];
        [_layout setScrollDirection:UICollectionViewScrollDirectionVertical];
        _layout.minimumInteritemSpacing = 0;
        _layout.minimumLineSpacing = 0;
    }
    return _layout;
}

@end
