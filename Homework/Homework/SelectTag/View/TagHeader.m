//
//  TagHeader.m
//  Homework
//
//  Created by xihou damowang on 2020/8/13.
//  Copyright © 2020 夕厚大魔王. All rights reserved.
//

#import "TagHeader.h"
#import <Masonry/Masonry.h>

@implementation TagHeader

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupView];
    }
    return self;
}

- (void)setupView {
    UILabel *lable = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 20)];
    lable.backgroundColor = [UIColor colorWithRed:232/255.0 green:232/255.0 blue:232/255.0 alpha:1];
    lable.text = @"本次答疑主要曝光给哪个学习标签的用户";
    lable.textColor = [UIColor grayColor];
    lable.font = [UIFont systemFontOfSize:11];
    [self addSubview:lable];
}

@end
