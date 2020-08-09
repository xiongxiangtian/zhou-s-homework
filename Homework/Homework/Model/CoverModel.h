//
//  CoverModel.h
//  Homework
//
//  Created by 夕厚大魔王 on 2020/8/5.
//  Copyright © 2020 夕厚大魔王. All rights reserved.
//

#import <JSONModel/JSONModel.h>

NS_ASSUME_NONNULL_BEGIN

@interface CoverModel : JSONModel
/// 封面头像url
@property (strong, nonatomic) NSString *url;

@end

NS_ASSUME_NONNULL_END
