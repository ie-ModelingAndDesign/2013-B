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
        float randx=random()%360/360*3.14;
        self.position=ccp(sinf(randx)*size.width, randx*size.height);
//        self.position=ccp(size.width, size.height);
        [self schedule:@selector(charge1) interval:3.0f];
//        CGSize sizeofimage=[self.imageM boundingBox].size;
        self.radius=10;
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
        Attack *a=[[Attack alloc] init];
        a.position=ccp(self.position.x,self.position.y);
        a.speedx=dx/dr*Bspeed;
        a.speedy=dy/dr*Bspeed;
        a.damage=10;
        a.target=1;
        [self.parent addChild:a];
    }
}
-(void)handleCollisionWith:(GameObject *)gameObject{
    if ([gameObject isKindOfClass:[Attack class]]) {
        Attack *attack=(Attack *)gameObject;
        self.status.HP-=attack.damage;
    }
}
@end

