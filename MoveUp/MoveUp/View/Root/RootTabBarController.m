//
//  RootTabBarController.m
//  MoveUp
//
//  Created by sayyou2012 on 17/5/20.
//  Copyright © 2017年 sayyou2012. All rights reserved.
//

#import "RootTabBarController.h"
#import "MoveHistoryListViewController.h"
#import "ReadyMoveViewController.h"
#import "SetViewController.h"

@interface RootTabBarController ()

@end

@implementation RootTabBarController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    MoveHistoryListViewController *moveHistoryVC = [[MoveHistoryListViewController alloc] initWithNibName:NSStringFromClass([MoveHistoryListViewController class]) bundle:nil];
    moveHistoryVC.tabBarItem.title = @"历史记录";
    
    ReadyMoveViewController *readyMoveVC = [[ReadyMoveViewController alloc] initWithNibName:NSStringFromClass([ReadyMoveViewController class]) bundle:nil];
    readyMoveVC.tabBarItem.title = @"运动";
    
    SetViewController *setVC = [[SetViewController alloc] initWithNibName:NSStringFromClass([SetViewController class]) bundle:nil];
    setVC.tabBarItem.title = @"设置";
    
    [self setViewControllers:@[moveHistoryVC, readyMoveVC, setVC]];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
