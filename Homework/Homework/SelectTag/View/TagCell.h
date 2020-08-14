//
//  TagCell.h
//  Homework
//
//  Created by xihou damowang on 2020/8/12.
//  Copyright © 2020 夕厚大魔王. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CollectionModel.h"
#import "TableModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface TagCell : UICollectionViewCell

@property (nonatomic, strong) CollectionModel *model;
@property (nonatomic, strong) TableModel *tableModel;

@end

NS_ASSUME_NONNULL_END
