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

@protocol DataModel <NSObject>
@end

@interface DataModel : JSONModel

@property (nonatomic, strong) NSArray *user_category;
@property (nonatomic, strong) NSArray<TableModel> *category_list;

+ (instancetype)modelWithdic:(NSDictionary *)dic;

@end

NS_ASSUME_NONNULL_END
