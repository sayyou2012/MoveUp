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

@property (strong, nonatomic) dispatch_source_t timer;
@property (assign, nonatomic) NSUInteger secondCount;//开始运动后所经过的秒数

@end

@implementation MovingViewController

@dynamic delegate;

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_main_queue());
        dispatch_time_t start = dispatch_time(DISPATCH_TIME_NOW, 1.0 * NSEC_PER_SEC);
        dispatch_source_set_timer(_timer, start, 5.0 * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
        dispatch_source_set_event_handler(_timer, ^{
            NSLog(@"动起来");
            ++_secondCount;
            _timeLabel.text = [self private_switchSecond2String:_secondCount];
        });
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
}

#pragma mark - UIButton Actions

/**
 暂停运动
 */
- (IBAction)startOrPauseMoveButtonTouchUpInside:(UIButton *)sender
{
    if (sender.isSelected)//暂停
    {
        NSLog(@"暂停");
        dispatch_suspend(_timer);
        
    }
    else//开始
    {
        NSLog(@"开始");
        dispatch_resume(_timer);
        
        if ([self.delegate respondsToSelector:@selector(pauseMove)])
        {
            [self.delegate pauseMove];
        }
    }

    sender.selected = !sender.isSelected;
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

#pragma mark - Private Methods


/**
 将秒数转化为NSString类型，时分秒格式(00:00:00)

 @param secondCount 秒数

 @return 时分秒格式的字符串
 */
- (NSString *)private_switchSecond2String:(NSUInteger)secondCount
{
    NSUInteger hour = secondCount / 3600;
    NSUInteger hourRemainder = secondCount % 3600;
    NSUInteger minute = hourRemainder / 60;
    NSUInteger second = hourRemainder % 60;
    
    return [NSString stringWithFormat:@"%02lu:%02lu:%02lu", (unsigned long)hour, (unsigned long)minute, (unsigned long)second];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
