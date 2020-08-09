//
//  CoureseCell.m
//  Homework
//
//  Created by 夕厚大魔王 on 2020/8/3.
//  Copyright © 2020 夕厚大魔王. All rights reserved.
//

#import "CoureseCell.h"
#import <Masonry/Masonry.h>



@implementation CoureseCell
+ (instancetype)cellWithTableview:(UITableView *)tableview {
    static NSString *ID = @"courseCell";
    CoureseCell *cell = [tableview dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[CoureseCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
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

- (void)setCourseModel:(CourseModel *)courseModel {
    _courseModel = courseModel;
    _titleLabel.text = self.courseModel.title;
    self.timeLabel.text = self.courseModel.durationTime;
    self.stateLabel.text = (self.courseModel.state==1 ? @"完结" : @"未完结");
    self.numLabel.text = [NSString stringWithFormat:@"%ld",self.courseModel.courseNumber];
}

- (void)setupView {
    [self.contentView addSubview:self.numLabel];
    [_numLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).with.offset(20);
        make.bottom.equalTo(self.contentView).with.offset(-20);
        make.width.equalTo(@30);
        make.left.equalTo(self).offset(15);
    }];
    
    
    [self.contentView addSubview:self.titleLabel];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(_numLabel);
        make.left.equalTo(_numLabel.mas_right).offset(2);
        make.width.lessThanOrEqualTo(@270);
    }];
    
    [self.contentView addSubview:self.stateLabel];
    [_stateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@20);
        make.centerY.equalTo(_titleLabel);
        make.width.equalTo(@40);
        make.left.equalTo(_titleLabel.mas_right).offset(5);
    }];
    
    [self.contentView addSubview:self.timeLabel];
    [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_titleLabel.mas_bottom);
        make.bottom.equalTo(self.contentView);
        make.left.equalTo(_titleLabel);
    }];
    
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
   {

   }

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {

}

#pragma mark - 懒加载
- (UILabel *)numLabel {
    if (!_numLabel) {
        _numLabel = [UILabel new];
        _numLabel.font = [UIFont systemFontOfSize:18 weight:UIFontWeightBold];
        
    }
    return _numLabel;
}

- (UILabel *)stateLabel {
    if (!_stateLabel) {
        _stateLabel = [UILabel new];
        _stateLabel.backgroundColor = [UIColor grayColor];
        _stateLabel.textColor = [UIColor whiteColor];
        _stateLabel.font = [UIFont systemFontOfSize:10];
        _stateLabel.layer.masksToBounds = YES;
        _stateLabel.layer.cornerRadius = 3;
        _stateLabel.textAlignment = NSTextAlignmentCenter;
        
    }
    return _stateLabel;
}

- (UILabel *)timeLabel {
    if (!_timeLabel) {
        _timeLabel = [UILabel new];
        _timeLabel.textColor = [UIColor grayColor];
    }
    return _timeLabel;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.font = [UIFont systemFontOfSize:18 weight:UIFontWeightBold];
    }
    return _titleLabel;
}





@end





