//
//  LiveModel.m
//  Homework
//
//  Created by 夕厚大魔王 on 2020/8/5.
//  Copyright © 2020 夕厚大魔王. All rights reserved.
//

#import "LiveModel.h"

@implementation LiveModel

+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{@"info_description" : @"description"}];
}

@end
