//
//  Client.h
//  MoveUp
//
//  Created by sayyou2012 on 17/5/25.
//  Copyright © 2017年 sayyou2012. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@class Location;

typedef void(^UpdateLocationsCallBack)(NSArray *locations, NSError *error);

@interface Client : NSObject

//用户运动过程中记录下的所有的位置点的数组
@property (nonatomic, readonly) NSArray<Location *> *allLocations;
//用户最新的位置
@property (nonatomic, readonly) CLLocationCoordinate2D lastLocationCoordinate;

/**
 开始定位（开始获取用户位置改变的报告）
 */
- (void)startUpdatingLocation;

/**
 结束定位
 */
- (void)stopUpdatingLocation;

/**
 接收用户位置改变的回调信息
 */
- (void)receiveUpdateLocations:(UpdateLocationsCallBack)updateLocationsCallBack;

@end
