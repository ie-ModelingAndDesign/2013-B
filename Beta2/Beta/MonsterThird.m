//
//  MonsterThird.m
//  Beta
//
//  Created by Yuuto ARAKAWA on 2013/12/10.
//  Copyright (c) 2013年 vilayouth vongsomxai. All rights reserved.
//

#import "MonsterThird.h"
#import "Attackice.h"

@implementation MonsterThird

-(id)init{
    if(self=[super init]){
        self.imageM=[CCSprite spriteWithFile:@"M.png"];
        [self addChild:self.imageM];
        CGSize size=[CCDirector sharedDirector].winSize;
        
        int randomx,randomy;
        randomx = arc4random() % 300; //0～100の数値をランダムに取得
        randomy= arc4random() % 300; //0～100の数値をランダムに取得
        
        self.position=ccp(randomx,randomy);
        [self schedule:@selector(charge3) interval:1.0f];
    }
    return self;
}



float dx,dy,dr;

-(void)charge3{
    
    float Bspeed=25;
    
    dx = self.target.x-self.position.x;
    dy = self.target.y-self.position.y;
    dr =dx*dx+dy*dy;
    dr =sqrtf(dr);
    
    Attackice *c=[[Attackice alloc] init];
    c.position=ccp(self.position.x,self.position.y);
    c.speedx=dx/dr*Bspeed;
    c.speedy=dy/dr*Bspeed;
    [self.parent addChild:c];


}

@end
