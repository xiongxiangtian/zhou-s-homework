//
//  CourseModel.h
//  Homework
//
//  Created by 夕厚大魔王 on 2020/8/5.
//  Copyright © 2020 夕厚大魔王. All rights reserved.
//

#import <JSONModel/JSONModel.h>

NS_ASSUME_NONNULL_BEGIN

@interface CourseModel : JSONModel
/// 课程数量
@property(nonatomic, assign) NSInteger courseNumber;
/// 课程时间
@property(nonatomic, strong) NSString *durationTime;
/// 是否完结
@property(nonatomic, assign) NSInteger state;
/// 课程标题
@property(nonatomic, strong) NSString *title;

@end

NS_ASSUME_NONNULL_END
