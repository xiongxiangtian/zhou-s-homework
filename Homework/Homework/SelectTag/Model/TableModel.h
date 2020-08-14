//
//  TableModel.h
//  Homework
//
//  Created by xihou damowang on 2020/8/12.
//  Copyright © 2020 夕厚大魔王. All rights reserved.
//

#import <JSONModel/JSONModel.h>
#import "CollectionModel.h"

NS_ASSUME_NONNULL_BEGIN
/**
 * @功能描述：一个类别的标签数据
 * @创建时间：2020-8-13
 * @创建人：祖文渝
 * @备注: 
 */
@protocol TableModel <NSObject>
@end

@interface TableModel : JSONModel
/// 标签类型
@property (nonatomic, strong)NSString *type;
/// 标签名称
@property (nonatomic, strong)NSString *name;
/// 当前类型所有标签
@property (nonatomic, strong)NSArray<CollectionModel> *list;
/// cell应展示的高度
@property (strong, nonatomic) NSNumber<Ignore>* heightForCell;

@end

NS_ASSUME_NONNULL_END
