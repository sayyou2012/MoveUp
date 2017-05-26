//
//  Location.m
//  MoveUp
//
//  Created by sayyou2012 on 17/5/24.
//  Copyright © 2017年 sayyou2012. All rights reserved.
//

#import "Location.h"
#import "Location+Private.h"

@interface Location ()

//距离
//@property (nonatomic, assign, readwrite) NSUInteger distance;
////平均速度
//@property (nonatomic, assign, readwrite) NSUInteger averageSpeed;
////平均配速
//@property (nonatomic, assign, readwrite) NSUInteger averagePace;
//@property (nonatomic, strong, readwrite) CLLocation *clLocation;

@property (nonatomic, assign, readwrite) NSInteger altitude;//海拔
@property (nonatomic, copy, readwrite) NSString *course;//方向
@property (nonatomic, assign, readwrite) NSUInteger speed;//速度

@end

@implementation Location

#pragma mark - Setter

- (void)setCLLocation:(CLLocation *)clLocation
{
    _clLocation   = clLocation;
    self.altitude = clLocation.altitude;
    //
    self.course   = [self private_computeCourse:clLocation.course];
    self.speed    = clLocation.speed;
}

#pragma mark - Private Methods

/**
 根据方向度数计算出方向

 @param courseDegress   0.0 - 359.9 degrees, 0 being true North

 @return 方向
 */
- (NSString *)private_computeCourse:(CLLocationDirection)courseDegress
{
    //TODO:计算方向
    return @"东";
}

#pragma mark - Public Methods

- (CLLocationDistance)distanceFrom:(Location *)location
{
    return [self.clLocation distanceFromLocation:location.clLocation];
}

////坐标
//CLLocationCoordinate2D coordinate2D = location.coordinate;
////海拔
//CLLocationDistance altitude = location.altitude;
//
////方向
//CLLocationDirection course = location.course;
////速度
//CLLocationSpeed speed = location.speed;
//
//NSLog(@"");


@end
