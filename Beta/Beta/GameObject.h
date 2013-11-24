//
//  GameObject.h
//  Beta
//
//  Created by vilayouth vongsomxai on 2013/11/24.
//  Copyright (c) 2013年 vilayouth vongsomxai. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "cocos2d.h"
@interface GameObject : CCNode


@property (nonatomic,assign) BOOL isScheduledForRemove;
@property float radius;

- (void) update;
- (void) handleCollisionWith:(GameObject*)gameObject;
@end
