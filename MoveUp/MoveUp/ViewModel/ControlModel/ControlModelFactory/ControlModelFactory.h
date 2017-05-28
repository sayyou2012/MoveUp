//
//  ControlModelFactory.h
//  MoveUp
//
//  Created by sayyou2012 on 17/5/28.
//  Copyright © 2017年 sayyou2012. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, ControlModelType)
{
    ControlModelTypeLocation
};

//简单工厂
@protocol ControlModelFactoryProtocol <NSObject>

/**
 创建Control层的模型对象

 @param controlModelType 类型

 @return 相应的ControlView
 */
+ (id)createControlModel:(ControlModelType)controlModelType;

@end

@interface ControlModelFactory : NSObject <ControlModelFactoryProtocol>

@end
