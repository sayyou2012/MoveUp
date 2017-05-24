//
//  Location.h
//  MoveUp
//
//  Created by sayyou2012 on 17/5/24.
//  Copyright © 2017年 sayyou2012. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^UpdateLocationsCallBack)(NSArray *locations);

@interface Location : NSObject

+ (instancetype)sharedInstance;

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
