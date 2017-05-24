//
//  Location.m
//  MoveUp
//
//  Created by sayyou2012 on 17/5/24.
//  Copyright © 2017年 sayyou2012. All rights reserved.
//

#import "Location.h"
#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface Location () <CLLocationManagerDelegate>

//关联的定位管理器（聚合）
@property (nonatomic, strong) CLLocationManager *locationManager;
//临时变量，保存receiveUpdateLocations:传过来的block参数
@property (nonatomic, copy) UpdateLocationsCallBack updateLocationsCallBack;

@end

@implementation Location

+ (instancetype)sharedInstance
{
    static Location *location;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        location = [[Location alloc] init];
    });
    
    return location;
}

#pragma mark - Lazy Load

- (CLLocationManager *)locationManager
{
    if (!_locationManager)
    {
        _locationManager                 = [[CLLocationManager alloc] init];
        _locationManager.delegate        = self;
        _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        _locationManager.distanceFilter  = 0.1;
        
        if ([[UIDevice currentDevice] systemVersion].floatValue >= 8.0)
        {
            [_locationManager requestAlwaysAuthorization];
        }
    }
    
    return _locationManager;
}

#pragma mark - Public Methods

- (void)startUpdatingLocation
{
    [self.locationManager startUpdatingLocation];
}

- (void)stopUpdatingLocation
{
    [self.locationManager stopUpdatingLocation];
}

- (void)receiveUpdateLocations:(UpdateLocationsCallBack)updateLocationsCallBack
{
    self.updateLocationsCallBack = updateLocationsCallBack;
}

#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations
{
    if (_updateLocationsCallBack)
    {
        _updateLocationsCallBack(locations);
    }
    NSLog(@"位置改变！");
}

@end
