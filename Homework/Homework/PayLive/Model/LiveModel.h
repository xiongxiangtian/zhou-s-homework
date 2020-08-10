//
//  LiveModel.h
//  Homework
//
//  Created by 夕厚大魔王 on 2020/8/5.
//  Copyright © 2020 夕厚大魔王. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JSONModel/JSONModel.h>
#import "SPUser.h"
#import "CourseModel.h"
#import "CoverModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface LiveModel : JSONModel
/// 用户信息模型
@property(strong, nonatomic) SPUser *spUser;
/// 总课程数
@property(assign, nonatomic) NSInteger totalCourse;
/// 简介描述
@property(strong, nonatomic) NSString *info_description;
/// 课程列表
@property(strong, nonatomic) NSArray<CourseModel *> *courseList;
/// 标题
@property(strong, nonatomic) NSString *title;
/// 封面
@property(strong, nonatomic) CoverModel *cover;
/// 总课程
@property(assign, nonatomic) NSInteger totalClass;
/// 价格
@property(assign, nonatomic) NSInteger displayPrice;
/// 当前课程期数
@property(assign, nonatomic) NSInteger currentCourse;
/// 是否完结
@property(assign, nonatomic) NSInteger state;

@end

NS_ASSUME_NONNULL_END
