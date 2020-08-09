//
//  CoureseCell.h
//  Homework
//
//  Created by 夕厚大魔王 on 2020/8/3.
//  Copyright © 2020 夕厚大魔王. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CourseModel.h"



NS_ASSUME_NONNULL_BEGIN

@interface CoureseCell : UITableViewCell
/// 课程模型
@property(strong, nonatomic)CourseModel *courseModel;
/// cell序号
@property(strong, nonatomic)UILabel *numLabel;
/// 课程名称
@property(strong, nonatomic)UILabel *titleLabel;
/// 课程状态
@property(strong, nonatomic)UILabel *stateLabel;
/// 课程开始结束时间
@property(strong, nonatomic)UILabel *timeLabel;

/// 注册初始化cell
/// @param tableview cell所在的Tableview
+ (instancetype)cellWithTableview:(UITableView *)tableview;

@end

NS_ASSUME_NONNULL_END
