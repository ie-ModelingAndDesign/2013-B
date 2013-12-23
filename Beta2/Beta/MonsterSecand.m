//
//  MonsterSecand.m
//  Beta
//
//  Created by Yuuto ARAKAWA on 2013/12/10.
//  Copyright (c) 2013年 vilayouth vongsomxai. All rights reserved.
//

#import "MonsterSecand.h"
#import "Attackice.h"

@implementation MonsterSecand

-(id)init{
    if(self=[super init]){
        self.imageM=[CCSprite spriteWithFile:@"M.png"];
        [self addChild:self.imageM];
        CGSize size=[CCDirector sharedDirector].winSize;
        //        self.position=ccp(size.width, size.height);
        [self schedule:@selector(charge2) interval:2.0f];
    }
    return self;
}

float dx,dy,dr;
float radian,degree;//角度

float positionx;
float positiony;

float T,c;// a cycle,count

-(void)update{
    
    dx = self.target.x-self.position.x;
    dy = self.target.y-self.position.y;
    dr =dx*dx+dy*dy;
    dr =sqrtf(dr);
    
    degree+=1;
    radian=degree*M_PI/180;
    
    T=100;
    c=c+1;
    if (c>T) {
        c=0;
    }

    
    if(dr >150){
    dr -=1;
    self.positionx = dr*cos(radian)+self.target.x;
    self.positiony = dr*sin(radian)+self.target.y;
    }else{
        dr = 150;
        self.positionx = dr*cos(radian)+self.target.x;
        self.positiony = dr*sin(radian)+self.target.y;
//        self.positionx = dr*cos(c*2*M_PI/T*radian)+self.target.x;
//        self.positiony = dr*sin(c*2*M_PI/T*radian)+self.target.y;
    }
    
    self.position=ccp(self.positionx, self.positiony);
}

-(void)charge2{
    
    float Bspeed=5;
    
    dx = self.target.x-self.position.x;
    dy = self.target.y-self.position.y;
    dr =dx*dx+dy*dy;
    dr =sqrtf(dr);
    
    if(dr<200){
        Attackice *b=[[Attackice alloc] init];
        b.position=ccp(self.position.x,self.position.y);
        b.speedx=dx/dr*Bspeed;
        b.speedy=dy/dr*Bspeed;
        [self.parent addChild:b];        
    }
}

@end
