//
//  TagCollectionViewFlowLayout.m
//  Homework
//
//  Created by xihou damowang on 2020/8/13.
//  Copyright © 2020 夕厚大魔王. All rights reserved.
//

#import "TagCollectionViewFlowLayout.h"

@implementation TagCollectionViewFlowLayout

- (NSArray *) layoutAttributesForElementsInRect:(CGRect)rect {
    // 获取所有item的布局属性
    NSArray *answer = [super layoutAttributesForElementsInRect:rect];
    // 遍历结果
    for(int i = 1; i < answer.count; ++i) {
        // 获取cell的Attribute，根据上一个cell获取最大的x，定义为origin
        UICollectionViewLayoutAttributes *currentLayoutAttributes = answer[i];
        UICollectionViewLayoutAttributes *prevLayoutAttributes = answer[i - 1];
        NSInteger preX = CGRectGetMaxX(prevLayoutAttributes.frame);
        NSInteger preY = CGRectGetMaxY(prevLayoutAttributes.frame);
        NSInteger curY = CGRectGetMaxY(currentLayoutAttributes.frame);
        // 如果当前cell和precell在同一行
        if(preY == curY){
            //满足则给当前cell的frame属性赋值
            CGRect frame = currentLayoutAttributes.frame;
            frame.origin.x = preX+10;
            currentLayoutAttributes.frame = frame;
        }else {
            CGRect frame = currentLayoutAttributes.frame;
            frame.origin.x = 0;
            currentLayoutAttributes.frame = frame;
        }
    }
    return answer;
}

@end
