//
//  Monster.m
//  Beta
//
//  Created by Yuuto ARAKAWA on 2013/12/05.
//  Copyright (c) 2013年 vilayouth vongsomxai. All rights reserved.
//

#import "Monster.h"

@implementation Monster

-(id)init{
    if(self=[super init]){
        self.imageM=[CCSprite spriteWithFile:@"M.png"];
        [self addChild:self.imageM];
        CGSize size=[CCDirector sharedDirector].winSize;
        self.position=ccp(size.width, size.height);
    }
    return self;
}


/*
 float speed=1;
 float dx=self.position.x-;
 float dy=self.position.y;
 float dr=dx*dx+dy*dy;
 dr=sqrtf(dr);
 self.speedx=dx/dr*speed;
 self.speedy=dy/dr*speed;
 */

-(void)update{
    
    self.positionx+=self.speedx;
    self.positiony+=self.speedy;
    self.position=ccp(self.positionx, self.positiony);
}


@end
