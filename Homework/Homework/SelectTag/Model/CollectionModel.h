//
//  CollectionModel.h
//  Homework
//
//  Created by xihou damowang on 2020/8/12.
//  Copyright © 2020 夕厚大魔王. All rights reserved.
//

#import <JSONModel/JSONModel.h>

NS_ASSUME_NONNULL_BEGIN
/**
 * @功能描述：标签模型
 * @创建时间：2020-8-13
 * @创建人：祖文渝
 * @备注: <#Description#>
 */
@protocol CollectionModel <NSObject>
@end

@interface CollectionModel : JSONModel
/// 标签名称
@property (nonatomic, strong) NSString *name;
/// 标签ID
@property (nonatomic, strong) NSString *info_id;
/// 标签是否已选标记
@property (nonatomic,assign) NSNumber<Ignore> *tag;

@end

NS_ASSUME_NONNULL_END
