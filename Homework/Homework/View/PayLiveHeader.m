//
//  PayLiveHeader.m
//  
//
//  Created by 夕厚大魔王 on 2020/8/4.
//

#import "PayLiveHeader.h"
#import <Masonry/Masonry.h>
#import "UIImageView+WebCache.h"
#import "PayLiveController.h"





@interface PayLiveHeader ()
@property(strong, nonatomic) UIImageView *banner;//封面
@property(strong, nonatomic) NSString *imgBannerUrl;
@property(strong, nonatomic) UILabel *lbTitle;//标题
@property(strong, nonatomic) UILabel *lbKeshi;//课时
//是否完结


@property(strong, nonatomic) UILabel *lbState;
@property(strong, nonatomic) UIView *jianjieView;//简介
@property(strong, nonatomic) UILabel *lbJianjieTitle;
@property(strong, nonatomic) UILabel *lbJIanjie;
@property(strong, nonatomic) UIButton *btnMore;//下拉按钮
@property(strong, nonatomic) UIView *userView;//用户卡片
@property(strong, nonatomic) UILabel *username;//用户名
@property(strong, nonatomic) UIImageView *avtar;//用户头像
@property(strong, nonatomic) NSString *avtarUrl;
@property(strong, nonatomic) UILabel *lbSchool;//用户信息
@property(strong, nonatomic) UIButton *btnFollow;//关注按钮
@property(strong, nonatomic) UIView *dvi1;
@property(strong, nonatomic) UIView *dvi2;
@end

@implementation PayLiveHeader

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    self.backgroundColor = [UIColor colorWithRed:54/255.0 green:59/255.0 blue:74/255.0 alpha:1];
    [self addSubview:self.userView];
    [self addSubview:self.btnMore];
    [self addSubview:self.banner];
    [self addSubview:self.lbTitle];
    [self addSubview:self.lbState];
    [self addSubview:self.lbKeshi];
    [self addSubview:self.jianjieView];
    [self.jianjieView addSubview:self.lbJianjieTitle];
    [self.jianjieView addSubview:self.lbJIanjie];
    [self.userView addSubview:self.avtar];
    [self.userView addSubview:self.username];
    [self.userView addSubview:self.lbSchool];
    [self.userView addSubview:self.btnFollow];
    [self.userView addSubview:self.dvi1];
    [self.userView addSubview:self.dvi2];
    self.contentMode = UIViewContentModeScaleAspectFit;
