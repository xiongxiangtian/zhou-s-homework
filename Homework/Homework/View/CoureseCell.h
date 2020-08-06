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
@property(strong, nonatomic)CourseModel *courseModel;
@property(strong, nonatomic)UILabel *lbNumber;
@property(strong, nonatomic)UILabel *lbTitle;
@property(strong, nonatomic)UILabel *lbState;
@property(strong, nonatomic)UILabel *lbTime;
+ (instancetype)cellWithTableview:(UITableView *)tableview;

@end

NS_ASSUME_NONNULL_END
