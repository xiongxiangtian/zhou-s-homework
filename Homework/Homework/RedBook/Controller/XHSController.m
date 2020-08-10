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
#import "EntriesModel.h"
#import "DetailGood.h"
#import <UICollectionViewLeftAlignedLayout/UICollectionViewLeftAlignedLayout.h>

/**
 * @功能描述：小红书商品分类页
 * @创建时间：2020-8-9
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
@property (nonatomic, copy) NSArray<Categories *> *tableDataArr;
@property (nonatomic, copy) NSMutableArray *collectionArr;
@property (nonatomic, strong) NSMutableArray *categoriesArr;

@property (nonatomic, strong) EntriesModel *model;

@property (nonatomic, strong) Categories *categoriesModel;

@property (nonatomic, strong) NSMutableArray *collectionDataArr;

@property (nonatomic ,strong) NSMutableArray *dataArr;

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
    return self.tableDataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    XHSTableViewCell *cell =  [XHSTableViewCell cellWithTableview:tableView];
    cell.categories = self.collectionArr[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 30;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.dataArr = self.collectionDataArr[indexPath.row];
    [self.collectioView reloadData];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.categoriesArr.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *XHSCCELL = @"XHSCCELL";
    static NSString *XHSCTITLECELL = @"XHSCTITLECELL";
    if (self.dataArr.count>0) {
        if([self.dataArr[indexPath.item] class] != [Detail class]) {
            XHSCollectionTitleCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:XHSCTITLECELL forIndexPath:indexPath];
            cell.model = self.dataArr[indexPath.row];
            if (self.dataArr[0]) {
                cell.divider.hidden = YES;
            }
            return cell;
        }
    }
    XHSCollectionVIewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:XHSCCELL forIndexPath:indexPath];
    cell.detail = self.dataArr[indexPath.row];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.dataArr[indexPath.item] class] != [Detail class]) {
        return CGSizeMake(self.collectioView.bounds.size.width, 40);
    }else {
        return CGSizeMake((self.collectioView.bounds.size.width)/3-1, 110);
    }
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.dataArr[indexPath.row] class]== [Detail class]) {
        Detail *detail =  self.dataArr[indexPath.row];
        NSLog(@"%@", detail.name);
    }
}

#pragma mark - 数据请求
- (void)requestDate {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSString *url = @"https://www.xiaohongshu.com/api/store/v1/classifications";
    //请求
    [manager POST:url parameters:nil headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //成功回调
        self.tableDataArr = [responseObject objectForKey:@"data"];
        for(NSDictionary *dic in self.tableDataArr) {
            Categories *categories = [[Categories alloc] initWithDictionary:dic error:nil];
            [self.collectionArr addObject:categories];
        }
        for (Categories *model in self.collectionArr) {
            Categories *categories = model;
            [self.categoriesArr addObject:categories.entries];
        }
        
        for (int i = 0; i<self.categoriesArr.count; i++) {
            NSMutableArray *arr = [[NSMutableArray alloc] init];
            for(NSDictionary *dic in self.categoriesArr[i]) {
                NSArray *detailGood = [dic objectForKey:@"entries"];
                NSString *str = [dic objectForKey:@"name"];
                [arr addObject: str];
                for (NSDictionary *dic in detailGood) {
                    Detail *detail = [[Detail alloc] initWithDictionary:dic error:nil];
                    [arr addObject:detail];
                }
            }
            [self.collectionDataArr addObject:arr];
        }
        [self.tableView reloadData];
        [self.collectioView reloadData];
        self.dataArr = self.collectionDataArr[0];
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
    }
    return _tableView;
}

- (UICollectionView *)collectioView {
    if (!_collectioView) {
        UICollectionViewLeftAlignedLayout *layout = [[UICollectionViewLeftAlignedLayout alloc] init];
        [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
        layout.minimumInteritemSpacing = 0;
        layout.minimumLineSpacing = 0;
        _collectioView = [[UICollectionView alloc] initWithFrame:CGRectMake(90, 10, self.view.bounds.size.width-100, self.view.bounds.size.height - self.navigationController.navigationBar.bounds.size.height-[[UIApplication sharedApplication] statusBarFrame].size.height) collectionViewLayout:layout];
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

- (NSMutableArray *)categoriesArr {
    if (!_categoriesArr) {
        _categoriesArr = [NSMutableArray new];
    }
    return _categoriesArr;
}

- (NSMutableArray *)collectionArr {
    if (!_collectionArr) {
        _collectionArr = [NSMutableArray new];
    }
    return _collectionArr;
}

- (NSMutableArray *)collectionDataArr {
    if (!_collectionDataArr) {
        _collectionDataArr = [NSMutableArray new];
    }
    return _collectionDataArr;
}

- (NSMutableArray *)dataArr {
    if (!_dataArr) {
        _dataArr = [NSMutableArray new];
    }
    return _dataArr;
}

@end
