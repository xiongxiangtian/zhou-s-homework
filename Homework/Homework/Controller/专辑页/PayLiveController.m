


#import "PayLiveController.h"
#import "CoureseCell.h"
#import <Masonry/Masonry.h>
#import "PayLiveHeader.h"
#import <AFNetworking/AFNetworking.h>
#import "UIImageView+WebCache.h"
#import "PayLiveHeader.h"

/**
* @功能描述：付费Live页面
* @创建时间：2020-08-07
* @创建人：祖文渝
* @备注:
*/
@interface PayLiveController ()<
PayLiveHeaderDelegate,
UITableViewDelegate,
UITableViewDataSource
>

///存放课程模型的数组
@property(nonatomic, strong) NSMutableArray<CourseModel *> *courseLists;
/// live模型
@property(nonatomic, strong) LiveModel *model;
/// 课程tableView
@property(nonatomic, strong) UITableView *tableView;
/// 页面信息header
@property(nonatomic, strong) PayLiveHeader *header;
/// 底部View
@property(nonatomic, strong)UIView *bottomView;
/// 底部T币二字
@property(nonatomic, strong) UILabel *TLabel;
/// 购买按钮
@property(nonatomic, strong) UIButton *buyButton;
/// 导航栏更多按钮
@property(nonatomic, strong) UIBarButtonItem *moreBarbuttonItem;
/// 导航栏转发按钮
@property(nonatomic, strong) UIBarButtonItem *repostButton;
/// 底部价格Label
@property(strong, nonatomic) UILabel *moneyLabel;
/// 背景容器
@property(nonatomic, strong) UIView *container;
/// header背景
@property(nonatomic, strong) UIView *bgView;

@end

@implementation PayLiveController
#pragma mark - Life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    //页面布局
    [self setupView];
    //请求数据
    [self requestData];
}

- (void)viewWillAppear:(BOOL)animated {
    //导航栏
    [self setupNavbar];
}

- (void)viewWillDisappear:(BOOL)animated {
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
}

#pragma mark - Action
- (void)payLiveHeaderBtnClick {
    /**
     需求描述：
     点击按钮简介view向下扩展
     代码逻辑：
     定一个Int变量，点击后重新布局header的高度，变量加1
     第二次点击变量减1，header高度复原。
     */
    static int j = 0;
    if (j==0) {
        CGRect rect = CGRectMake(0, 0, self.view.bounds.size.width, 450);
        
        self.header.frame = rect;
        [self.tableView setTableHeaderView:self.header];
        j++;
    }else if (j==1) {
        CGRect rect = CGRectMake(0, 0, self.view.bounds.size.width, 350);
        self.header.frame = rect;
        [self.tableView setTableHeaderView:self.header];
        j--;
    }
}

#pragma mark - Custom Function
/// 设置导航栏
- (void)setupNavbar {
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:54/255.0 green:59/255.0 blue:74/255.0 alpha:1];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationItem.title = @"付费Live";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor],NSFontAttributeName : [UIFont fontWithName:@"Helvetica-Bold" size:17]}];
    NSArray *arr = [NSArray arrayWithObjects:self.moreBarbuttonItem,self.repostButton, nil];
    self.navigationItem.rightBarButtonItems = arr;
    [self.navigationController.navigationBar setBarStyle:UIBarStyleDefault];
}

/// 页面布局
- (void)setupView {
    self.view.backgroundColor = [UIColor whiteColor];
    //设置tableview
    [self.view addSubview:self.container];
    [self.container addSubview:self.tableView];
    [self.container addSubview:self.bottomView];
    [self.bottomView addSubview:self.moneyLabel];
    [self.bottomView addSubview:self.TLabel];
    [self.bottomView addSubview:self.buyButton];

    //价格label
    [self.moneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.bottomView);
        make.height.equalTo(@26);
        make.left.equalTo(self.bottomView).offset(15);
    }];
    //t币文字
    [self.TLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.moneyLabel.mas_right);
        make.bottom.equalTo(self.moneyLabel);
        make.height.equalTo(self.moneyLabel).multipliedBy(0.5);
    }];
    //购买按钮
    [self.buyButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.bottomView).offset(-15);
        make.top.bottom.equalTo(_moneyLabel);
        make.width.equalTo(@100);
    }];
}

- (void)numOfIntroLabelLine {
    
}


#pragma mark - Delegate

/// 状态栏文字颜色
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

///tableview的section中cell的个数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

///section个数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.courseLists.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70;
}

///cell中的内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CoureseCell *cell = [CoureseCell cellWithTableview:tableView];
    cell.courseModel = self.courseLists[indexPath.section];
    
    
    return cell;
}

//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
//    return 350;
//}

///tableview滑动代理
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offset = scrollView.contentOffset.y;
    [self.bgView setFrame:CGRectMake(0, offset, self.view.bounds.size.width, -offset)];
    
}

