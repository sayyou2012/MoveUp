//
//  RootControl.m
//  MoveUp
//
//  Created by sayyou2012 on 17/5/20.
//  Copyright © 2017年 sayyou2012. All rights reserved.
//

#import "RootControl.h"
#import "RootViewController.h"
#import "RootNavigationController.h"
#import "RootTabBarControl.h"

@interface RootControl () <RootViewControllerDelegate>

@property (nonatomic, strong) RootViewController *rootVC;

@property (nonatomic, strong) RootTabBarControl *rootTabBarControl;

@end

@implementation RootControl


- (UIViewController *)viewController
{
    if (!_rootVC)
    {
        _rootVC = [[RootViewController alloc] init];
        _rootVC.delegate = self;
    }
    
    return _rootVC;
}

- (RootTabBarControl *)rootTabBarControl
{
    if (!_rootTabBarControl)
    {
        _rootTabBarControl = [[RootTabBarControl alloc] init];
    }
    
    return _rootTabBarControl;
}

#pragma mark - RootViewControllerDelegate

- (void)viewDidLoad
{
    RootNavigationController *rootNavigationController = [[RootNavigationController alloc] initWithRootViewController:self.rootTabBarControl.viewController];
    
    [rootNavigationController setNavigationBarHidden:YES];
    
    [self.rootVC addChildViewController:rootNavigationController];
    
    [self.viewController.view addSubview:rootNavigationController.view];
}


@end
