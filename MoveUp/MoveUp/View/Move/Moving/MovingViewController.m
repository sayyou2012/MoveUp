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
@property (weak, nonatomic) IBOutlet UILabel *accuracyLabel;

@property (strong, nonatomic) NSTimer *timer;
//开始运动后所经过的秒数
@property (assign, nonatomic) NSUInteger secondCount;
@property (assign, nonatomic) NSUInteger distance;

//@property (nonatomic, strong) id<LocationProtocolInMovingVC> model;

@end

@implementation MovingViewController

@dynamic delegate;

- (void)dealloc
{
    NSLog(@"%s", __func__);
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(private_scheduledTimerActions) userInfo:nil repeats:YES];
        
        [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    if ([self.delegate respondsToSelector:@selector(receiveUpdateLocations:)])
    {
        __weak typeof(self) weakSelf = self;
        [self.delegate receiveUpdateLocations:^(NSArray *locations, NSError *error) {
            id<LocationProtocolInMovingVC> lastModel = locations.lastObject;
            id<LocationProtocolInMovingVC> secondFromLast = locations[locations.count - 2];
            if (locations.count > 1)
            {
                CLLocationDistance distance = [lastModel distanceFrom:secondFromLast];
                if (distance <= 0 || _secondCount <= 0)
                {
                    return;
                }
                
                _distance += distance;
                [weakSelf private_updateUI];
                _accuracyLabel.text = [NSString stringWithFormat:@"%f", lastModel.horizontalAccuracy];
            }
        }];
    }
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [_timer invalidate];
    _timer = nil;
}

//#pragma mark - Setter
//
//- (void)setModel:(id<LocationProtocolInMovingVC>)model
//{
//    _distanceLabel.text = [NSString stringWithFormat:@"%lu", (unsigned long)model.altitude];
//    _speedLabel.text    = [NSString stringWithFormat:@"%lu", (unsigned long)model.speed];
//}

#pragma mark - UIButton Actions

/**
 暂停运动
 */
- (IBAction)startOrPauseMoveButtonTouchUpInside:(UIButton *)sender
{
    if (sender.isSelected)//暂停
    {
        NSLog(@"暂停");
        [_timer setFireDate:[NSDate distantFuture]];
        
    }
    else//继续
    {
        NSLog(@"继续");
        [_timer setFireDate:[NSDate dateWithTimeIntervalSinceNow:1.0]];
        
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
 展示地图
 */
- (IBAction)presentMapButtonTouchUpInside:(UIButton *)sender
{
    if ([self.delegate respondsToSelector:@selector(presentMovingTraceMap)])
    {
        [self.delegate presentMovingTraceMap];
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


/**
 定时器定时执行的动作
 */
- (void)private_scheduledTimerActions
{
    NSLog(@"动起来");
    ++_secondCount;
    _timeLabel.text = [self private_switchSecond2String:_secondCount];
}

- (void)private_updateUI
{
    _distanceLabel.text = [NSString stringWithFormat:@"%lu", (unsigned long)_distance];
    CGFloat averageSpeed = _distance/_secondCount;
    _speedLabel.text = [NSString stringWithFormat:@"%.2f", averageSpeed];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
