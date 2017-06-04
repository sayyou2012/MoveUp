//
//  EarthCoordinateToMarsCoordinate.h
//  MoveUp
//  CLLocation定位的坐标是WGS84地图坐标，是未经过偏移加密的坐标，但是苹果mapView用的是高德地图，按照中国国家安全考虑，所有地图都用国家测绘局的加密坐标系统GCJ02，即火星坐标，所谓火星坐标是通过一定的算法从地图坐标偏移而来
//  Created by sayyou2012 on 17/6/4.
//  Copyright © 2017年 sayyou2012. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface EarthCoordinateToMarsCoordinate : NSObject

/**
 将CLLocationManager定位的坐标转换为高德地图中使用的火星坐标

 @param earthCoor 通过CLLocationManager定位的坐标

 @return 高德地图使用的火星坐标
 */
+ (CLLocationCoordinate2D)getMarsCoorWithEarthCoor:(CLLocationCoordinate2D)earthCoor;

@end
