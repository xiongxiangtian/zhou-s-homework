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
@property(assign, nonatomic) BOOL isPay;
@property(strong, nonatomic) SPUser *spUser;
@property(assign, nonatomic) NSInteger totalCourse;
@property(strong, nonatomic) NSString *info_description;
@property(strong, nonatomic) NSArray<CourseModel *> *courseList;
@property(strong, nonatomic) NSString *title;
@property(strong, nonatomic) CoverModel *cover;
@property(assign, nonatomic) NSInteger totalClass;
@property(assign, nonatomic) NSInteger displayPrice;
@property(assign, nonatomic) NSInteger price;
@property(assign, nonatomic) NSInteger currentCourse;
@property(assign, nonatomic) NSInteger id;
@property(assign, nonatomic) NSInteger state;
@end

NS_ASSUME_NONNULL_END
