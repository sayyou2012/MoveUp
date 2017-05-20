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
#import "MoveHistoryListViewController.h"
#import "ReadyMoveViewController.h"
#import "SetViewController.h"

@interface RootTabBarControl () <RootTabBarControllerDelegate>

@property (nonatomic, strong) RootTabBarController *rootTabBarController;

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

#pragma mark - RootTabBarControllerDelegate


@end
