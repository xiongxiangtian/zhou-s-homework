//
//  DataModel.h
//  Homework
//
//  Created by xihou damowang on 2020/8/12.
//  Copyright © 2020 夕厚大魔王. All rights reserved.
//

#import <JSONModel/JSONModel.h>
#import "TableModel.h"

NS_ASSUME_NONNULL_BEGIN
/**
 * @功能描述：标签页数据
 * @创建时间：2020-8-13
 * @创建人：祖文渝
 * @备注:
 */
@protocol DataModel <NSObject>
@end

@interface DataModel : JSONModel
/// 用户已选标签
@property (nonatomic, strong) NSArray *user_category;
/// 所有标签数据
@property (nonatomic, strong) NSArray<TableModel> *category_list;

+ (instancetype)modelWithdic:(NSDictionary *)dic;

@end

NS_ASSUME_NONNULL_END
