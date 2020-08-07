//
//  SPUser.h
//  Homework
//
//  Created by 夕厚大魔王 on 2020/8/5.
//  Copyright © 2020 夕厚大魔王. All rights reserved.
//

#import <JSONModel/JSONModel.h>
#import "AuthenticationInfo.h"

NS_ASSUME_NONNULL_BEGIN

@interface SPUser : JSONModel

/// 用户信息
//@property (strong, nonatomic) AuthenticationInfo *authenticationInfo;

/// 用户头像
@property (strong, nonatomic) NSString *avatar;

/// 用户昵称
@property (strong, nonatomic) NSString *nickname;

/// 用户描述
@property (strong, nonatomic) NSString *categoryAlias;

@end

NS_ASSUME_NONNULL_END
