//
//  MonsterSecand.m
//  Beta
//
//  Created by Yuuto ARAKAWA on 2013/12/10.
//  Copyright (c) 2013年 vilayouth vongsomxai. All rights reserved.
//

#import "Monster3.h"
#import "Attack.h"
@implementation Monster3

-(id)init{
    if(self=[super init]){
        [self createMonster];
        //        self.position=ccp(size.width, size.height);
        [self schedule:@selector(charge2) interval:0.2f];
    }
    return self;
}

-(void)createMonster {
    self.imageM=[CCSprite spriteWithFile:@"ghost_white.png"];
    [self addChild:self.imageM];
    self.positionx = self.position.x;
    self.positiony = self.position.y;
    self.attackname = @"shot2-1.png";
    self.status.MaxHP=1500;
    self.status.HP=1500;
    self.status.Attack=8;
    self.status.Speed=0.5f;
}

-(void)update{
    
    self.dx = self.target.x-self.position.x;
    self.dy = self.target.y-self.position.y;
    self.dr =self.dx*self.dx+self.dy*self.dy;
    self.dr =sqrtf(self.dr);
    
    self.degree+=0.3f;
    self.radian=self.degree*M_PI/180;
    
    self.T=100;
    self.c=self.c+1;
    if (self.c>self.T) {
        self.c=0;
    }
    
    if(self.dr >150){
        self.dr -=0.1f;
        self.positionx = self.dr*cos(self.radian)+self.target.x;
        self.positiony = self.dr*sin(self.radian)+self.target.y;
    }else{
        self.dr += 0.1f;
        self.positionx = self.dr*cos(self.radian)+self.target.x;
        self.positiony = self.dr*sin(self.radian)+self.target.y;
    }
    
    self.position=ccp(self.positionx, self.positiony);
}

-(void)charge2{
    self.dx = self.target.x-self.position.x;
    self.dy = self.target.y-self.position.y;
    self.dr =self.dx*self.dx+self.dy*self.dy;
    self.dr =sqrtf(self.dr);
    
    if(self.dr<200){
        Attack *b=[[Attack alloc] initwithAttackname:self.attackname];
        b.position=ccp(self.position.x,self.position.y);
        b.speedx=self.dx/self.dr*3;
        b.speedy=self.dy/self.dr*3;
        b.target=1;
        [self.parent addChild:b];
    }
}

@end
