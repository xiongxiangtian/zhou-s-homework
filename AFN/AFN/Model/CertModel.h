//
//  CertModel.h
//  AFN
//
//  Created by 夕厚大魔王 on 2020/8/5.
//  Copyright © 2020 夕厚大魔王. All rights reserved.
//

#import <JSONModel/JSONModel.h>

NS_ASSUME_NONNULL_BEGIN

@interface CertModel : JSONModel
@property (strong, nonatomic) NSString* category;
@property (strong, nonatomic) NSString* desc;
@property (assign, nonatomic) NSInteger* type;
@end

NS_ASSUME_NONNULL_END