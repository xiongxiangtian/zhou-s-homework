//
//  MyCell.m
//  Homework
//
//  Created by 夕厚大魔王 on 2020/8/6.
//  Copyright © 2020 夕厚大魔王. All rights reserved.
//

#import "MyCell.h"

@interface MyCell ()
@property(strong, nonatomic)UILabel *lbTitle;

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
    [self.contentView addSubview:self.lbTitle];
    
}

- (void)setTitle:(NSString *)title {
    _title = title;
    self.lbTitle.text = self.title;
}

- (UILabel *)lbTitle {
    if (!_lbTitle) {
        _lbTitle = [UILabel new];
        self.backgroundColor = [UIColor redColor];
        self.lbTitle.frame = CGRectMake(0, 0, 200, 30);
    }
    return _lbTitle;
}

@end
