//
//  BaseCell.m
//  Homework
//
//  Created by xihou damowang on 2020/8/14.
//  Copyright © 2020 夕厚大魔王. All rights reserved.
//

#import "BaseCell.h"

@implementation BaseCell

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.contentView.backgroundColor = [UIColor blueColor];
    }
    return self;
}

@end