#pragma mark - 数据请求
- (void)requestData {
    /**
     需求描述：
     请求网络接口，将请求的数据传入模型中。
     代码逻辑：
     调用AFN与JSONModel请求数据，请求成功后给self和header传模型。
     header传入模型后调用initData方法展示数据。
     self.tableview要reloadData。
     */
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSString *url = @"http://47.111.114.205:12800/api-resource/paylive/info?userID=81154&currentCourse=0&payLiveID=139&userKey=M3S23TG_Vc0qHyyUXKntZBl2q5zzHFnh";
    NSMutableDictionary *dic = [NSMutableDictionary new];
    //模拟post参数
    [dic setObject:@(80125) forKey:@"userID"];
    [dic setObject:@(0) forKey:@"currentCourse"];
    [dic setObject:@(139) forKey:@"payLiveID"];
    [dic setObject:@"M3S23TG_Vc0qHyyUXKntZBl2q5zzHFnh" forKey:@"userKey"];
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
        self.moneyLabel.text = [NSString stringWithFormat:@"%ld", (long)self.model.displayPrice];
        [self.header initData];
        [self.tableView reloadData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //失败毁掉
        NSLog(@"%@",error);
    }];
}

#pragma mark - Lazy
/// 存放课程Model的课程数组
- (NSMutableArray<CourseModel *> *)courseLists {
    if (!_courseLists) {
        _courseLists = [NSMutableArray new];
    }
    return _courseLists;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableHeaderView = self.header;
        _tableView.separatorStyle = UITableViewCellSelectionStyleNone;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height-120);
        _tableView.estimatedRowHeight = 0;
        _tableView.estimatedSectionFooterHeight = 0;
        _tableView.estimatedSectionHeaderHeight = 0;
    }
    return _tableView;
}

- (PayLiveHeader *)header {
    if (!_header) {
        _header = [[PayLiveHeader alloc] init];
        _header.backgroundColor = [UIColor colorWithRed:54/255.0 green:59/255.0 blue:74/255.0 alpha:1];
        _header.userInteractionEnabled = YES;
        [_header sizeToFit];
        [_header setFrame:CGRectMake(0, 0, 0, 350)];
        _header.delegate = self;
        _bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 0)];
        [_header addSubview:self.bgView];
        _bgView.backgroundColor = [UIColor colorWithRed:54/255.0 green:59/255.0 blue:74/255.0 alpha:1];
    }
    return _header;
}

- (UIView *)bottomView {
    if (!_bottomView) {
        _bottomView = [UIView new];
    }
    _bottomView.backgroundColor = [UIColor colorWithRed:54/255.0 green:59/255.0 blue:74/255.0 alpha:1];
//    _bottomView.frame = CGRectMake(0, self.view.bounds.size.height-60, self.view.bounds.size.width, 60);
    CGFloat nvheight = [UIApplication sharedApplication].statusBarFrame.size.height + self.navigationController.navigationBar.frame.size.height;
    _bottomView.frame = CGRectMake(0, self.container.bounds.size.height-nvheight-60, self.container.bounds.size.width, 60);
    return _bottomView;
}

- (UILabel *)TLabel {
    if (!_TLabel) {
        _TLabel = [UILabel new];
    }
    _TLabel.text = @"T币";
    _TLabel.textColor = [UIColor colorWithRed:244/255.0 green:206/255.0 blue:143/255.0 alpha:1];
    return _TLabel;
}

- (UIButton *)buyButton {
    if (!_buyButton) {
        _buyButton = [UIButton new];
        [_buyButton setTitle:@"立即购买" forState:UIControlStateNormal];
        _buyButton.backgroundColor = [UIColor colorWithRed:244/255.0 green:206/255.0 blue:143/255.0 alpha:1];
        _buyButton.titleLabel.font = [UIFont systemFontOfSize:14];
        _buyButton.layer.masksToBounds = YES;
        _buyButton.layer.cornerRadius = 15;
    };
    return _buyButton;
}

- (UIBarButtonItem *)moreBarbuttonItem {
    if (!_moreBarbuttonItem) {
        _moreBarbuttonItem = [UIBarButtonItem new];
        [_moreBarbuttonItem setTitle:@"..."];
        [_moreBarbuttonItem setTintColor:[UIColor whiteColor]];
    }
    return _moreBarbuttonItem;
}

- (UIBarButtonItem *)repostButton {
    if (!_repostButton) {
        _repostButton = [UIBarButtonItem new];
        [_repostButton setTitle:@"➡️"];
        [_repostButton setTintColor:[UIColor whiteColor]];
    }
    return _repostButton;
}

- (UILabel *)moneyLabel {
    if (!_moneyLabel) {
        _moneyLabel = [UILabel new];
    }
    _moneyLabel.textColor = [UIColor colorWithRed:244/255.0 green:206/255.0 blue:143/255.0 alpha:1];
    _moneyLabel.font = [UIFont systemFontOfSize:30];
    _moneyLabel.text = @"1231231";
    return _moneyLabel;
}

- (UIView *)container {
    if (!_container) {
        _container = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
        _container.backgroundColor = [UIColor blackColor];
    }
    return _container;
}

@end




