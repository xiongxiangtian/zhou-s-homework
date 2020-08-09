//
//  XHSCollectionVIewCell.m
//  Homework
//
//  Created by xihou damowang on 2020/8/9.
//  Copyright © 2020 夕厚大魔王. All rights reserved.
//

#import "XHSCollectionVIewCell.h"

@interface XHSCollectionVIewCell ()

@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation XHSCollectionVIewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    [self.contentView addSubview:self.titleLabel];
    return self;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.contentView.bounds.size.height-30, self.contentView.bounds.size.width, 30)];
        _titleLabel.backgroundColor = [UIColor blackColor];
    }
    return _titleLabel;
}

@end
