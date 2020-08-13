//
//  SelectTagCell.h
//  Homework
//
//  Created by xihou damowang on 2020/8/11.
//  Copyright © 2020 夕厚大魔王. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableModel.h"

NS_ASSUME_NONNULL_BEGIN

@protocol CollectionItemClickDelegate <NSObject>
- (void)reloadData:(CollectionModel *)model;

@end

@interface SelectTagCell : UITableViewCell
/// 当前类别的所有标签
@property (nonatomic, strong) TableModel *model;
///点击标签后传值给SelectTagController的代理
@property (nonatomic, weak) id<CollectionItemClickDelegate> delegate;
///单选的模型
@property (nonatomic, strong) CollectionModel *oneModel;


+ (instancetype)cellWithTablView:(UITableView *)tableView;

@end

NS_ASSUME_NONNULL_END
