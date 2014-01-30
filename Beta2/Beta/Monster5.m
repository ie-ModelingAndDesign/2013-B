//
//  Monster5.m
//  Beta
//
//  Created by vilayouth vongsomxai on 2014/01/28.
//  Copyright (c) 2014年 vilayouth vongsomxai. All rights reserved.
//

#import "Monster5.h"

@implementation Monster5
-(id)init{
    if(self=[super init]){
        [self createMonster];
        //        self.position=ccp(size.width, size.height);
        [self schedule:@selector(charge2) interval:3];
    }
    return self;
}

-(void)createMonster {
    self.imageM=[CCSprite spriteWithFile:@"tank.png"];
    [self addChild:self.imageM];
    
    self.attackname = @"shot1-4.png";
    self.status.MaxHP=4000;
    self.status.HP=4000;
    self.status.Attack=200;
    self.status.Speed=0.5f;
    self.radius=25;
}
@end
