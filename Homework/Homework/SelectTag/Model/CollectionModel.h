//
//  CollectionModel.h
//  Homework
//
//  Created by xihou damowang on 2020/8/12.
//  Copyright © 2020 夕厚大魔王. All rights reserved.
//

#import <JSONModel/JSONModel.h>

NS_ASSUME_NONNULL_BEGIN

@protocol CollectionModel <NSObject>
@end

@interface CollectionModel : JSONModel

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *info_id;

@end

NS_ASSUME_NONNULL_END
