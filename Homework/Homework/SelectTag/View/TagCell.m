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
        self.contentView.userInteractionEnabled = YES;
        [self.contentView addSubview:self.tagLabel];
        [_tagLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.contentView);
            make.top.equalTo(self.contentView).offset(7);
            make.bottom.equalTo(self.contentView).offset(-7);
        }];
    }
    return self;
}

//- (UICollectionViewLayoutAttributes *)preferredLayoutAttributesFittingAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes {
//    UICollectionViewLayoutAttributes *attributes = [super preferredLayoutAttributesFittingAttributes:layoutAttributes];
//
//    CGRect frame = [self.tagButton.text boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, self.tagButton.frame.size.height) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:18],NSFontAttributeName, nil] context:nil];
//
//    frame.size.height = 40;
//    attributes.frame = frame;
//
//    return attributes;
//}

- (void)btnClick {
    NSLog(self.model.name);
}

- (void)setModel:(CollectionModel *)model {
    _model = model;
//    [self.tagButton setTitle:_model.name forState:UIControlStateNormal];
    self.tagLabel.text = _model.name;

    
}

- (void)setTableModel:(TableModel *)tableModel {
    _tableModel = tableModel;
    NSString *color = [NSString stringWithFormat:@"Color%@",tableModel.type];
    self.tagLabel.layer.borderColor = [UIColor colorNamed:color].CGColor;
    switch ([_model.tag intValue]) {
        case 1:
            self.tagLabel.textColor = [UIColor colorNamed:color];
            self.tagLabel.backgroundColor = [UIColor whiteColor];
            break;
        case -1:
            self.tagLabel.textColor = [UIColor whiteColor];
            self.tagLabel.backgroundColor = [UIColor colorNamed:color];
        default:
            break;
    }
   
}


- (UILabel *)tagLabel {
    if (!_tagLabel) {
        _tagLabel = [[UILabel alloc] init];
//        _tagButton.textAlignment = NSTextAlignmentCenter;
//        _tagButton.font = [UIFont systemFontOfSize:14];
//        [_tagButton.titleLabel setFont:[UIFont systemFontOfSize:12]];
        _tagLabel.textAlignment = NSTextAlignmentCenter;
        _tagLabel.font = [UIFont systemFontOfSize:12];
        _tagLabel.layer.masksToBounds = YES;
        _tagLabel.layer.cornerRadius = 12;
        _tagLabel.layer.borderWidth = 1;
    }
    return _tagLabel;
}
@end
