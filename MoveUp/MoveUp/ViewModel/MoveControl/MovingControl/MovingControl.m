//
//  MovingControl.m
//  MoveUp
//
//  Created by sayyou2012 on 17/5/21.
//  Copyright © 2017年 sayyou2012. All rights reserved.
//

#import "MovingControl.h"
#import "ClientControl.h"
#import "MovingTraceMapControl.h"
#import "CMLocation.h"

@interface MovingControl () <MovingViewControllerDelegate>

@property (nonatomic, strong) MovingViewController *movingVC;

@property (nonatomic, strong) MovingTraceMapControl *movingTraceMapControl;

@end

@implementation MovingControl

- (UIViewController *)viewController
{
    if (!_movingVC)
    {
        _movingVC = [[MovingViewController alloc] initWithNibName:NSStringFromClass([MovingViewController class]) bundle:nil];
        _movingVC.delegate = self;
    }
    
    return _movingVC;
}

- (MovingTraceMapControl *)movingTraceMapControl
{
    if (!_movingTraceMapControl)
    {
        _movingTraceMapControl = [[MovingTraceMapControl alloc] init];
    }
    
    return _movingTraceMapControl;
}

#pragma mark - MovingViewControllerDelegate

- (void)viewDidLoad
{

}

- (void)viewWillDisappear
{

}

- (void)receiveUpdateLocations:(UpdateLocationsCallBack)updateLocationsCallBack
{
    [[ClientControl sharedInstance].client receiveUpdateLocations:updateLocationsCallBack];
}

- (void)pauseMove
{
    
}

- (void)stopMove
{
    [self.movingVC.navigationController popViewControllerAnimated:YES];
    [[ClientControl sharedInstance].client stopUpdatingLocation];
    self.movingVC = nil;
}

- (void)presentMovingTraceMap
{
    [self.movingVC.navigationController pushViewController:self.movingTraceMapControl.viewController animated:YES];
}

@end
