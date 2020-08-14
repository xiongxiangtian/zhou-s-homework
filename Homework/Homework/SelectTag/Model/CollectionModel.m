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

- (void)encodeWithCoder:(NSCoder *)coder
{
    [super encodeWithCoder:coder];
    [coder encodeObject:self.name forKey:@"name"];
    [coder encodeObject:self.info_id forKey:@"info_id"];
    [coder encodeObject:self.tag forKey:@"tag"];
}

-(instancetype)initWithCoder:(NSCoder *)coder {
    if (self = [super init]) {
        self.name = [coder decodeObjectForKey:@"name"];
        self.info_id = [coder decodeObjectForKey:@"info_id"];
        self.tag = [coder decodeObjectForKey:@"tag"];
    }
    return self;
}

@end
