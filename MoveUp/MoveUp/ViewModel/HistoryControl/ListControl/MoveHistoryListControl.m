//
//  MoveHistoryListControl.m
//  MoveUp
//
//  Created by sayyou2012 on 17/5/21.
//  Copyright © 2017年 sayyou2012. All rights reserved.
//

#import "MoveHistoryListControl.h"

@interface MoveHistoryListControl () <MoveHistoryListViewControllerDelegate>

@property (nonatomic, strong) MoveHistoryListViewController *moveHistoryListVC;

@end

@implementation MoveHistoryListControl

- (UIViewController *)viewController
{
    if (!_moveHistoryListVC)
    {
        _moveHistoryListVC = [[MoveHistoryListViewController alloc] initWithNibName:NSStringFromClass([MoveHistoryListViewController class]) bundle:nil];
        _moveHistoryListVC.tabBarItem.title = @"历史记录";
        _moveHistoryListVC.delegate = self;
    }
    
    return _moveHistoryListVC;
}

#pragma mark - MoveHistoryListViewControllerDelegate

- (void)viewDidLoad
{
    
}

@end
