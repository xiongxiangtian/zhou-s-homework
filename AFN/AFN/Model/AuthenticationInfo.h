//
//  AuthenticationInfo.h
//  AFN
//
//  Created by 夕厚大魔王 on 2020/8/5.
//  Copyright © 2020 夕厚大魔王. All rights reserved.
//

#import <JSONModel/JSONModel.h>
#import "CertModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface AuthenticationInfo : JSONModel
@property (strong, nonatomic) NSArray <CertModel *> *certList;
@property (assign, nonatomic) NSInteger type;
@end

NS_ASSUME_NONNULL_END
