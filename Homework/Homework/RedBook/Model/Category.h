//
//  Category.h
//  Homework
//
//  Created by xihou damowang on 2020/8/9.
//  Copyright © 2020 夕厚大魔王. All rights reserved.
//

#import <JSONModel/JSONModel.h>
#import "DetailGood.h"

NS_ASSUME_NONNULL_BEGIN

@interface Category : JSONModel
/// 分类大标题
@property (nonatomic, strong) NSArray<DetailGood *> *detailArr;

@end

NS_ASSUME_NONNULL_END
