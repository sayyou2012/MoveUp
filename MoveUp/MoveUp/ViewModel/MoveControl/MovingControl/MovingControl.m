//
//  MovingControl.m
//  MoveUp
//
//  Created by sayyou2012 on 17/5/21.
//  Copyright © 2017年 sayyou2012. All rights reserved.
//

#import "MovingControl.h"
#import "ClientControl.h"
#import "CMLocation.h"

@interface MovingControl () <MovingViewControllerDelegate>

@property (nonatomic, strong) MovingViewController *movingVC;

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
    
}

@end
