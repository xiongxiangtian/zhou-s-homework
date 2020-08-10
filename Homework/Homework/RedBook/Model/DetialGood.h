//
//  DetialGood.h
//  Homework
//
//  Created by xihou damowang on 2020/8/9.
//  Copyright © 2020 夕厚大魔王. All rights reserved.
//

#import <JSONModel/JSONModel.h>

NS_ASSUME_NONNULL_BEGIN

@interface DetialGood : JSONModel
/// 详细分类标题
@property (nonatomic, strong) NSString *name;
/// 详细分类图片
@property (nonatomic, strong) NSString *image;

@end

NS_ASSUME_NONNULL_END
