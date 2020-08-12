//
//  SelectTagCell.m
//  Homework
//
//  Created by xihou damowang on 2020/8/11.
//  Copyright © 2020 夕厚大魔王. All rights reserved.
//

#import "SelectTagCell.h"
#import <Masonry/Masonry.h>
#import "TagCell.h"

#define CELLHEIGHT self.contentView.bounds.size.height
#define CELLWIDTH self.contentView.bounds.size.width

@interface SelectTagCell () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UIView *titleView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation SelectTagCell

+ (instancetype)cellWithTablView:(UITableView *)tableView {
    static NSString *SELECTTAGCELL = @"SELECTTAGCELL";
    SelectTagCell *cell = [[SelectTagCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:SELECTTAGCELL];
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    [self setupView];
    return self;
}

- (void)setupView {
    [self.contentView addSubview:self.titleView];
    [self.titleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.width.height.equalTo(@45);
        make.left.equalTo(self.contentView);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.titleView);
        make.height.equalTo(self.titleView).multipliedBy(0.4);
    }];
    
    [self.contentView addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleView.mas_right);
        make.top.right.bottom.equalTo(self.contentView);
    }];
}

#pragma mark - Life cycle
#pragma mark - Action
#pragma mark - Custom Function

#pragma mark - Delegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.model.list.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    TagCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"TAGCELL" forIndexPath:indexPath];
    cell.model = self.model.list[indexPath.row];
    CollectionModel *model = self.model.list[indexPath.row];
    CGSize sizeForStr = [model.name boundingRectWithSize:CGSizeMake([[UIScreen mainScreen] bounds].size.width, __FLT_MAX__) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType, NSFontAttributeName: [UIFont systemFontOfSize:13]} context:nil].size;
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
//    if ([self.data[indexPath.item] class] != [Model1 class]) {
//        return CGSizeMake(self.collectioView.bounds.size.width, 40);
//    }else {
//        return CGSizeMake((self.collectioView.bounds.size.width)/3-1, 110);
//    }
    CollectionModel *model = self.model.list[indexPath.row];
    NSString *str = model.name;
    CGSize sizeForStr = [str boundingRectWithSize:CGSizeMake([[UIScreen mainScreen] bounds].size.width, __FLT_MAX__) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType, NSFontAttributeName: [UIFont systemFontOfSize:13]} context:nil].size;
    return CGSizeMake(sizeForStr.width + 43, 30);
}

#pragma mark - 数据请求
#pragma mark - Setter
- (void)setModel:(TableModel *)model {
    _model = model;
    self.titleLabel.text = model.name;
}
#pragma mark - Lazy
- (UIView *)titleView {
    if (!_titleView) {
        _titleView = [[UIView alloc] init];
        _titleView.backgroundColor = [UIColor grayColor];
        [_titleView addSubview:self.titleLabel];
        
    }
    return _titleView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:10];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
        
        [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
        layout.minimumInteritemSpacing = 0;
        layout.minimumLineSpacing = 0;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor systemPinkColor];
        [_collectionView registerClass:[TagCell class] forCellWithReuseIdentifier:@"TAGCELL"];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
    }
    return _collectionView;
}
@end
