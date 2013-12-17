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
        
        self.imageback=[CCSprite spriteWithFile:@"scoreRe.png"]; //returnbutton image
        self.imageback.scale=0.75f;
        CGSize size=[CCDirector sharedDirector].winSize;
        self.imageback.position=ccp(size.width/2,size.height/5); //returnbutoon position
        [self addChild: self.imageback];
        
        self.imagemove=[CCSprite spriteWithFile:@"imagemove.png"];
        self.imagemove.position=ccp(size.width/2-size.width/4, size.height/2+size.height/4);
        [self addChild: self.imagemove];
        
        self.imageattack=[CCSprite spriteWithFile:@"imageattack.png"];;
        self.imageattack.position=ccp(size.width/2-size.width/4, size.height/2-size.height/4);
        [self addChild: self.imageattack];

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
