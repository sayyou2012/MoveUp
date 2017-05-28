//
//  MovingViewController.h
//  MoveUp
//
//  Created by sayyou2012 on 17/5/20.
//  Copyright © 2017年 sayyou2012. All rights reserved.
//

#import "BaseViewController.h"
#import "LocationProtocolInMovingVC.h"

@protocol MovingViewControllerDelegate <BaseViewControllerDelegate>

//暂停运动
- (void)pauseMove;
//结束运动
- (void)stopMove;

@end


@interface MovingViewController : BaseViewController

@property (nonatomic, weak) id<MovingViewControllerDelegate> delegate;

@property (nonatomic, strong) id<LocationProtocolInMovingVC> model;

@end
