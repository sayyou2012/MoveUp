//
//  ReadyMoveControl.m
//  MoveUp
//
//  Created by sayyou2012 on 17/5/21.
//  Copyright © 2017年 sayyou2012. All rights reserved.
//

#import "ReadyMoveControl.h"
#import "MovingControl.h"

@interface ReadyMoveControl () <ReadyMoveViewControllerDelegate>

@property (nonatomic, strong) ReadyMoveViewController *readyMoveVC;

@property (nonatomic, strong) MovingControl *movingControl;

@end

@implementation ReadyMoveControl

- (UIViewController *)viewController
{
    if (!_readyMoveVC)
    {
        _readyMoveVC = [[ReadyMoveViewController alloc] initWithNibName:NSStringFromClass([ReadyMoveViewController class]) bundle:nil];
        _readyMoveVC.tabBarItem.title = @"运动";
        _readyMoveVC.delegate = self;
    }
    
    return _readyMoveVC;
}

#pragma mark - Lazy Load

- (MovingControl *)movingControl
{
    if (!_movingControl)
    {
        _movingControl = [[MovingControl alloc] init];
    }
    
    return _movingControl;
}

#pragma mark - ReadyMoveViewControllerDelegate

- (void)viewDidLoad
{
    
}

- (void)segueToMovingVC
{
    [self.readyMoveVC.navigationController pushViewController:self.movingControl.viewController animated:YES];
}

@end
