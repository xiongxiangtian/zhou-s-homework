//
//  Model1.h
//  Homework
//
//  Created by xihou damowang on 2020/8/11.
//  Copyright © 2020 夕厚大魔王. All rights reserved.
//

#import <JSONModel/JSONModel.h>
#import "Model2.h"

NS_ASSUME_NONNULL_BEGIN

/**
 * @功能描述：TableView名称以及对应的种类
 * @创建时间：2020-8-11
 * @创建人：祖文渝
 */

@protocol Model1

@end

@interface Model1 : JSONModel
/// 种类
@property (nonatomic ,strong) NSArray <Model2>*entries;
/// <#Description#>
@property (nonatomic, strong) NSString *info_id;
/// TalblewView的cell的标题
@property (nonatomic, strong) NSString *name;

+ (instancetype)modelWithdic:(NSDictionary *)dic;

@end

NS_ASSUME_NONNULL_END