#pragma mark - 布局
    [_userView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.height.equalTo(@50);
        make.bottom.equalTo(self);
    }];
    [_avtar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.userView).offset(15);
        make.centerY.equalTo(_userView);
        make.width.height.equalTo(@30);
    }];
    [_username mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_avtar.mas_right).offset(10);
        make.top.equalTo(_avtar);
        make.height.equalTo(@17);
    }];
    [_lbSchool mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_avtar.mas_right).offset(10);
        make.top.equalTo(_username.mas_bottom);
        make.bottom.equalTo(_avtar);
    }];
    [_btnFollow mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.userView).offset(-15);
        make.centerY.equalTo(_avtar);
        make.height.equalTo(@25);
        make.width.equalTo(@70);
    }];
    [_btnMore mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.userView);
        make.bottom.equalTo(_userView.mas_top);
        make.height.equalTo(@40);
    }];
    [_jianjieView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.bottom.equalTo(self.btnMore.mas_top);
        make.height.equalTo(@100);
    }];
    [_lbJianjieTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_jianjieView).offset(15);
        make.top.equalTo(_jianjieView).offset(15);
        make.width.equalTo(@40);
        make.height.equalTo(@20);
    }];
    [_lbJIanjie mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_jianjieView).offset(15);
        make.right.equalTo(_jianjieView).offset(-15);
        make.height.equalTo(@45);
        make.top.equalTo(_lbJianjieTitle.mas_bottom).offset(5);
    }];
    [_dvi1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.userView);
        make.height.equalTo(@0.5);
    }];
    [_dvi2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.equalTo(self.userView);
        make.height.equalTo(@0.5);
    }];
    [_banner mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(15);
        make.bottom.equalTo(self.jianjieView.mas_top).offset(-20);
        make.height.equalTo(@140);
        make.width.equalTo(@95);
    }];
    [_lbTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_banner.mas_right).offset(10);
        make.top.equalTo(_banner);
    }];
    [_lbState mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_lbTitle);
        make.top.equalTo(_banner.mas_bottom).offset(-60);
        make.height.equalTo(@20);
        make.width.equalTo(@50);
    }];
    [_lbKeshi mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_lbTitle);
        make.top.equalTo(_banner.mas_bottom).offset(-30);
    }];

}
#pragma mark - 初始化数据
- (void)initData {
    self.imgBannerUrl = self.coverModel.url;
    NSURL *urlBanner = [NSURL URLWithString:self.imgBannerUrl];
    [self.banner sd_setImageWithURL:urlBanner];
    self.lbTitle.text = self.liveModel.title;
    self.lbState.text = self.liveModel.state == 1 ? @"连载中" : @"完结";
    self.lbKeshi.text = [NSString stringWithFormat:@"%ld期/%ld课时",(long)self.liveModel.currentCourse,(long)self.liveModel.totalCourse];
    self.username.text = self.spuserModel.nickname;
    self.avtarUrl = self.spuserModel.avatar;
    [self.avtar sd_setImageWithURL:self.avtarUrl placeholderImage:[UIImage imageNamed:@"123"]];
    self.lbSchool.text = self.spuserModel.categoryAlias;
    self.lbJIanjie.text = self.liveModel.info_description;
}

#pragma mark - 懒加载
- (UIImageView *)banner {
    if (!_banner) {
        _banner = [[UIImageView alloc] init];
    }
    [_banner setImage:[UIImage imageNamed:@"123"]];
    return _banner;
}

- (UILabel *)lbTitle {
    if (!_lbTitle) {
        _lbTitle = [[UILabel alloc] init];
        _lbTitle.textColor = [UIColor whiteColor];
        _lbTitle.font = [UIFont systemFontOfSize:20];
    }
    return _lbTitle;
}

- (UILabel *)lbState {
    if (!_lbState) {
        _lbState = [[UILabel alloc] init];
        _lbState.layer.masksToBounds = YES;
        _lbState.layer.cornerRadius = 4;
        _lbState.textColor = [UIColor whiteColor];
        _lbState.font = [UIFont systemFontOfSize:12];
        _lbState.textColor = [UIColor colorWithRed:169/255.0 green:131/255.0 blue:72/255.0 alpha:1];
        _lbState.backgroundColor = [UIColor colorWithRed:222/255.0 green:180/255.0 blue:120/255.0 alpha:1];
        _lbState.textAlignment = NSTextAlignmentCenter;
    }
    
    return _lbState;
}

- (UILabel *)lbKeshi {
    if (!_lbKeshi) {
        _lbKeshi = [[UILabel alloc] init];
        _lbKeshi.textColor = [UIColor whiteColor];
        _lbKeshi.font = [UIFont systemFontOfSize:12];
    }
    return _lbKeshi;
}

- (UIView *)jianjieView {
    if (!_jianjieView) {
        _jianjieView = [[UIView alloc] init];
        _jianjieView.userInteractionEnabled = YES;
        _jianjieView.backgroundColor = [UIColor whiteColor];
    }
    
    return _jianjieView;
}

- (UILabel *)lbJianjieTitle {
    if (!_lbJianjieTitle) {
        _lbJianjieTitle = [UILabel new];
        _lbJianjieTitle.text = @"简介";
        _lbJianjieTitle.font = [UIFont systemFontOfSize:18 weight:UIFontWeightBold];
    }
    
    return _lbJianjieTitle;
}

