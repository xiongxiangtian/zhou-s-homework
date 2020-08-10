//
//  EntriesModel.h
//  Homework
//
//  Created by xihou damowang on 2020/8/9.
//  Copyright © 2020 夕厚大魔王. All rights reserved.
//

#import <JSONModel/JSONModel.h>
#import "Category.h"

NS_ASSUME_NONNULL_BEGIN

@interface EntriesModel : JSONModel
/// 种类模型
@property (nonatomic, strong) NSArray<Category *> *categorys;

@end

NS_ASSUME_NONNULL_END
