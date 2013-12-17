//
//  Status.m
//  Beta
//
//  Created by vilayouth vongsomxai on 2013/12/17.
//  Copyright (c) 2013年 vilayouth vongsomxai. All rights reserved.
//

#import "Status.h"
static Status* sharedStat;
@implementation Status
+(Status *)sharedStatus{
    return  sharedStat;
}
-(id)init
{
    if (self=[super init]) {
        sharedStat=self;
    }
    return self;
}
@end
