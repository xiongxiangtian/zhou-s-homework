//
//  XHSCollectionVIewCell.h
//  Homework
//
//  Created by xihou damowang on 2020/8/9.
//  Copyright © 2020 夕厚大魔王. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model3.h"

NS_ASSUME_NONNULL_BEGIN
/**
 * @功能描述：右侧CollectionView每个商品分类Item
 * @创建时间：2020-8-11
 * @创建人：祖文渝
 * @备注: 
 */
@interface XHSCollectionVIewCell : UICollectionViewCell
/// 商品模型

@property (nonatomic, strong) Model3 *model3;

@end

NS_ASSUME_NONNULL_END
