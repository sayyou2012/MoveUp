//
//  MovingTraceMapControl.m
//  MoveUp
//
//  Created by sayyou2012 on 17/5/30.
//  Copyright © 2017年 sayyou2012. All rights reserved.
//

#import "MovingTraceMapControl.h"
#import "MovingTraceMapViewController.h"
#import "ClientControl.h"
#import "CMLocation.h"

@interface MovingTraceMapControl () <MovingTraceMapViewControllerDelegate>

@property (nonatomic, strong) MovingTraceMapViewController *movingTraceMapVC;

@end

@implementation MovingTraceMapControl

- (UIViewController *)viewController
{
    if (!_movingTraceMapVC)
    {
        _movingTraceMapVC = [[MovingTraceMapViewController alloc] initWithNibName:NSStringFromClass([MovingTraceMapViewController class]) bundle:nil];
        _movingTraceMapVC.delegate = self;
    }
    
    return _movingTraceMapVC;
}

#pragma mark - MovingTraceMapViewControllerDelegate

- (CLLocationCoordinate2D)getLastLocationCoordinate
{
    return [[ClientControl sharedInstance].client lastLocationCoordinate];
}

@end
