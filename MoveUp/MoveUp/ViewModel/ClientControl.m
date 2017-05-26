//
//  ClientControl.m
//  MoveUp
//
//  Created by sayyou2012 on 17/5/26.
//  Copyright © 2017年 sayyou2012. All rights reserved.
//

#import "ClientControl.h"

@interface ClientControl ()

@property (nonatomic, strong, readwrite) Client *client;

@end

@implementation ClientControl

+ (instancetype)sharedInstance
{
    static ClientControl *clientControl;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        clientControl = [[ClientControl alloc] init];
    });
    
    return clientControl;
}

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        _client = [[Client alloc] init];
    }
    
    return self;
}

@end
