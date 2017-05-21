//
//  MovingViewController.m
//  MoveUp
//
//  Created by sayyou2012 on 17/5/20.
//  Copyright © 2017年 sayyou2012. All rights reserved.
//

#import "MovingViewController.h"

@interface MovingViewController ()

@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@property (weak, nonatomic) IBOutlet UILabel *distanceLabel;

@property (weak, nonatomic) IBOutlet UILabel *speedLabel;

@end

@implementation MovingViewController

@dynamic delegate;

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
}

#pragma mark - UIButton Actions

/**
 暂停运动
 */
- (IBAction)pauseMoveButtonTouchUpInside:(UIButton *)sender
{
    if ([self.delegate respondsToSelector:@selector(pauseMove)])
    {
        [self.delegate pauseMove];
    }
}

/**
 结束运动
 */
- (IBAction)stopMoveButtonTouchUpInside:(UIButton *)sender
{
    if ([self.delegate respondsToSelector:@selector(stopMove)])
    {
        [self.delegate stopMove];
    }
}


/**
 切换距离的显示方式
 */
- (IBAction)switchDistanceShowType:(UIButton *)sender
{
    
}

/**
 切换速度的显示方式
 */
- (IBAction)switchSpeedShowType:(UIButton *)sender
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
