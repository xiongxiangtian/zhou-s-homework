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
#import "DetialGood.h"
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
@property (nonatomic, copy) NSArray *tableDataArr;
@property (nonatomic, copy) NSArray *collectionArr;
@property (nonatomic, strong) NSMutableArray *collectionDataArr;

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
    NSDictionary *categoryDic = self.tableDataArr[indexPath.row];
    cell.category = [[Category alloc] initWithDictionary:categoryDic error:nil];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 30;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.collectionDataArr removeAllObjects];
    self.collectionArr = [self.tableDataArr[indexPath.row] objectForKey:@"entries"];
    for (NSInteger i = 0; i<=self.collectionArr.count-1; i++) {
        [self.collectionDataArr addObject:[self.collectionArr[i] objectForKey:@"name"]];
        NSDictionary *dics = [self.collectionArr[i] objectForKey:@"entries"];
        for(NSDictionary *dic in dics) {
            DetialGood *detailgood = [[DetialGood alloc] initWithDictionary:dic error:nil];
            [self.collectionDataArr addObject:detailgood];
        }
    }
    [self.collectioView reloadData];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.collectionDataArr.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *XHSCCELL = @"XHSCCELL";
    static NSString *XHSCTITLECELL = @"XHSCTITLECELL";
    if (self.collectionDataArr.count>0) {
        if ([self.collectionDataArr[indexPath.item] class] != [DetialGood class]) {
            XHSCollectionTitleCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:XHSCTITLECELL forIndexPath:indexPath];
            cell.model = self.collectionDataArr[indexPath.item];
            if (indexPath.item == 0) {
                cell.divider.hidden = YES;
            }
            return cell;
        }
    }
    XHSCollectionVIewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:XHSCCELL forIndexPath:indexPath];
    cell.backgroundColor = [UIColor grayColor];
    cell.detailGood = self.collectionDataArr[indexPath.item];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.collectionDataArr[indexPath.item] class] != [DetialGood class]) {
        return CGSizeMake(self.collectioView.bounds.size.width, 40);
    }else {
        return CGSizeMake((self.collectioView.bounds.size.width)/3-1, 110);
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
        self.collectionArr = [self.tableDataArr[0] objectForKey:@"entries"];
        for (NSInteger i = 0; i<=self.collectionArr.count-1; i++) {
            [self.collectionDataArr addObject:[self.collectionArr[0] objectForKey:@"name"]];
            NSDictionary *dics = [self.collectionArr[0] objectForKey:@"entries"];
            for(NSDictionary *dic in dics) {
                DetialGood *detailgood = [[DetialGood alloc] initWithDictionary:dic error:nil];
                [self.collectionDataArr addObject:detailgood];
            }
        }
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

- (NSMutableArray *)collectionDataArr {
    if (!_collectionDataArr) {
        _collectionDataArr = [NSMutableArray new];
    }
    return _collectionDataArr;
}

@end
