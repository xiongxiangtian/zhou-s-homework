//
//  MyCell.m
//  Homework
//
//  Created by 夕厚大魔王 on 2020/8/6.
//  Copyright © 2020 夕厚大魔王. All rights reserved.
//

#import "MyCell.h"

@interface MyCell ()

@property(strong, nonatomic)UILabel *titleLabel;

@property(nonatomic, strong)UILabel *timeLabel;

@end

@implementation MyCell

+ (instancetype)cellWithTableview:(UITableView *)tableview {
    static NSString *MYCELL = @"mycell";
    
    MyCell *cell = [tableview dequeueReusableCellWithIdentifier:MYCELL];
    if (!cell) {
        cell = [[MyCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MYCELL];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupView];
        
    }
    return self;
}

- (void)setupView {
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.timeLabel];
}




- (void)setDic:(NSDictionary *)dic {
    self.titleLabel.text = [dic objectForKey:@"title"];
    self.timeLabel.text = [dic objectForKey:@"createTime"];
}

#pragma mark - Lazy
- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.frame = CGRectMake(0, 0, 180, 30);

    }
    return _titleLabel;
}

- (UILabel *)timeLabel {
    if (!_timeLabel) {
        _timeLabel = [UILabel new];
        _timeLabel.frame = CGRectMake(180, 0, 100, 30);

    }
    return _timeLabel;
}

@end
#pragma mark - Life cycle
#pragma mark - Action
#pragma mark - Custom Function
#pragma mark - Delegate
#pragma mark - 数据请求

