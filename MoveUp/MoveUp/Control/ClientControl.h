//
//  ClientControl.h
//  MoveUp
//
//  Created by sayyou2012 on 17/5/26.
//  Copyright © 2017年 sayyou2012. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Client.h"

@interface ClientControl : NSObject

@property (nonatomic, strong, readonly) Client *client;

+ (instancetype)sharedInstance;

@end
