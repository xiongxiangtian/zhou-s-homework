//
//  MyCell.h
//  Homework
//
//  Created by 夕厚大魔王 on 2020/8/6.
//  Copyright © 2020 夕厚大魔王. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyCell : UITableViewCell

@property(copy, nonatomic) NSDictionary *dic;

+ (instancetype)cellWithTableview:(UITableView *)tableview;

@end

NS_ASSUME_NONNULL_END
