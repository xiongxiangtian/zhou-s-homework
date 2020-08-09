//
//  PayLiveHeader.h
//  
//
//  Created by 夕厚大魔王 on 2020/8/4.
//

#import <UIKit/UIKit.h>
#import "LiveModel.h"

NS_ASSUME_NONNULL_BEGIN

@protocol PayLiveHeaderDelegate <NSObject>

/// 点击设置header的高度
-(void)payLiveHeaderBtnClick;

@end

@interface PayLiveHeader : UIView
/// 封面模型
@property(strong, nonatomic) CoverModel *coverModel;
/// Live模型
@property(strong, nonatomic) LiveModel*liveModel;
/// 用户模型
@property(strong, nonatomic) SPUser*spuserModel;
/// 代理
@property(weak, nonatomic) id<PayLiveHeaderDelegate> delegate;

/// 模型赋值
- (void)initData;

@end

NS_ASSUME_NONNULL_END
