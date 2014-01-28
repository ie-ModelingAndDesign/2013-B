//
//  Monster4.m
//  Beta
//
//  Created by vilayouth vongsomxai on 2014/01/28.
//  Copyright (c) 2014年 vilayouth vongsomxai. All rights reserved.
//

#import "Monster4.h"

@implementation Monster4
-(id)init{
    if(self=[super init]){
        [self createMonster];
    }
    return self;
}

-(void)createMonster {
    self.imageM=[CCSprite spriteWithFile:@"mask.png"];
    [self addChild:self.imageM];
    CGSize size=[CCDirector sharedDirector].winSize;
    int upordown = arc4random()%2;
    self.position=ccp(arc4random() % (int)size.width, upordown*size.height);
    self.positionx = self.position.x;
    self.positiony = self.position.y;
    self.status=[[Status alloc] init];
    self.status.MaxHP=1000;
    self.status.HP=1000;
    self.status.Attack=100;
    self.status.Speed=0.1f;
    //        self.position=ccp(size.width, size.height);
    [self schedule:@selector(charge1) interval:5.0f];
    //        CGSize sizeofimage=[self.imageM boundingBox].size;
    self.radius=10;
    self.attackname=@"shot3-6.png";
}
@end
