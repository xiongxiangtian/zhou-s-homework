//
//  Model2.h
//  Homework
//
//  Created by xihou damowang on 2020/8/11.
//  Copyright © 2020 夕厚大魔王. All rights reserved.
//

#import <JSONModel/JSONModel.h>
#import "Model3.h"

NS_ASSUME_NONNULL_BEGIN
/**
 * @功能描述：collectionView单个页面的数据
 * @创建时间：2020-8-11
 * @创建人：祖文渝
 * @备注: <#Description#>
 */


@protocol Model2

@end

@interface Model2 : JSONModel
/// collectionView每个Item的模型
@property (nonatomic ,strong) NSArray <Model3>*entries;
///
@property (nonatomic, strong) NSString *info_id;
///
@property (nonatomic, strong) NSString *link;
/// 单个collectionView的分类标题
@property (nonatomic, strong) NSString *name;

@end

NS_ASSUME_NONNULL_END
