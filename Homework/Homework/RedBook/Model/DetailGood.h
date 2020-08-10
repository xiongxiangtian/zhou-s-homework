//
//  DetialGood.h
//  Homework
//
//  Created by xihou damowang on 2020/8/9.
//  Copyright © 2020 夕厚大魔王. All rights reserved.
//

#import <JSONModel/JSONModel.h>
#import "Detail.h"

NS_ASSUME_NONNULL_BEGIN

@interface DetailGood : JSONModel
/// 详细分类标题
@property (nonatomic, strong) NSArray<Detail *> *entries;

@property (nonatomic, strong) NSString *name;

@end

NS_ASSUME_NONNULL_END
