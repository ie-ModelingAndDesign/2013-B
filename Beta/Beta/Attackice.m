//
//  Attackice.m
//  Beta
//
//  Created by vilayouth vongsomxai on 2013/12/01.
//  Copyright (c) 2013年 vilayouth vongsomxai. All rights reserved.
//

#import "Attackice.h"

@implementation Attackice
-(id)init{
    if (self=[super init]) {
        self.speedx=-10;
        self.speedy=0;
        CGSize s=[CCDirector sharedDirector].winSize;
        self.position=ccp(s.width/2, s.height/2);
        self.startp=self.position;
        //  self.image=[[CCSprite alloc] initWithFile:@"fire.gif"];
        self.image=[CCSprite spriteWithFile:@"iceball.gif"];
        [self addChild:self.image];
        
        self.lifetime=2;
    }
    return self;
}
@end
