//
//  CMLocation.h
//  MoveUp
//
//  Created by sayyou2012 on 17/5/25.
//  Copyright © 2017年 sayyou2012. All rights reserved.
//

#import "Location.h"
#import "LocationProtocolInMovingVC.h"
#import "LocationProtocolInMovingTraceMapVC.h"

@interface CMLocation : Location <LocationProtocolInMovingVC,LocationProtocolInMovingTraceMapVC>

@end
