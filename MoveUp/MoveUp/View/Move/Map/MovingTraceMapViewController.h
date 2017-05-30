//
//  MovingTraceMapViewController.h
//  MoveUp
//
//  Created by sayyou2012 on 17/5/30.
//  Copyright © 2017年 sayyou2012. All rights reserved.
//

#import "BaseViewController.h"
#import "LocationProtocolInMovingTraceMapVC.h"

@protocol MovingTraceMapViewControllerDelegate <BaseViewControllerDelegate>

//获取用户最新的位置信息
- (CLLocationCoordinate2D)getLastLocationCoordinate;

@end

@interface MovingTraceMapViewController : BaseViewController

@property (nonatomic, weak) id<MovingTraceMapViewControllerDelegate> delegate;

@end
