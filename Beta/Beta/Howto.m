//
//  Howto.m
//  Beta
//
//  Created by Yuuto ARAKAWA on 2013/12/12.
//  Copyright (c) 2013年 vilayouth vongsomxai. All rights reserved.
//

#import "Howto.h"
#import "MainMenu.h"


@implementation Howto

+(CCScene *) scene
{
    // 'scene' is an autorelease object.
    CCScene *scene = [CCScene node];
    
    // 'layer' is an autorelease object.
    Howto *layer = [Howto node];
    
    // add layer as a child to scene
    [scene addChild: layer];
    
    // return the scene
    return scene;
}

-(id)init{
    if (self=[super init]) {
        
        CGSize size=[CCDirector sharedDirector].winSize;
        
        
        self.imageHowtoplay=[CCSprite spriteWithFile:@"imageiOS.png"];
        CGSize sizebg=[self.imageHowtoplay boundingBox].size;
        self.imageHowtoplay.scaleX=size.width/ sizebg.width;
        self.imageHowtoplay.scaleY=size.height/sizebg.height;
        self.imageHowtoplay.position=ccp(size.width/2, size.height/2);
        [self addChild: self.imageHowtoplay];
        
        self.Shooting=[CCSprite spriteWithFile:@"imageShooting.png"];
        self.Shooting.position=ccp(size.width/2, size.height-50);
        [self addChild: self.Shooting];
        
        self.MoveHandle=[CCSprite spriteWithFile:@"imageMoveHandle.png"];
        self.MoveHandle.position=ccp(size.width/2-120, size.height/2-45);
        [self addChild: self.MoveHandle];

        self.AttackButton=[CCSprite spriteWithFile:@"imageAttackButton.png"];
        self.AttackButton.position=ccp(size.width/2+140, size.height/2-50);
        [self addChild: self.AttackButton];

        self.imageback=[CCSprite spriteWithFile:@"scoreRe.png"]; //returnbutton image
        self.imageback.scale=0.75f;

        self.imageback.position=ccp(size.width/2,size.height/5); //returnbutoon position
        [self addChild: self.imageback];
        
        self.isTouchEnabled=YES;
    }
    return self;
}

-(void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    for (UITouch *i in touches) {
        CGPoint location=[self convertTouchToNodeSpace:i];
        if (CGRectContainsPoint(self.imageback.boundingBox, location)) {
            [[SimpleAudioEngine sharedEngine]playEffect:@"button.mp3"];
            [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[MainMenu scene] ]];
        }
        //        printf("touch");
    }
}


@end
