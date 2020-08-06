//
//  PayLiveController.m
//  AFN
//
//  Created by 夕厚大魔王 on 2020/8/3.
//  Copyright © 2020 夕厚大魔王. All rights reserved.
//

#import "PayLiveController.h"
#import "CoureseCell.h"
#import <Masonry/Masonry.h>
#import "PayLiveHeader.h"
#import <AFNetworking/AFNetworking.h>
#import "UIImageView+WebCache.h"
#import "PayLiveHeader.h"
@interface PayLiveController () <PayLiveHeaderDelegate>
@property(strong, nonatomic)NSMutableArray<CourseModel *> *courseLists;
@property(strong, nonatomic)LiveModel *model;
@property(strong, nonatomic)UITableView *tablview;
@property(strong, nonatomic)PayLiveHeader *header;
@property(strong, nonatomic)UIView *jianjieView;
@property(strong, nonatomic)UIView *bottomView;
@property(strong, nonatomic) UILabel *lbTbi;
@property(strong, nonatomic) UIButton *btnBuy;
@property(strong, nonatomic) UIBarButtonItem *btnDianDianDian;
@property(strong, nonatomic) UIBarButtonItem *btnZhuanfa;
@property(strong, nonatomic) UILabel *lbMoney;
@end

@implementation PayLiveController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    //设置导航栏
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:54/255.0 green:59/255.0 blue:74/255.0 alpha:1];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationItem.title = @"付费Live";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor],NSFontAttributeName : [UIFont fontWithName:@"Helvetica-Bold" size:17]}];
    NSArray *arr = [NSArray arrayWithObjects:self.btnDianDianDian,self.btnZhuanfa, nil];
    self.navigationItem.rightBarButtonItems = arr;
    //设置tableview
    [self.view addSubview:self.tablview];
    [self.view addSubview:self.bottomView];
    [self.bottomView addSubview:self.lbMoney];
    [self.bottomView addSubview:self.lbTbi];
    [self.bottomView addSubview:self.btnBuy];
    //请求数据
    [self requestData];
    
    #pragma mark - 布局
    //tableview
    [_tablview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view);
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.height.equalTo(@(self.view.bounds.size.height-130));
    }];
    //header
    [self.header mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.tablview);
        make.top.equalTo(self.tablview);
        make.height.equalTo(@(350));
    }];
    //底部view
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.height.equalTo(@60);
    }];
    //价格label
    [self.lbMoney mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.bottomView);
        make.height.equalTo(@26);
        make.left.equalTo(self.bottomView).offset(15);
    }];
    //t币文字
    [self.lbTbi mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.lbMoney.mas_right);
        make.bottom.equalTo(self.lbMoney);
        make.height.equalTo(self.lbMoney).multipliedBy(0.5);
    }];
    //购买按钮
    [self.btnBuy mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.bottomView).offset(-15);
        make.top.bottom.equalTo(_lbMoney);
        make.width.equalTo(@100);
    }];
    
    self.header.delegate = self;
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
//    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
}

- (void)viewWillDisappear:(BOOL)animated {
//    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
}

#pragma mark - tableview数据源、代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.courseLists.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CoureseCell *cell = [CoureseCell cellWithTableview:tableView];
    cell.courseModel = self.courseLists[indexPath.section];
    
    
    CGFloat red = arc4random() % 256 / 255.0;
    CGFloat green = arc4random() % 256 / 255.0;
    CGFloat blue = arc4random() % 256 / 255.0;
    cell.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1];
    return cell;
}


//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
//    return 350;
//}

//footer
//- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
//    UIView* viewFooter = [[UIView alloc] initWithFrame:CGRectMake(0,0, self.view.bounds.size.width,60.0)];
//    UILabel*lbFooter = [[UILabel alloc ]init ];
//    lbFooter.frame =CGRectMake(0,20, self.view.bounds.size.width,20);
//    lbFooter.text = @"没有更多了";
//    lbFooter.textColor = [UIColor lightGrayColor];
//    lbFooter.font = [UIFont systemFontOfSize:15];
//    lbFooter.textAlignment =NSTextAlignmentCenter;
//    [viewFooter addSubview:lbFooter];
//    return viewFooter;
//}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offset = scrollView.contentOffset.y;
    [self.header mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view);
    }];
//    NSLog(@"%f",self.tablview.contentOffset.y);
//    self.header.frame = CGRectMake(0, 0, self.view.bounds.size.width, offset);
    
//    [self.header mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.view);
//        make.height.equalTo(@(350-offset));
//        make.left.right.equalTo(self.tablview);
//    }];
//    [scrollView setContentOffset:CGPointMake(0, 0-offset)];
//    NSLog(@"%f",offset);
}

//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
//    return 1;
//}
//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
//    return 1;
//}

