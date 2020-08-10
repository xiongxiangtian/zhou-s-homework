//
//  XHSCollectionVIewCell.m
//  Homework
//
//  Created by xihou damowang on 2020/8/9.
//  Copyright © 2020 夕厚大魔王. All rights reserved.
//

#import "XHSCollectionVIewCell.h"
#import <SDWebImage/SDWebImage.h>

@interface XHSCollectionVIewCell ()
/// 商品详细分类标题
@property (nonatomic, strong) UILabel *titleLabel;
/// 商品详细分类图片
@property (nonatomic, strong) UIImageView *goodImgView;

@end

@implementation XHSCollectionVIewCell
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.goodImgView];
    self.contentView.backgroundColor = [UIColor whiteColor];
    return self;
}

- (void)setDetailGood:(DetialGood *)detailGood {
     _detailGood = detailGood;
    self.titleLabel.text = _detailGood.name;
    NSURL *goodImgViewUrl = [NSURL URLWithString:_detailGood.image];
    [self.goodImgView sd_setImageWithURL:goodImgViewUrl placeholderImage: [UIImage imageNamed:@"123"]];
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.contentView.bounds.size.height-30, self.contentView.bounds.size.width, 30)];
        _titleLabel.font = [UIFont systemFontOfSize:10];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.textColor = [UIColor grayColor];
        _titleLabel.backgroundColor = [UIColor whiteColor];
    }
    return _titleLabel;
}

- (UIImageView *)goodImgView {
    if (!_goodImgView) {
        _goodImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.contentView.bounds.size.width, self.contentView.bounds.size.height-30)];
    }
    return _goodImgView;
}


@end
