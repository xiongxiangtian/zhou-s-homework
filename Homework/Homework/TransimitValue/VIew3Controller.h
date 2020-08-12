//
//  VIew3Controller.h
//  Homework
//
//  Created by xihou damowang on 2020/8/12.
//  Copyright © 2020 夕厚大魔王. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^MyBlock)(NSString *str);

NS_ASSUME_NONNULL_BEGIN

@protocol View3Delegate <NSObject>
- (void)View3Transimit:(NSString *)str;


@end

@interface VIew3Controller : UIViewController
@property (nonatomic, weak) id<View3Delegate> delegate;
@property (nonatomic, copy) MyBlock block;
@end

NS_ASSUME_NONNULL_END