- (UILabel *)lbJIanjie {
    if (!_lbJIanjie) {
        _lbJIanjie = [UILabel new];
    }
    _lbJIanjie.backgroundColor = [UIColor whiteColor];
    UIFont *font = [UIFont systemFontOfSize:14];
    _lbJIanjie.font = font;
    _lbJIanjie.lineBreakMode = NSLineBreakByTruncatingTail;
    _lbJIanjie.numberOfLines = 2;
    _lbJIanjie.textColor = [UIColor grayColor];
    _lbJIanjie.font = [UIFont systemFontOfSize:17];
    return _lbJIanjie;
}

- (UIButton *)btnMore {
    if (!_btnMore) {
        _btnMore = [UIButton new];
        [_btnMore setTitle:@"v" forState:UIControlStateNormal];
        [_btnMore setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        _btnMore.backgroundColor = [UIColor whiteColor];
        [_btnMore addTarget:self action:@selector(moreInfo:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _btnMore;
}

- (UIView *)userView {
    if (!_userView) {
        _userView  = [UIView new];
        _userView.backgroundColor = [UIColor whiteColor];
        UIView *divider1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, 2)];
        UIView *divider2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, _userView.bounds.size.width, 2)];
        divider1.backgroundColor = [UIColor grayColor];
        divider2.backgroundColor = [UIColor grayColor];
        [_userView addSubview:divider1];
        [_userView addSubview:divider2];
    }
    
    return _userView;
}

- (UIImageView *)avtar {
    if (!_avtar) {
        _avtar = [UIImageView new];
    }
    _avtar.backgroundColor = [UIColor grayColor];
    _avtar.layer.masksToBounds = YES;
    _avtar.layer.cornerRadius = 15;
    return _avtar;
}

- (UILabel *)username {
    if (!_username) {
        _username = [UILabel new];
    }
    return _username;
}

- (UILabel *)lbSchool {
    if (!_lbSchool) {
        _lbSchool = [UILabel new];
    }
    _lbSchool.font = [UIFont systemFontOfSize:12];
    _lbSchool.textColor = [UIColor grayColor];
    return _lbSchool;
}

- (UIButton *)btnFollow {
    if (!_btnFollow) {
        _btnFollow = [UIButton new];
    }
    [_btnFollow setTitle:@"+关注" forState:UIControlStateNormal];
    _btnFollow.backgroundColor = [UIColor systemBlueColor];
    [_btnFollow setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _btnFollow.layer.masksToBounds = YES;
    _btnFollow.layer.cornerRadius = 12;
    return _btnFollow;
}



- (UIView *)dvi1 {
    if (!_dvi1) {
        _dvi1 = [UIView new];
        _dvi1.backgroundColor = [UIColor lightGrayColor];
    }
    return _dvi1;
}

- (UIView *)dvi2 {
    if (!_dvi2) {
        _dvi2 = [UIView new];
        _dvi2.backgroundColor = [UIColor lightGrayColor];
    }
    return _dvi2;
}
    
- (NSString *)imgBannerUrl {
    if (!_imgBannerUrl) {
        _imgBannerUrl = [NSString new];
    }
    return _imgBannerUrl;
}

- (CoverModel *)coverModel {
    if (!_coverModel) {
        _coverModel = [CoverModel new];
    }
    return _coverModel;
}

- (LiveModel *)liveModel {
    if (!_liveModel) {
        _liveModel = [LiveModel new];
    }
    return _liveModel;
}

- (SPUser *)spuserModel {
    if (!_spuserModel) {
        _spuserModel = [SPUser new];
    }
    return _spuserModel;
}



- (void)moreInfo:(PayLiveController *)controller {
    static int i = 0;
    if (i==0) {
        [self.jianjieView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self);
            make.right.equalTo(self);
            make.bottom.equalTo(self.btnMore.mas_top);
            make.height.equalTo(@200);
        }];
        i++;
    }else if (i==1) {
        [self.jianjieView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self);
            make.right.equalTo(self);
            make.bottom.equalTo(self.btnMore.mas_top);
            make.height.equalTo(@100);
        }];
        i--;
    }
    [self.delegate payLiveHeaderBtnClick];
}



@end



