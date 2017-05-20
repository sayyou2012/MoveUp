//
//  BaseViewController.h
//  MoveUp
//
//  Created by sayyou2012 on 17/5/20.
//  Copyright © 2017年 sayyou2012. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewControllerDelegate.h"

@interface BaseViewController : UIViewController

@property (nonatomic, weak) id<BaseViewControllerDelegate> delegate;

@end
