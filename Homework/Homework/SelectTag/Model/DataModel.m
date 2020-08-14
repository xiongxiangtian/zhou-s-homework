//
//  DataModel.m
//  Homework
//
//  Created by xihou damowang on 2020/8/12.
//  Copyright © 2020 夕厚大魔王. All rights reserved.
//

#import "DataModel.h"

@implementation DataModel

+ (instancetype)modelWithdic:(NSDictionary *)dic {
    DataModel *dataModel = [[DataModel alloc] initWithDictionary:dic error:nil];
    return dataModel;
}

@end
