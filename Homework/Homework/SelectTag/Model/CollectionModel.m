//
//  CollectionModel.m
//  Homework
//
//  Created by xihou damowang on 2020/8/12.
//  Copyright © 2020 夕厚大魔王. All rights reserved.
//

#import "CollectionModel.h"

@implementation CollectionModel

+ (JSONKeyMapper *)keyMapper {
//    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{@"info_id" : @"id"}];
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{@"info_id" : @"id"}];
}



@end
