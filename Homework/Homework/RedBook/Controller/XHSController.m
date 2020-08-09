//
//  XHSController.m
//  Homework
//
//  Created by xihou damowang on 2020/8/9.
//  Copyright © 2020 夕厚大魔王. All rights reserved.
//

#import "XHSController.h"
#import "XHSTableViewCell.h"
#import "XHSCollectionVIewCell.h"
#import <AFNetworking/AFNetworking.h>
#import "EntriesModel.h"
#import "DetialGood.h"

@interface XHSController () <UITableViewDelegate,
                             UITableViewDataSource,
                             UICollectionViewDelegate,
                             UICollectionViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) UICollectionView *collectioView;

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

#pragma mark - Action
#pragma mark - Custom Function
- (void)setupView {
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.collectioView];
}

- (void)setupNvbar {
    self.navigationController.navigationBar.translucent = NO;
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
    
    if (self.collectionDataArr.count>0) {
        if ([self.collectionDataArr[indexPath.item] class] != [DetialGood class]) {
            NSLog(@"123123123213213213213213213213213213123");
        }
    }
    
    XHSCollectionVIewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:XHSCCELL forIndexPath:indexPath];
    cell.backgroundColor = [UIColor grayColor];
    
    return cell;
}
#pragma mark - 数据请求

- (void)requestDate {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSString *url = @"https://www.xiaohongshu.com/api/store/v1/classifications";
    //请求
    [manager POST:url parameters:nil headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //成功回调
        self.tableDataArr = [responseObject objectForKey:@"data"];
        

        
//        NSDictionary *live = [responseObject objectForKey:@"live"];
//        self.model = [[LiveModel alloc] initWithDictionary:live error:nil];
//        NSArray *courseList = [live objectForKey:@"courseList"];
//        for (NSDictionary *dic in courseList) {
//            CourseModel *model = [[CourseModel alloc]initWithDictionary:dic error:nil];
//            [self.courseLists addObject:model];
//        };
//        self.header.coverModel = [live objectForKey:@"cover"];
//        self.header.liveModel = self.model;
//        NSDictionary *dicSpuser = [live objectForKey:@"spUser"];
//        self.header.spuserModel = [[SPUser alloc] initWithDictionary:dicSpuser error:nil];
//        self.moneyLabel.text = [NSString stringWithFormat:@"%ld", (long)self.model.displayPrice];
//        [self.header initData];
        [self.tableView reloadData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //失败毁掉
        NSLog(@"%@",error);
    }];
}

#pragma mark - Lazy
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 80, self.view.bounds.size.height)];
        _tableView.backgroundColor = [UIColor redColor];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.showsVerticalScrollIndicator = NO;
    }
    return _tableView;
}

- (UICollectionViewCell *)collectioView {
    if (!_collectioView) {
        UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
        [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
        flowLayout.itemSize = CGSizeMake(90, 110);
        
        _collectioView = [[UICollectionView alloc] initWithFrame:CGRectMake(80, 0, self.view.bounds.size.width-80, self.view.bounds.size.height) collectionViewLayout:flowLayout];
        _collectioView.backgroundColor = [UIColor systemPinkColor];
        _collectioView.delegate = self;
        _collectioView.dataSource = self;
        [_collectioView registerClass:[XHSCollectionVIewCell class] forCellWithReuseIdentifier:@"XHSCCELL"];
        
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
