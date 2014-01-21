//
//  CharacterDoc.m
//  Beta
//
//  Created by vilayouth vongsomxai on 2013/11/24.
//  Copyright (c) 2013年 vilayouth vongsomxai. All rights reserved.
//

#import "CharacterDoc.h"
static CharacterDoc *share;
@implementation CharacterDoc
-(id)init {
    if (self = [super init]) {
        self.Name = @"main1-B";
        share = self;
    }
    return self;
}
+(CharacterDoc *)share {
    return share;
}
@end
