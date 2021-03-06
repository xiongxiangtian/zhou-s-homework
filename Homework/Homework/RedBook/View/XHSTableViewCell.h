//
//  XHSTableViewCell.h
//  Homework
//
//  Created by xihou damowang on 2020/8/9.
//  Copyright © 2020 夕厚大魔王. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "Categories.h#
#import "Model1.h"
NS_ASSUME_NONNULL_BEGIN


/**
 * @功能描述：左侧tableveiwcell
 * @创建时间：2020-8-11
 * @创建人：祖文渝
 * @备注: 
 */
@interface XHSTableViewCell : UITableViewCell
//@property (nonatomic, strong) Categories *categories;
@property (nonatomic, strong) Model1 *model1;
/// 初始化cell
/// @param tableView cell所属tableView
+ (instancetype)cellWithTableview:(UITableView *)tableView;

@end

NS_ASSUME_NONNULL_END
