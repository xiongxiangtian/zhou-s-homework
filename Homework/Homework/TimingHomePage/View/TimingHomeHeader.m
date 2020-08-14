//
//  TimingHomeHeader.m
//  Homework
//
//  Created by xihou damowang on 2020/8/14.
//  Copyright © 2020 夕厚大魔王. All rights reserved.
//

#import "TimingHomeHeader.h"
#import <Masonry/Masonry.h>

@interface TimingHomeHeader ()
@property (nonatomic, strong) UIView *studyHallView;
@property (nonatomic, strong) UIView *interComView;

@end

@implementation TimingHomeHeader



- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];
    }
    return self;
}





- (void)setupViews {
    UIView *container = [[UIView alloc] init];
    [self addSubview:container];
    [container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.left.right.equalTo(self);
    }];
    [container addSubview:self.studyHallView];
    [container addSubview:self.interComView];
    [self.studyHallView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(container).multipliedBy(0.7);
        make.left.top.bottom.equalTo(container);
    }];
    [self.interComView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.studyHallView.mas_right);
        make.top.right.bottom.equalTo(container);
    }];
        
}




- (UIView *)studyHallView {
    if (!_studyHallView) {
        _studyHallView = [UIView new];
        _studyHallView.backgroundColor = [UIColor blackColor];
        [_studyHallView layoutIfNeeded];
        UILabel *titleLabel = [UILabel alloc];
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.left.right.equalTo(_studyHallView);
        }];
    }
    return _studyHallView;
}

- (UIView *)interComView {
    if (!_interComView) {
        _interComView = [UIView new];
        _interComView.backgroundColor = [UIColor whiteColor];
    }
    return _interComView;
}

@end
