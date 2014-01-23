//
//  settingDoc.m
//  Beta
//
//  Created by vilayouth vongsomxai on 2014/01/23.
//  Copyright (c) 2014年 vilayouth vongsomxai. All rights reserved.
//

#import "settingDoc.h"
static settingDoc *share;
@implementation settingDoc
+(settingDoc *)share {
    return share;
}
-(id)init {
    if (self =[super init]) {
        self.isEffectSund= YES;
        self.isBGM =YES;
        share = self;
    }
    return self;
}
@end
