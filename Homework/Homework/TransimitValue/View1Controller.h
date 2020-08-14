//
//  View1Controller.h
//  Homework
//
//  Created by xihou damowang on 2020/8/11.
//  Copyright © 2020 夕厚大魔王. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VIew3Controller.h"
typedef void(^MyBlock)(NSString *str);

NS_ASSUME_NONNULL_BEGIN

@interface View1Controller : UIViewController

@property (nonatomic, copy) MyBlock block;

@property (nonatomic, weak) id<View3Delegate> delegate;

@end

NS_ASSUME_NONNULL_END
