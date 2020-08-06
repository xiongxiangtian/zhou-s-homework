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
    _lbTitle.text = self.courseModel.title;
    self.lbTime.text = self.courseModel.durationTime;
    self.lbState.text = (self.courseModel.state==1 ? @"完结" : @"未完结");
    self.lbNumber.text = [NSString stringWithFormat:@"%ld",self.courseModel.courseNumber];
}

- (void)setupView {
    [self.contentView addSubview:self.lbNumber];
    [_lbNumber mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).with.offset(20);
        make.bottom.equalTo(self.contentView).with.offset(-20);
        make.width.equalTo(@30);
        make.left.equalTo(self).offset(15);
    }];
    
    
    [self.contentView addSubview:self.lbTitle];
    [_lbTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(_lbNumber);
        make.left.equalTo(_lbNumber.mas_right).offset(2);
        make.width.lessThanOrEqualTo(@270);
    }];
    
    [self.contentView addSubview:self.lbState];
    [_lbState mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@20);
        make.centerY.equalTo(_lbTitle);
        make.width.equalTo(@40);
        make.left.equalTo(_lbTitle.mas_right).offset(5);
    }];
    
    [self.contentView addSubview:self.lbTime];
    [_lbTime mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_lbTitle.mas_bottom);
        make.bottom.equalTo(self.contentView);
        make.left.equalTo(_lbTitle);
    }];
    
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
   {

   }

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {

}

#pragma mark - 懒加载
- (UILabel *)lbNumber {
    if (!_lbNumber) {
        _lbNumber = [UILabel new];
        _lbNumber.font = [UIFont systemFontOfSize:18 weight:UIFontWeightBold];
        
    }
    return _lbNumber;
}

- (UILabel *)lbState {
    if (!_lbState) {
        _lbState = [UILabel new];
        _lbState.backgroundColor = [UIColor grayColor];
        _lbState.textColor = [UIColor whiteColor];
        _lbState.font = [UIFont systemFontOfSize:10];
        _lbState.layer.masksToBounds = YES;
        _lbState.layer.cornerRadius = 3;
        _lbState.textAlignment = NSTextAlignmentCenter;
        
    }
    return _lbState;
}

- (UILabel *)lbTime {
    if (!_lbTime) {
        _lbTime = [UILabel new];
        _lbTime.textColor = [UIColor grayColor];
    }
    return _lbTime;
}

- (UILabel *)lbTitle {
    if (!_lbTitle) {
        _lbTitle = [UILabel new];
        _lbTitle.font = [UIFont systemFontOfSize:18 weight:UIFontWeightBold];
    }
    return _lbTitle;
}





@end





