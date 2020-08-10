//
//  XHSTableViewCell.h
//  Homework
//
//  Created by xihou damowang on 2020/8/9.
//  Copyright © 2020 夕厚大魔王. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Category.h"
NS_ASSUME_NONNULL_BEGIN

@interface XHSTableViewCell : UITableViewCell
@property (nonatomic, strong) Category *category;
/// 初始化cell
/// @param tableView cell所属tableView
+ (instancetype)cellWithTableview:(UITableView *)tableView;

@end

NS_ASSUME_NONNULL_END
