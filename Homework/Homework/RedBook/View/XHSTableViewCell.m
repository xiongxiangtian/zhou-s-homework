//
//  XHSTableViewCell.m
//  Homework
//
//  Created by xihou damowang on 2020/8/9.
//  Copyright © 2020 夕厚大魔王. All rights reserved.
//

#import "XHSTableViewCell.h"

@interface XHSTableViewCell ()
/// 左侧Tableview标题
@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation XHSTableViewCell
+ (instancetype)cellWithTableview:(UITableView *)tableView {
    static NSString *XTCELL = @"xiaohongshutableviewcell";
    XHSTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:XTCELL];
    if (!cell) {
        cell = [[XHSTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:XTCELL];
    }
    return cell;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupView];
    }
    return self;
}

- (void)setupView {
    [self addSubview:self.titleLabel];
}

- (void)setCategory:(Category *)category {
    _category = category;
    self.titleLabel.text = _category.name;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, self.bounds.size.width, 30)];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.font = [UIFont systemFontOfSize:13];
    }
    return _titleLabel;
}

@end
