//
//  Client.m
//  MoveUp
//
//  Created by sayyou2012 on 17/5/25.
//  Copyright © 2017年 sayyou2012. All rights reserved.
//

#import "Client.h"
#import <UIKit/UIKit.h>
#import "Location+Private.h"
#import "ControlModelFactory.h"

@interface Client () <CLLocationManagerDelegate>

//关联的定位管理器（聚合）
@property (nonatomic, strong) CLLocationManager *locationManager;
//临时变量，保存receiveUpdateLocations:传过来的block参数
@property (nonatomic, copy) UpdateLocationsCallBack updateLocationsCallBack;
//用户运动过程中记录下的所有的位置点的可变数组
@property (nonatomic, strong) NSMutableArray<Location *> *locationMutableArray;

@end

@implementation Client

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        _locationMutableArray = [NSMutableArray array];
    }
    
    return self;
}

#pragma mark - Lazy Load

- (CLLocationManager *)locationManager
{
    if (!_locationManager)
    {
        _locationManager                 = [[CLLocationManager alloc] init];
        _locationManager.delegate        = self;
        _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        _locationManager.distanceFilter  = 2.0;
        
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
    CLLocation *cllocation = locations.firstObject;
    
    //水平方向上的精度
    CLLocationAccuracy horizontalAccuracy = cllocation.horizontalAccuracy;
    if (horizontalAccuracy < 0)
    {
        //TODO:在界面给予提示？比如请到空旷地方
        return;
    }
    
     Location *tempLocation = [ControlModelFactory createControlModel:ControlModelTypeLocation];
    [tempLocation setCLLocation:cllocation];

    //开始接受位置更新后，才开始收集位置数据
    if (_updateLocationsCallBack)
    {
        [_locationMutableArray addObject:tempLocation];
    
        NSLog(@"位置改变！");
        _updateLocationsCallBack(_locationMutableArray, nil);
    }
    else//刚启动应用的时候，该回调可能会连续多次回调，取最后一个回调的值（最后一次回调的应该是相比前面的准确的）
    {
        _locationMutableArray[0] = tempLocation;
    }
}

#pragma mark - Getter

- (NSArray<Location *> *)locationArray
{
    return [_locationMutableArray copy];
}

- (CLLocationCoordinate2D)lastLocationCoordinate
{
    Location *location = _locationMutableArray.lastObject;
    return location.coordinate;
}

@end
