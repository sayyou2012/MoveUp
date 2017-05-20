//
//  RootViewController.h
//  MoveUp
//
//  Created by sayyou2012 on 17/5/20.
//  Copyright © 2017年 sayyou2012. All rights reserved.
//

#import "BaseViewController.h"

@protocol RootViewControllerDelegate <BaseViewControllerDelegate>



@end

@interface RootViewController : BaseViewController

@property (nonatomic, weak) id<RootViewControllerDelegate> delegate;

@end
