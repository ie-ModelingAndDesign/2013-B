//
//  Item.m
//  Beta
//
//  Created by vilayouth vongsomxai on 2014/02/06.
//  Copyright (c) 2014年 vilayouth vongsomxai. All rights reserved.
//

#import "Item.h"
#import "MainCharacter.h"
@implementation Item

-(id)init {
    if (self = [super init]) {
        CCSprite *sprite = [CCSprite spriteWithFile:@"Life1.png"];
        [self addChild:sprite];
        CCScaleTo       *scale1 = [CCScaleTo actionWithDuration:0.1 scale:1.3];
        CCScaleTo       *scale2 = [CCScaleTo actionWithDuration:0.1 scale:0.8];
        CCSequence    *sequence = [CCSequence actions:scale1, scale2, nil];
        CCRepeatForever *action = [CCRepeatForever actionWithAction:sequence];
        self.radius = 10;
        [self runAction:action];
    }
    return self;
}

-(void)handleCollisionWith:(GameObject *)gameObject {
    if ([gameObject isKindOfClass:[MainCharacter class]]) {
        self.isScheduledForRemove = YES;
    }
}
@end