#pragma mark - 数据请求
- (void)requestData {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSString *url = @"http://47.111.114.205:12800/api-resource/paylive/info?userID=81154&currentCourse=0&payLiveID=139&userKey=2kkU82OiHWbYyvDOq2pFEdBdCSnchy6F";
    NSMutableDictionary *dic = [NSMutableDictionary new];
    //模拟post参数
    [dic setObject:@(81154) forKey:@"userID"];
    [dic setObject:@(0) forKey:@"currentCourse"];
    [dic setObject:@(139) forKey:@"payLiveID"];
    [dic setObject:@"2kkU82OiHWbYyvDOq2pFEdBdCSnchy6F" forKey:@"userKey"];
    //请求
    [manager POST:url parameters:dic headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //成功回调
        NSDictionary *live = [responseObject objectForKey:@"live"];
        self.model = [[LiveModel alloc] initWithDictionary:live error:nil];
        NSArray *courseList = [live objectForKey:@"courseList"];
        for (NSDictionary *dic in courseList) {
            CourseModel *model = [[CourseModel alloc]initWithDictionary:dic error:nil];
            [self.courseLists addObject:model];
        };
        self.header.coverModel = [live objectForKey:@"cover"];
        self.header.liveModel = self.model;
        NSDictionary *dicSpuser = [live objectForKey:@"spUser"];
        self.header.spuserModel = [[SPUser alloc] initWithDictionary:dicSpuser error:nil];
        self.lbMoney.text = [NSString stringWithFormat:@"%ld", (long)self.model.displayPrice];
        [self.header initData];
        [self.tablview reloadData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //失败毁掉
        NSLog(@"%@",error);
    }];
}

#pragma mark - 懒加载
- (UITableView *)tablview {
    if (!_tablview) {
        _tablview = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tablview.delegate = self;
        _tablview.dataSource = self;
        _tablview.tableHeaderView = self.header;
        _tablview.separatorStyle = UITableViewCellSelectionStyleNone;
        _tablview.showsVerticalScrollIndicator = NO;
//        _tablview.sectionHeaderHeight = 0;
        _tablview.sectionFooterHeight = 0;
        _tablview.backgroundColor = [UIColor systemPinkColor];
//        _tablview.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 0.01)];
    }
    return _tablview;
}

- (NSMutableArray<CourseModel *> *)courseLists {
    if (!_courseLists) {
        _courseLists = [NSMutableArray new];
    }
    return _courseLists;
}

- (UIView *)bottomView {
    if (!_bottomView) {
        _bottomView = [UIView new];
    }
    _bottomView.backgroundColor = [UIColor colorWithRed:54/255.0 green:59/255.0 blue:74/255.0 alpha:1];
    return _bottomView;
}

- (UILabel *)lbMoney {
    if (!_lbMoney) {
        _lbMoney = [UILabel new];
    }
    _lbMoney.textColor = [UIColor colorWithRed:244/255.0 green:206/255.0 blue:143/255.0 alpha:1];
    _lbMoney.font = [UIFont systemFontOfSize:30];
    _lbMoney.text = @"1231231";
    return _lbMoney;
}

- (UILabel *)lbTbi {
    if (!_lbTbi) {
        _lbTbi = [UILabel new];
    }
    _lbTbi.text = @"T币";
    _lbTbi.textColor = [UIColor colorWithRed:244/255.0 green:206/255.0 blue:143/255.0 alpha:1];
    return _lbTbi;
}

- (UIButton *)btnBuy {
    if (!_btnBuy) {
        _btnBuy = [UIButton new];
        [_btnBuy setTitle:@"立即购买" forState:UIControlStateNormal];
        _btnBuy.backgroundColor = [UIColor colorWithRed:244/255.0 green:206/255.0 blue:143/255.0 alpha:1];
        _btnBuy.titleLabel.font = [UIFont systemFontOfSize:14];
        _btnBuy.layer.masksToBounds = YES;
        _btnBuy.layer.cornerRadius = 15;
    };
    return _btnBuy;
}

- (PayLiveHeader *)header {
    if (!_header) {
        _header = [[PayLiveHeader alloc] init];
        _header.layer.masksToBounds = YES;
        _header.backgroundColor = [UIColor colorWithRed:54/255.0 green:59/255.0 blue:74/255.0 alpha:1];
        _header.userInteractionEnabled = YES;
    }
    return _header;
}

- (UIBarButtonItem *)btnDianDianDian {
    if (!_btnDianDianDian) {
        _btnDianDianDian = [UIBarButtonItem new];
        [_btnDianDianDian setTitle:@"..."];
        [_btnDianDianDian setTintColor:[UIColor whiteColor]];
    }
    return _btnDianDianDian;
}

- (UIBarButtonItem *)btnZhuanfa {
    if (!_btnZhuanfa) {
        _btnZhuanfa = [UIBarButtonItem new];
        [_btnZhuanfa setTitle:@"➡️"];
        [_btnDianDianDian setTintColor:[UIColor whiteColor]];
    }
    return _btnZhuanfa;
}

- (void)payLiveHeaderBtnClick {
    static int j = 0;
    if (j==0) {
        [self.header mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.view);
            make.top.equalTo(self.view);
            make.height.equalTo(@(450));
        }];
        [self.tablview setContentInset:UIEdgeInsetsMake(450, 0, 0, 0)];
        self.tablview.contentOffset = CGPointMake(0,-450);
        NSLog(@"%f",self.tablview.contentOffset.y);
            [self.tablview reloadData];
        j++;
    }else if (j==1) {
        [self.header mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.view);
            make.top.equalTo(self.view);
            make.height.equalTo(@(350));
        }];
            self.tablview.contentInset = UIEdgeInsetsMake(350, 0, 0, 0);
            [self.tablview reloadData];
        j--;
    }
}

@end



