//
//  Model3.h
//  Homework
//
//  Created by xihou damowang on 2020/8/11.
//  Copyright © 2020 夕厚大魔王. All rights reserved.
//

#import <JSONModel/JSONModel.h>

NS_ASSUME_NONNULL_BEGIN

@protocol Model3

@end

@interface Model3 : JSONModel
///
@property (nonatomic, strong) NSString *info_id;
/// item图片
@property (nonatomic, strong) NSString *image;
///
@property (nonatomic, strong) NSString *link;
/// item标题
@property (nonatomic, strong) NSString *name;

@end

NS_ASSUME_NONNULL_END
