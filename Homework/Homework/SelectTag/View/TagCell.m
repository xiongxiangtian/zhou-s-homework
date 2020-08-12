//
//  TagCell.m
//  Homework
//
//  Created by xihou damowang on 2020/8/12.
//  Copyright © 2020 夕厚大魔王. All rights reserved.
//

#import "TagCell.h"
#import <Masonry/Masonry.h>

@interface TagCell ()

@property (nonatomic, strong) UILabel *tagLabel;

@end

@implementation TagCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self.contentView addSubview:self.tagLabel];
        [_tagLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.left.right.equalTo(self.contentView);
        }];
    }
    return self;
}

- (void)setModel:(CollectionModel *)model {
    _model = model;
    self.tagLabel.text = model.name;
}


- (UILabel *)tagLabel {
    if (!_tagLabel) {
        _tagLabel = [[UILabel alloc] init];
        _tagLabel.backgroundColor = [UIColor whiteColor];
    }
    return _tagLabel;
}
@end
