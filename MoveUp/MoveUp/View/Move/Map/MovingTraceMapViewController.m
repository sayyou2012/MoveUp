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
//#import "ClientControl.h"

@interface MovingTraceMapViewController () <MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@property (weak, nonatomic) IBOutlet UILabel *distance;

@property (weak, nonatomic) IBOutlet UILabel *averageSpeed;

@property (assign, nonatomic) CLLocationCoordinate2D lastCoordinate;

@end

@implementation MovingTraceMapViewController

@dynamic delegate;

- (void)dealloc
{
    NSLog(@"%s", __func__);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    CLLocationCoordinate2D currentLocationCoordinate;
    if ([self.delegate respondsToSelector:@selector(getLastLocationCoordinate)])
    {
        currentLocationCoordinate = [self.delegate getLastLocationCoordinate];
        self.lastCoordinate = currentLocationCoordinate;
    }
    
    MKCoordinateSpan span = MKCoordinateSpanMake(0.01, 0.01);
    MKCoordinateRegion region = MKCoordinateRegionMake(currentLocationCoordinate, span);
    [_mapView setRegion:region];
    
//    _mapView.userTrackingMode = MKUserTrackingModeFollowWithHeading;
}

#pragma mark - MKMapViewDelegate

//Tells the delegate that the location of the user was updated

/**
 用户位置信息更新的回调

 @param mapView      地图
 @param userLocation 用户位置的数据模型
 */
- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
//    ClientControl *cc = [ClientControl sharedInstance];
//    Client *client = cc.client;
//    NSArray *locationArray = client.locationArray;
    
    
    //改变地图的中心坐标
    [mapView setCenterCoordinate:userLocation.coordinate animated:YES];
    
    //绘制运动轨迹
    CLLocationCoordinate2D coordinates[2];
    CLLocationCoordinate2D coordinate = _lastCoordinate;
    coordinates[0] = coordinate;
    coordinates[1] = userLocation.coordinate;
    self.lastCoordinate = coordinates[1];
    MKPolyline *polyline = [MKPolyline polylineWithCoordinates:coordinates count:2];
    
    [UIView animateWithDuration:0.2f animations:^{
        [_mapView addOverlay:polyline];
    }];
}

- (MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay
{
    if ([overlay isKindOfClass:[MKPolyline class]])
    {
        MKPolylineRenderer *render = [[MKPolylineRenderer alloc] initWithPolyline:overlay];
        render.lineWidth = 6.0;
        render.strokeColor = [UIColor orangeColor];
        
        return render;
    }
    
    return nil;
}

- (void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated
{
//    mapView.region.span
}

#pragma mark - UIButton Actions

- (IBAction)backButtonTouchUpInside:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
