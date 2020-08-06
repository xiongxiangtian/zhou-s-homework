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

-(void)payLiveHeaderBtnClick;

@end

@interface PayLiveHeader : UIView
@property(strong, nonatomic) CoverModel *coverModel;
@property(strong, nonatomic) LiveModel*liveModel;
@property(strong, nonatomic) SPUser*spuserModel;
@property(weak, nonatomic) id<PayLiveHeaderDelegate> delegate;

- (void)initData;
@end

NS_ASSUME_NONNULL_END
