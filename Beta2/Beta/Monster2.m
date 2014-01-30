//
//  MonsterThird.m
//  Beta
//
//  Created by Yuuto ARAKAWA on 2013/12/10.
//  Copyright (c) 2013年 vilayouth vongsomxai. All rights reserved.
//

#import "Monster2.h"
#import "Attack.h"
@implementation Monster2

-(id)init{
    if(self=[super init]){
        [self createMonster];
    }
    return self;
}

-(void)createMonster {
    self.imageM=[CCSprite spriteWithFile:@"daruma.png"];
    [self addChild:self.imageM];
    CGSize size=[CCDirector sharedDirector].winSize;
    int upordown = arc4random()%2;
    self.position=ccp(arc4random() % (int)size.width, upordown*size.height);
    self.positionx = self.position.x;
    self.positiony = self.position.y;
    
    self.status=[[Status alloc] init];
    self.status.MaxHP=500;
    self.status.HP=500;
    self.status.Attack=18;
    self.status.Speed=0.3f;
    //        self.position=ccp(size.width, size.height);
    //[self schedule:@selector(charge1) interval:3.0f];
    //        CGSize sizeofimage=[self.imageM boundingBox].size;
    self.radius=10;
    self.attackname=@"shot1-1.png";
    [self schedule:@selector(charge3) interval:1];
}

float dx,dy,dr;

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
-(void)charge3{
    
    float Bspeed=25;
    
    dx = self.target.x-self.position.x;
    dy = self.target.y-self.position.y;
    dr =dx*dx+dy*dy;
    dr =sqrtf(dr);
    
    Attack *a=[[Attack alloc] initwithAttackname:self.attackname];
    a.position=ccp(self.position.x,self.position.y);
    a.speedx=dx/dr*2;
    a.speedy=dy/dr*2;
    a.damage=self.status.Attack;
    a.target=1;
    [self.parent addChild:a];

}

@end
