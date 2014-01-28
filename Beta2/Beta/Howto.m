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
        
        self.imageHow=[CCSprite spriteWithFile:@"play.png"]; //explanation
        self.imageHow.scale=0.75f;
        self.imageHow.position=ccp(size.width/2, size.height-60);
        [self addChild: self.imageHow];
        
        self.imageiphone=[CCSprite spriteWithFile:@"iphonehandscreen.png"]; //iphone
        self.imageiphone.scale=0.75f;
        self.imageiphone.position=ccp(size.width/2, size.height/2-100);
        [self addChild: self.imageiphone];
        
        self.imageattack=[CCSprite spriteWithFile:@"attackbutton.png"]; //attackbutton
        self.imageattack.position=ccp(size.width/2+110, size.height/3);
        self.imageattack.scale=0.75f;
        [self addChild: self.imageattack];
        
        self.imagemove=[CCSprite spriteWithFile:@"movebutton.png"]; //movebutton
        self.imagemove.position=ccp(size.width/2-110, size.height/3);
        self.imagemove.scale=0.75f;
        [self addChild: self.imagemove];
        
        self.imageback=[CCSprite spriteWithFile:@"scoreRe.png"]; //returnbutton image
        //self.imageback.scale=0.75f;
        self.imageback.position=ccp(size.width-50,size.height-30); //returnbutoon position
        [self addChild: self.imageback];
        
        self.isTouchEnabled=YES;
    }
    
    [[SimpleAudioEngine sharedEngine]playBackgroundMusic:@"Howto.mp3" loop:YES];
    
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
