//
//  MovingViewController.h
//  MoveUp
//
//  Created by sayyou2012 on 17/5/20.
//  Copyright © 2017年 sayyou2012. All rights reserved.
//

#import "BaseViewController.h"
#import "LocationProtocolInMovingVC.h"

typedef void(^UpdateLocationsCallBack)(NSArray *locations, NSError *error);

@protocol MovingViewControllerDelegate <BaseViewControllerDelegate>

/**
 接受用户位置更新

 @param updateLocationsCallBack 用户位置更新的回调
 */
- (void)receiveUpdateLocations:(UpdateLocationsCallBack)updateLocationsCallBack;

/**
 暂停运动
 */
- (void)pauseMove;

/**
 结束运动
 */
- (void)stopMove;

/**
 展示正在运动的轨迹地图
 */
- (void)presentMovingTraceMap;

@end


@interface MovingViewController : BaseViewController

@property (nonatomic, weak) id<MovingViewControllerDelegate> delegate;

@end
