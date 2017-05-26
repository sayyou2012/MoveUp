//
//  MovingViewController.h
//  MoveUp
//
//  Created by sayyou2012 on 17/5/20.
//  Copyright © 2017年 sayyou2012. All rights reserved.
//

#import "BaseViewController.h"

@protocol MovingViewControllerDelegate <BaseViewControllerDelegate>

//暂停运动
- (void)pauseMove;
//结束运动
- (void)stopMove;

@end

@protocol LocationInMoving <NSObject>

@property (nonatomic, assign) NSUInteger distance;//距离
@property (nonatomic, assign) NSUInteger averageSpeed;//平均速度
@property (nonatomic, assign) NSUInteger averagePace;//平均配速
@property (nonatomic, assign) NSInteger altitude;//海拔

@end

@interface MovingViewController : BaseViewController

@property (nonatomic, weak) id<MovingViewControllerDelegate> delegate;

@property (nonatomic, strong) id<LocationInMoving> model;

@end
