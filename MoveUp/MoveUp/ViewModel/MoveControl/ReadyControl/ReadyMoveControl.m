//
//  ReadyMoveControl.m
//  MoveUp
//
//  Created by sayyou2012 on 17/5/21.
//  Copyright © 2017年 sayyou2012. All rights reserved.
//

#import "ReadyMoveControl.h"

@interface ReadyMoveControl () <ReadyMoveViewControllerDelegate>

@property (nonatomic, strong) ReadyMoveViewController *readyMoveVC;

@end

@implementation ReadyMoveControl

- (UIViewController *)viewController
{
    if (!_readyMoveVC)
    {
        _readyMoveVC = [[ReadyMoveViewController alloc] initWithNibName:NSStringFromClass([ReadyMoveViewController class]) bundle:nil];
        
    }
    
    return _readyMoveVC;
}

@end
