//
//  XHSCollectionVIewCell.h
//  Homework
//
//  Created by xihou damowang on 2020/8/9.
//  Copyright © 2020 夕厚大魔王. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetialGood.h"

NS_ASSUME_NONNULL_BEGIN

@interface XHSCollectionVIewCell : UICollectionViewCell
/// 商品模型
@property (nonatomic, strong) DetialGood *detailGood;

@end

NS_ASSUME_NONNULL_END
