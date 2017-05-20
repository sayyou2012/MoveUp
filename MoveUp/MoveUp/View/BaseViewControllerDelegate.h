//
//  BaseViewControllerDelegate.h
//  MoveUp
//
//  Created by sayyou2012 on 17/5/20.
//  Copyright © 2017年 sayyou2012. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BaseViewControllerDelegate <NSObject>

@optional
- (void)viewDidLoad;
- (void)viewWillAppear;
- (void)viewDidAppear;
- (void)viewWillDisappear;
- (void)viewDidDisappear;

@end
