//
//  Location.h
//  MoveUp
//
//  Created by sayyou2012 on 17/5/24.
//  Copyright © 2017年 sayyou2012. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface Location : NSObject

//@property (nonatomic, assign, readonly) NSUInteger distance;//距离
//@property (nonatomic, assign, readonly) NSUInteger averageSpeed;//平均速度
//@property (nonatomic, assign, readonly) NSUInteger averagePace;//平均配速

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;//坐标
@property (nonatomic, readonly) NSInteger altitude;//海拔
@property (nonatomic, readonly) NSString *course;//方向
@property (nonatomic, readonly) NSUInteger speed;//速度
@property (nonatomic, readonly) CLLocationAccuracy horizontalAccuracy;//精度

/**
 获取两个点之间的距离

 @return 两个点位置之间的距离
 */
- (CLLocationDistance)distanceFrom:(Location *)location;

@end
