//
//  SetControl.m
//  MoveUp
//
//  Created by sayyou2012 on 17/5/21.
//  Copyright © 2017年 sayyou2012. All rights reserved.
//

#import "SetControl.h"

@interface SetControl () <SetViewControllerDelegate>

@property (nonatomic, strong) SetViewController *setVC;

@end

@implementation SetControl

- (UIViewController *)viewController
{
    if (!_setVC)
    {
        _setVC = [[SetViewController alloc] initWithNibName:NSStringFromClass([SetViewController class]) bundle:nil];
        _setVC.tabBarItem.title = @"设置";
        _setVC.delegate = self;
    }
    
    return _setVC;
}

#pragma mark - SetViewControllerDelegate

- (void)viewDidLoad
{
   
}

@end
