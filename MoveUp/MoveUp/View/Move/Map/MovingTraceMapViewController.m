//
//  MovingTraceMapViewController.m
//  MoveUp
//
//  Created by sayyou2012 on 17/5/30.
//  Copyright © 2017年 sayyou2012. All rights reserved.
//

#import "MovingTraceMapViewController.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface MovingTraceMapViewController () <MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end

@implementation MovingTraceMapViewController

@dynamic delegate;

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    CLLocationCoordinate2D currentLocationCoordinate;
    if ([self.delegate respondsToSelector:@selector(getLastLocationCoordinate)])
    {
        currentLocationCoordinate = [self.delegate getLastLocationCoordinate];
    }
    
    MKCoordinateSpan span = MKCoordinateSpanMake(0.2, 0.2);
    MKCoordinateRegion region = MKCoordinateRegionMake(currentLocationCoordinate, span);
    [_mapView setRegion:region];
    
//    _mapView.userTrackingMode = MKUserTrackingModeFollowWithHeading;
}

#pragma mark - MKMapViewDelegate

//Tells the delegate that the location of the user was updated

/**
 告诉代理用户位置信息更新了

 @param mapView      地图
 @param userLocation 用户位置的数据模型
 */
- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    //改变地图的中心坐标
    [mapView setCenterCoordinate:userLocation.coordinate animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
