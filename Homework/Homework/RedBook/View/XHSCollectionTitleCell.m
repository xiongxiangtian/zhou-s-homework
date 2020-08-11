//
//  XHSCollectionTitleCell.m
//  Homework
//
//  Created by xihou damowang on 2020/8/10.
//  Copyright © 2020 夕厚大魔王. All rights reserved.
//

#import "XHSCollectionTitleCell.h"
/**
* @功能描述：右侧collectionView分类标题item
* @创建时间：2020-8-11
* @创建人：祖文渝
* @备注:
*/
@interface XHSCollectionTitleCell ()
/// 热门分类标题
@property (nonatomic ,strong) UILabel *titleLabel;
/// 查看更多按钮
@property (nonatomic, strong) UIButton *moreButton;

@end

@implementation XHSCollectionTitleCell
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.moreButton];
    [self.contentView addSubview:self.divider];
    return self;
}

- (void)setModel:(NSString *)model {
    _model = model;
    self.titleLabel.text = _model;
}
     
- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 60, self.contentView.bounds.size.height)];
        _titleLabel.font = [UIFont systemFontOfSize:12];
    }
    return _titleLabel;
}

- (UIButton *) moreButton {
    if (!_moreButton) {
        _moreButton = [[UIButton alloc] initWithFrame:CGRectMake(self.contentView.bounds.size.width-60, 0, 60, self.contentView.bounds.size.height)];
        [_moreButton setTitle:@"查看更多>" forState:UIControlStateNormal];
        [_moreButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        _moreButton.titleLabel.font = [UIFont systemFontOfSize:10];
        
    }
    return _moreButton;
}

- (UIView *)divider {
    if (!_divider) {
        _divider = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.contentView.bounds.size.width, 0.5)];
        _divider.backgroundColor = [UIColor colorWithRed:222/255.0 green:222/255.0 blue:232/255.0 alpha:1];
    }
    return _divider;
}

@end
