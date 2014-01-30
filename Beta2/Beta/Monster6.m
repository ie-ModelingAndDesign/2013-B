//
//  Monster6.m
//  Beta
//
//  Created by vilayouth vongsomxai on 2014/01/28.
//  Copyright (c) 2014年 vilayouth vongsomxai. All rights reserved.
//

#import "Monster6.h"

@implementation Monster6
-(id)init{
    if(self=[super init]){
        [self createMonster];
    }
    return self;
}

-(void)createMonster {
    NSString *name = @"senkan1-1.png";
    NSString *name2 = @"senkan1-2.png";
    CCAnimation *characteranimation =[[CCAnimation alloc] init];
    [characteranimation addSpriteFrameWithFilename:name];
    [characteranimation addSpriteFrameWithFilename:name2];
    characteranimation.delayPerUnit = 0.03;
    CCTexture2D *texture=[[CCTextureCache sharedTextureCache] addImage:name];
    self.imageM = [CCSprite spriteWithTexture:texture];
    
    CCAnimate *animateaction = [CCAnimate actionWithAnimation:characteranimation];
    CCRepeatForever *action = [CCRepeatForever actionWithAction:animateaction];
    [self.imageM runAction:action];
    [self addChild:self.imageM];
    
    CGSize size=[CCDirector sharedDirector].winSize;
    int upordown = arc4random()%2;
    self.position=ccp(arc4random() % (int)size.width, upordown*size.height);
    self.positionx = self.position.x;
    self.positiony = self.position.y;
    self.status=[[Status alloc] init];
    self.status.MaxHP=2500;
    self.status.HP=2500;
    self.status.Attack=400;
    self.status.Speed=2;
    //        self.position=ccp(size.width, size.height);
  //  [self schedule:@selector(charge1) interval:3.0f];
    //        CGSize sizeofimage=[self.imageM boundingBox].size;
    self.radius=25;
    self.attackname=@"shot4-3.png";
    [self schedule:@selector(charge3) interval:3];
}

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
    self.rotation=atan2f(dx, dy)*180/3.14+90;
}
@end
