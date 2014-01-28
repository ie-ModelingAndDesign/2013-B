//
//  Monster.m
//  Beta
//
//  Created by Yuuto ARAKAWA on 2013/12/05.
//  Copyright (c) 2013年 vilayouth vongsomxai. All rights reserved.
//

#import "Monster1.h"
#import "Attack.h"
@implementation Monster1

-(id)init{
    if(self=[super init]){
        [self createMonster];
    }
    return self;
}

-(void)createMonster {
    self.imageM=[CCSprite spriteWithFile:@"ghast.png"];
    [self addChild:self.imageM];
    CGSize size=[CCDirector sharedDirector].winSize;
    float randx=random()%360/360*3.14;
    self.position=ccp(sinf(randx)*size.width, randx*size.height);
    self.status=[[Status alloc] init];
    self.status.MaxHP=100;
    self.status.HP=100;
    self.status.Attack=50;
    self.status.Speed=0.5f;
    //        self.position=ccp(size.width, size.height);
    [self schedule:@selector(charge1) interval:2.0f];
    //        CGSize sizeofimage=[self.imageM boundingBox].size;
    self.radius=10;
    self.attackname=@"shot1-2.png";
}

-(id)initWithName:(NSString *)name attackName:(NSString *)attack{
    if(self=[super init]){
        self.imageM=[CCSprite spriteWithFile:name];
        [self addChild:self.imageM];
        CGSize size=[CCDirector sharedDirector].winSize;
        float randx=random()%360/360*3.14;
        self.position=ccp(sinf(randx)*size.width, randx*size.height);
        //        self.position=ccp(size.width, size.height);
        [self schedule:@selector(charge1) interval:3.0f];
        //        CGSize sizeofimage=[self.imageM boundingBox].size;
        self.radius=10;
        self.attackname=attack;
    }
    return self;
}

float speed=1;
float dx,dy,dr;
float positionx;
float positiony;


-(void)update{
    float dx=self.target.x-self.position.x;
    float dy=self.target.y-self.position.y;
    float dr=dx*dx+dy*dy;
    dr=sqrtf(dr);
    
    if (dr > 150) {

    self.positionx+=dx/dr*self.status.Speed;
    self.positiony+=dy/dr*self.status.Speed;
    
    self.position=ccp(self.positionx, self.positiony);
        
    }
    if (self.status.HP<=0) {
        self.isScheduledForRemove=YES;
    }
        
}

-(void)charge1{
    
    dx = self.target.x-self.position.x;
    dy = self.target.y-self.position.y;
    dr=dx*dx+dy*dy;
    dr=sqrtf(dr);
  
    float Bspeed=5;
    
    if(dr<150){
        Attack *a=[[Attack alloc] initwithAttackname:self.attackname];
        a.position=ccp(self.position.x,self.position.y);
        a.speedx=dx/dr*3;
        a.speedy=dy/dr*3;
        a.damage=self.status.Attack;
        a.target=1;
        [self.parent addChild:a];
    }
}
-(void)handleCollisionWith:(GameObject *)gameObject{
    if ([gameObject isKindOfClass:[Attack class]]) {
        Attack *attack=(Attack *)gameObject;
        self.status.HP-=attack.damage;
        if (self.status.HP <= 0) {
            self.isScheduledForRemove =YES;
        }
    }
}
@end

