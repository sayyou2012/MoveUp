//
//  MovingViewController.h
//  MoveUp
//
//  Created by sayyou2012 on 17/5/20.
//  Copyright © 2017年 sayyou2012. All rights reserved.
//

#import "BaseViewController.h"

@protocol MovingViewControllerDelegate <BaseViewControllerDelegate>

- (void)pauseMove;
- (void)stopMove;

@end

@interface MovingViewController : BaseViewController

@property (nonatomic, weak) id<MovingViewControllerDelegate> delegate;

@end
