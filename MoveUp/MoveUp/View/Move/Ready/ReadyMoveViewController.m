//
//  ReadyMoveViewController.m
//  MoveUp
//
//  Created by sayyou2012 on 17/5/20.
//  Copyright © 2017年 sayyou2012. All rights reserved.
//

#import "ReadyMoveViewController.h"
#import "MovingViewController.h"

@interface ReadyMoveViewController ()

@end

@implementation ReadyMoveViewController

@dynamic delegate;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
}

#pragma mark - UIButton Actions

- (IBAction)startMoveButtonTouchUpInside:(UIButton *)sender
{
    if ([self.delegate respondsToSelector:@selector(segueToMovingVC)])
    {
        [self.delegate segueToMovingVC];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
