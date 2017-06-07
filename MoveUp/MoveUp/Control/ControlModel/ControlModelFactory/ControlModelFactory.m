//
//  ControlModelFactory.m
//  MoveUp
//
//  Created by sayyou2012 on 17/5/28.
//  Copyright © 2017年 sayyou2012. All rights reserved.
//

#import "ControlModelFactory.h"
#import "CMLocation.h"

@implementation ControlModelFactory

+ (id)createControlModel:(ControlModelType)controlModelType
{
    id controlModel;
    switch (controlModelType)
    {
        case ControlModelTypeLocation:
            controlModel = [[CMLocation alloc] init];
            break;
    }
    
    return controlModel;
}

@end
