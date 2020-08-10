//
//  Categories.h
//  Homework
//
//  Created by xihou damowang on 2020/8/10.
//  Copyright © 2020 夕厚大魔王. All rights reserved.
//

#import <JSONModel/JSONModel.h>
#import "Category.h"

NS_ASSUME_NONNULL_BEGIN

@interface Categories : JSONModel

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSArray<Category *> *entries;
@end

NS_ASSUME_NONNULL_END
