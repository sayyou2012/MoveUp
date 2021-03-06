//
//  RootTabBarControl.m
//  MoveUp
//
//  Created by sayyou2012 on 17/5/20.
//  Copyright © 2017年 sayyou2012. All rights reserved.
//

#import "RootTabBarControl.h"
#import "RootTabBarController.h"
#import "BaseViewControllerDelegate.h"
#import "MoveHistoryListControl.h"
#import "ReadyMoveControl.h"
#import "SetControl.h"


@interface RootTabBarControl () <RootTabBarControllerDelegate>

@property (nonatomic, strong) RootTabBarController *rootTabBarController;

@property (nonatomic, strong) MoveHistoryListControl *moveHistoryListControl;
@property (nonatomic, strong) ReadyMoveControl *readyMoveControl;
@property (nonatomic, strong) SetControl *setControl;

@end

@implementation RootTabBarControl

- (UIViewController *)viewController
{
    if (!_rootTabBarController)
    {
        _rootTabBarController = [[RootTabBarController alloc] initWithNibName:NSStringFromClass([RootTabBarController class]) bundle:nil];
        _rootTabBarController.rootTabBarControllerDelegate = self;
    }
    
    return _rootTabBarController;
}

#pragma mark - Lazy Load

- (MoveHistoryListControl *)moveHistoryListControl
{
    if (!_moveHistoryListControl)
    {
        _moveHistoryListControl = [MoveHistoryListControl new];
    }
    
    return _moveHistoryListControl;
}

- (ReadyMoveControl *)readyMoveControl
{
    if (!_readyMoveControl)
    {
        _readyMoveControl = [ReadyMoveControl new];
    }
    
    return _readyMoveControl;
}

- (SetControl *)setControl
{
    if (!_setControl)
    {
        _setControl = [SetControl new];
    }
    
    return _setControl;
}

#pragma mark - RootTabBarControllerDelegate

- (void)viewWillAppear
{
    UIViewController *moveHistoryVC = self.moveHistoryListControl.viewController;
    UIViewController *readyMoveVC = self.readyMoveControl.viewController;
    UIViewController *setVC = self.setControl.viewController;
    
    NSArray *viewControllers = @[moveHistoryVC, readyMoveVC, setVC];
    
    [self.rootTabBarController setViewControllers:viewControllers];
    self.rootTabBarController.selectedIndex = [viewControllers indexOfObject:readyMoveVC];
}


@end
