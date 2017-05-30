//
//  LocationProtocolInMovingVC.h
//  MoveUp
//
//  Created by sayyou2012 on 17/5/28.
//  Copyright © 2017年 sayyou2012. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@protocol LocationProtocolInMovingVC <NSObject>

//海拔
@property (nonatomic, readonly) NSInteger altitude;
//方向
@property (nonatomic, readonly) NSString *course;
//速度
@property (nonatomic, readonly) NSUInteger speed;
//精度
@property (nonatomic, readonly) CLLocationAccuracy horizontalAccuracy;
@property (nonatomic, readonly) CLLocation *clLocation;

/**
 获取两个点之间的距离
 
 @return 两个点位置之间的距离
 */
- (CLLocationDistance)distanceFrom:(id<LocationProtocolInMovingVC>)location;

@end
