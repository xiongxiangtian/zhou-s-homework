//
//  TableModel.h
//  Homework
//
//  Created by xihou damowang on 2020/8/12.
//  Copyright © 2020 夕厚大魔王. All rights reserved.
//

#import <JSONModel/JSONModel.h>
#import "CollectionModel.h"

NS_ASSUME_NONNULL_BEGIN

@protocol TableModel <NSObject>
@end

@interface TableModel : JSONModel
@property (nonatomic, strong)NSString *type;
@property (nonatomic, strong)NSString *name;
@property (nonatomic, strong)NSArray<CollectionModel> *list;

@property (strong, nonatomic) NSNumber<Ignore>* lenOfTitle;
@end

NS_ASSUME_NONNULL_END
