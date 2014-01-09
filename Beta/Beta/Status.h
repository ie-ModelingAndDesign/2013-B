//
//  Status.h
//  Beta
//
//  Created by vilayouth vongsomxai on 2013/12/17.
//  Copyright (c) 2013年 vilayouth vongsomxai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Status : NSObject
@property float HP,MaxHP;
@property float Attack,Speed,AttackSpeed;

+(Status *)sharedStatus;
@end
