//
//  Model1.m
//  Homework
//
//  Created by xihou damowang on 2020/8/11.
//  Copyright © 2020 夕厚大魔王. All rights reserved.
//

#import "Model1.h"

@implementation Model1

+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{@"info_id" : @"id"}];
}

+(instancetype)modelWithdic:(NSDictionary *)dic {
    Model1 *model1 = [[Model1 alloc] initWithDictionary:dic error:nil];
    return model1;
}

@end
