//
//  MainCharacter.m
//  Beta
//
//  Created by vilayouth vongsomxai on 2013/11/24.
//  Copyright (c) 2013年 vilayouth vongsomxai. All rights reserved.
//

#import "MainCharacter.h"

@implementation MainCharacter
-(id)init{
    if(self=[super init]){
        self.image=[CCSprite spriteWithFile:@"test.jpg"];
        //fortest only
        [self.image runAction:[CCScaleTo actionWithDuration:0.1 scaleX:0.1 scaleY:0.1]];
        CGSize size=[CCDirector sharedDirector].winSize;
        self.image.position=ccp(size.width/2, size.height/2);
        [self addChild:self.image];
    }
    return self;
}
-(void)update{
    self.positionx+=self.speedx;
    self.positiony+=self.speedy;
    self.image.position=ccp(self.positionx, self.positiony);
}
@end
