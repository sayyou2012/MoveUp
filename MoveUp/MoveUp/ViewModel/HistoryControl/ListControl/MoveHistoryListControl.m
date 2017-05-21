//
//  MoveHistoryListControl.m
//  MoveUp
//
//  Created by sayyou2012 on 17/5/21.
//  Copyright © 2017年 sayyou2012. All rights reserved.
//

#import "MoveHistoryListControl.h"

@interface MoveHistoryListControl ()

@property (nonatomic, strong) MoveHistoryListViewController *moveHistoryListVC;

@end

@implementation MoveHistoryListControl

- (UIViewController *)viewController
{
    if (!_moveHistoryListVC)
    {
        _moveHistoryListVC = [[MoveHistoryListViewController alloc] initWithNibName:NSStringFromClass([MoveHistoryListViewController class]) bundle:nil];
        
    }
    
    return _moveHistoryListVC;
}

@end
