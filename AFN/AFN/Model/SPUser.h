//
//  SPUser.h
//  AFN
//
//  Created by 夕厚大魔王 on 2020/8/5.
//  Copyright © 2020 夕厚大魔王. All rights reserved.
//

#import <JSONModel/JSONModel.h>
#import "AuthenticationInfo.h"

NS_ASSUME_NONNULL_BEGIN

@interface SPUser : JSONModel
@property (strong, nonatomic) AuthenticationInfo *authenticationInfo;
@property (strong, nonatomic) NSString *avatar;
@property (strong, nonatomic) NSString *nickname;
@property (strong, nonatomic) NSString *categoryAlias;
//birthday
//real_nickname
//statusInfo
//
//gender
//accountType
//fansCount
//avatar
//type
//isVerify
//isMyself
//isOfficial
@end

NS_ASSUME_NONNULL_END
