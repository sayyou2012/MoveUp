//
//  LocationProtocolInMovingTraceMapVC.h
//  MoveUp
//
//  Created by sayyou2012 on 17/5/30.
//  Copyright © 2017年 sayyou2012. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@protocol LocationProtocolInMovingTraceMapVC <NSObject>

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;//坐标

@end
