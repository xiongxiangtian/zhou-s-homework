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
@property(nonatomic, assign) NSInteger courseNumber;
@property(nonatomic, strong) NSString *durationTime;
@property(nonatomic, assign) NSInteger state;
@property(nonatomic, strong) NSString *title;
@end

NS_ASSUME_NONNULL_END
