//
//  MovingViewController.m
//  MoveUp
//
//  Created by sayyou2012 on 17/5/20.
//  Copyright © 2017年 sayyou2012. All rights reserved.
//

#import "MovingViewController.h"

@interface MovingViewController ()

@end

@implementation MovingViewController

@dynamic delegate;

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
}

#pragma mark - UIButton Actions

- (IBAction)pauseMoveButtonTouchUpInside:(UIButton *)sender
{
    if ([self.delegate respondsToSelector:@selector(pauseMove)])
    {
        [self.delegate pauseMove];
    }
}

- (IBAction)stopMoveButtonTouchUpInside:(UIButton *)sender
{
    if ([self.delegate respondsToSelector:@selector(stopMove)])
    {
        [self.delegate stopMove];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
