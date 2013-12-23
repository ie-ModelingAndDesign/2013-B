//
//  CharacterSetting.m
//  Beta
//
//  Created by Shiho OMINE on 2013/12/15.
//  Copyright (c) 2013年 vilayouth vongsomxai. All rights reserved.
//

#import "CharacterSetting.h"
#import "MainMenu.h"

@implementation CharacterSetting

+(CCScene *) scene
{
    // 'scene' is an autorelease object.
    CCScene *scene = [CCScene node];
    
    // 'layer' is an autorelease object.
    CharacterSetting *layer = [CharacterSetting node];
    
    // add layer as a child to scene
    [scene addChild: layer];
    
    // return the scene
    return scene;
}

-(id) init
{
    // always call "super" init
    // Apple recommends to re-assign "self" with the "super's" return value
    if( (self=[super init]) ) {
        self.back=[CCSprite spriteWithFile:@"charactersettingback.png"];
        self.main1bs=[CCSprite spriteWithFile:@"main1bs.png"];
        self.main2bs=[CCSprite spriteWithFile:@"main2bs.png"];
        self.main3bs=[CCSprite spriteWithFile:@"main3bs.png"];
        self.Return=[CCSprite spriteWithFile:@"return.png"];
        self.status=[CCSprite spriteWithFile:@"Status.png"];
        
        CGSize size=[CCDirector sharedDirector].winSize;
        
        self.back.position=ccp(size.width/2,size.height/2);
        self.main1bs.position=ccp(size.width/7,size.height-size.height/3);
        self.main2bs.position=ccp(size.width/7,size.height/2-30);
        self.main3bs.position=ccp(size.width/7,size.height/7);
        self.Return.position=ccp(size.width/9,size.height - size.height/8);
        self.status.position=ccp(size.width/2,size.height/7);
        
        [self addChild: self.back];
        [self addChild: self.main1bs];
        [self addChild: self.main2bs];
        [self addChild: self.main3bs];
        [self addChild: self.Return];
        [self addChild: self.status];
        
        self.isTouchEnabled=YES;
        [self schedule:@selector(update:)];
    }
    
    [[SimpleAudioEngine sharedEngine]playBackgroundMusic:@"CharacterSetting.mp3" loop:YES];
    
    return self;
}

-(void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{ //タッチするとこれが実行されます
    for (UITouch *i in touches) {
        CGPoint location=[self convertTouchToNodeSpace:i];

        CGSize size=[CCDirector sharedDirector].winSize;
        
        /*if (CGRectContainsPoint(self.main1bs.boundingBox, location)) {
            [[SimpleAudioEngine sharedEngine]playEffect:@"button.mp3"];
            self.main1b=[CCSprite spriteWithFile:@"main1b.png"];
            self.main1b.position=ccp(size.width/2,size.height/2+30);
            [self addChild: self.main1b];

        }

        if (CGRectContainsPoint(self.main2bs.boundingBox, location)) {
            [[SimpleAudioEngine sharedEngine]playEffect:@"button.mp3"];
            self.main2b=[CCSprite spriteWithFile:@"main2b.png"];
            self.main2b.position=ccp(size.width/2,size.height/2+30);
            [self addChild: self.main2b];
        }

        if (CGRectContainsPoint(self.main3bs.boundingBox, location)) {
            [[SimpleAudioEngine sharedEngine]playEffect:@"button.mp3"];
            self.main3b=[CCSprite spriteWithFile:@"main3b.png"];
            self.main3b.position=ccp(size.width/2,size.height/2+30);
            [self addChild: self.main3b];
        }*/
        
        if (CGRectContainsPoint(self.Return.boundingBox, location)) {
            [[SimpleAudioEngine sharedEngine]playEffect:@"button.mp3"];
            [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[MainMenu scene] ]];
        }

    }
}



@end
