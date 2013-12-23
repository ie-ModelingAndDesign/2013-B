//
//  Monster.m
//  Beta
//
//  Created by Yuuto ARAKAWA on 2013/12/05.
//  Copyright (c) 2013年 vilayouth vongsomxai. All rights reserved.
//

#import "Monster.h"
#import "Attack.h"
@implementation Monster

-(id)init{
    if(self=[super init]){
        self.imageM=[CCSprite spriteWithFile:@"ghast.png"];
        [self addChild:self.imageM];
        CGSize size=[CCDirector sharedDirector].winSize;
//        self.position=ccp(size.width, size.height);
        [self schedule:@selector(charge1) interval:3.0f];
    }
    return self;
}


float speed=1;
float dx,dy,dr;
float positionx;
float positiony;


-(void)update{
    float speed=1;
    float dx=self.target.x-self.position.x;
    float dy=self.target.y-self.position.y;
    float dr=dx*dx+dy*dy;
    dr=sqrtf(dr);
    
    if (dr > 150) {

    self.positionx+=dx/dr*speed;
    self.positiony+=dy/dr*speed;
    
    self.position=ccp(self.positionx, self.positiony);
    }
        
}

-(void)charge1{
    
    dx = self.target.x-self.position.x;
    dy = self.target.y-self.position.y;
    dr=dx*dx+dy*dy;
    dr=sqrtf(dr);
  
    float Bspeed=5;
    
    if(dr<150){
        Attack *a=[[Attack alloc] init];
        a.position=ccp(self.position.x,self.position.y);
        a.speedx=dx/dr*Bspeed;
        a.speedy=dy/dr*Bspeed;
        [self.parent addChild:a];
    }
}

@end

