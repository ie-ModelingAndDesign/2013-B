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
        self.imageM=[CCSprite spriteWithFile:@"ghast.png"];
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
    float speed=1;
    float dx=-self.position.x+self.target.x;
    float dy=-self.position.y+self.target.y;
    float dr=dx*dx+dy*dy;
    dr=sqrtf(dr);
    self.speedx=dx/dr*speed;
    self.speedy=dy/dr*speed;
    self.positionx+=self.speedx*speed;
    self.positiony+=self.speedy*speed;
    self.position=ccp(self.positionx, self.positiony);
}


@end
