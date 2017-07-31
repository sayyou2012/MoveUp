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

@interface MovingControl () <MovingViewControllerDelegate, CAAnimationDelegate>

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

- (void)viewDidDisappear
{
    //从正在运动界面push到地图界面时(此时的topVC为MovingTraceMapViewController)，也会回调到该方法，但此时不应该设置为nil
    UIViewController *topVC = self.viewController.navigationController.topViewController;
    if (!topVC)
    {
       self.movingVC = nil;
    }
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
    
}

- (void)presentMovingTraceMap
{
    CATransition *transition  = [CATransition animation];
    transition.duration       = 0.3f;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type           = kCATransitionMoveIn;
    transition.subtype        = kCATransitionFromTop;
    transition.delegate       = self;
    [self.movingVC.navigationController.view.layer addAnimation:transition forKey:nil];
    [self.movingVC.navigationController pushViewController:self.movingTraceMapControl.viewController animated:NO];
}

@end
