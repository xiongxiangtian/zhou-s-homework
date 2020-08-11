//
//  XHSCollectionVIewCell.m
//  Homework
//
//  Created by xihou damowang on 2020/8/9.
//  Copyright © 2020 夕厚大魔王. All rights reserved.
//

#import "XHSCollectionVIewCell.h"
#import <SDWebImage/SDWebImage.h>
/**
* @功能描述：右侧CollectionView每个商品分类Item
* @创建时间：2020-8-11
* @创建人：祖文渝
* @备注:
*/
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


- (void)setModel3:(Model3 *)model3 {
    _model3 = model3;
    self.titleLabel.text = model3.name;
    NSURL *url = [NSURL URLWithString:_model3.image];
    [self.goodImgView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"123"]];
    
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
