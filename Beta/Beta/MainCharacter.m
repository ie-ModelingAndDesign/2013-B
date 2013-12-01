//
//  MainCharacter.m
//  Beta
//
//  Created by vilayouth vongsomxai on 2013/11/24.
//  Copyright (c) 2013年 vilayouth vongsomxai. All rights reserved.
//

#import "MainCharacter.h"
#import "Attack.h"
#import "PlayerDocument.h"
@implementation MainCharacter
-(id)init{
    if(self=[super init]){
        self.image=[CCSprite spriteWithFile:@"test.jpg"];
        //fortest only
        [self.image runAction:[CCScaleTo actionWithDuration:0.1 scaleX:0.1 scaleY:0.1]];
        //CGSize size=[CCDirector sharedDirector].winSize;
        //self.position=ccp(size.width/2, size.height/2);
        [self addChild:self.image];
    }
    return self;
}
-(void)update{
    self.positionx+=self.speedx;
    self.positiony+=self.speedy;
    self.position=ccp(self.positionx, self.positiony);
}
-(void)attack1{
    Attack *a=[[NSClassFromString([PlayerDocument getattack1]) alloc] init];
    a.position=self.position;
    a.startp=self.position;
    [self.parent addChild:a];
}
-(void)attack2{
    Attack *a=[[NSClassFromString([PlayerDocument getattack2]) alloc] init];
    a.position=self.position;
    a.startp=self.position;
    [self.parent addChild:a];
}
-(void)attack3{
    Attack *a=[[NSClassFromString([PlayerDocument getattack3]) alloc] init];
    a.position=self.position;
    a.startp=self.position;
    [self.parent addChild:a];
}
@end
