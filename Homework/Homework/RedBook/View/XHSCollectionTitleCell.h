//
//  XHSCollectionTitleCell.h
//  Homework
//
//  Created by xihou damowang on 2020/8/10.
//  Copyright © 2020 夕厚大魔王. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/**
 * @功能描述：右侧collectionView分类标题item
 * @创建时间：2020-8-11
 * @创建人：祖文渝
 * @备注: 
 */
@interface XHSCollectionTitleCell : UICollectionViewCell
/// 详细商品推荐标题
@property (nonatomic, strong) NSString *model;
/// 分割线
@property (nonatomic, strong) UIView *divider;
@end

NS_ASSUME_NONNULL_END
