//
//  LocationProtocolInMovingVC.h
//  MoveUp
//
//  Created by sayyou2012 on 17/5/28.
//  Copyright © 2017年 sayyou2012. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol LocationProtocolInMovingVC <NSObject>

@property (nonatomic, assign, readonly) NSInteger altitude;//海拔
@property (nonatomic, copy, readonly) NSString *course;//方向
@property (nonatomic, assign, readonly) NSUInteger speed;//速度

@end
