//
//  MoveHistoryListViewController.h
//  MoveUp
//
//  Created by sayyou2012 on 17/5/20.
//  Copyright © 2017年 sayyou2012. All rights reserved.
//

#import "BaseViewController.h"

@protocol MoveHistoryListViewControllerDelegate <BaseViewControllerDelegate>



@end

@interface MoveHistoryListViewController : BaseViewController

@property (nonatomic, weak) id<MoveHistoryListViewControllerDelegate> delegate;

@end
