//
//  CharacterSetting.m
//  Beta
//
//  Created by Shiho OMINE on 2013/12/15.
//  Copyright (c) 2013年 vilayouth vongsomxai. All rights reserved.
//

#import "CharacterSetting.h"
#import "MainMenu.h"
#import "GameScene.h"

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
        self.go=[CCSprite spriteWithFile:@"GO.png"];
        self.main1bs=[CCSprite spriteWithFile:@"main1bs.png"];
        self.main2bs=[CCSprite spriteWithFile:@"main2bs.png"];
        self.main3bs=[CCSprite spriteWithFile:@"main3bs.png"];
        self.Return=[CCSprite spriteWithFile:@"return.png"];
        self.status=[CCSprite spriteWithFile:@"Status.png"];
        
        CGSize size=[CCDirector sharedDirector].winSize;
        
        self.back.position=ccp(size.width/2,size.height/2);
        self.go.position=ccp(size.width - size.width/9,size.height - size.height/8);
        self.main1bs.position=ccp(size.width/7,size.height-size.height/3);
        self.main2bs.position=ccp(size.width/7,size.height/2-30);
        self.main3bs.position=ccp(size.width/7,size.height/7);
        self.Return.position=ccp(size.width/9,size.height - size.height/8);
        self.status.position=ccp(size.width/2,size.height/7);
        
        [self addChild: self.back];
        [self addChild: self.go];
        [self addChild: self.main1bs];
        [self addChild: self.main2bs];
        [self addChild: self.main3bs];
        [self addChild: self.Return];
        [self addChild: self.status];
        
        self.selectedCharacter=[CCSprite spriteWithFile:@"main1b.png"];
        self.selectedCharacter.position=ccp(size.width/2,size.height/2+30);
        [self.selectedCharacter runAction:[CCRepeatForever actionWithAction:[CCRotateBy actionWithDuration:1 angle:20 ]]];
        [self addChild:self.selectedCharacter];
        
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
        
        if (CGRectContainsPoint(self.main1bs.boundingBox, location)) {
            [[SimpleAudioEngine sharedEngine]playEffect:@"button.mp3"];
            
            CCTexture2D *texture=[[CCTextureCache sharedTextureCache] addImage:@"main1b.png"];
            [self.selectedCharacter setTexture:texture];
            
            self.bluebutton1=[CCSprite spriteWithFile:@"bluebutton.png"];
            self.bluebutton1.position=ccp(size.width - size.width/9,size.height - size.height/3);
            [self addChild: self.bluebutton1];
            
            self.redbutton1=[CCSprite spriteWithFile:@"redbutton.png"];
            self.redbutton1.position=ccp(size.width - size.width/9,size.height/2);
            [self addChild: self.redbutton1];
            
            self.greenbutton1=[CCSprite spriteWithFile:@"greenbutton.png"];
            self.greenbutton1.position=ccp(size.width - size.width/9,size.height/3);
            [self addChild: self.greenbutton1];
            
            self.yellowbutton1=[CCSprite spriteWithFile:@"yellowbutton.png"];
            self.yellowbutton1.position=ccp(size.width - size.width/9,size.height/6);
            [self addChild: self.yellowbutton1];
            
        }
        
        if (CGRectContainsPoint(self.main2bs.boundingBox, location)) {
            [[SimpleAudioEngine sharedEngine]playEffect:@"button.mp3"];
            
            CCTexture2D *texture=[[CCTextureCache sharedTextureCache] addImage:@"main2b.png"];
            [self.selectedCharacter setTexture:texture];
            
            self.bluebutton2=[CCSprite spriteWithFile:@"bluebutton.png"];
            self.bluebutton2.position=ccp(size.width - size.width/9,size.height - size.height/3);
            [self addChild: self.bluebutton2];
            
            self.purplebutton2=[CCSprite spriteWithFile:@"purplebutton.png"];
            self.purplebutton2.position=ccp(size.width - size.width/9,size.height/2);
            [self addChild: self.purplebutton2];
            
            self.greenbutton2=[CCSprite spriteWithFile:@"greenbutton.png"];
            self.greenbutton2.position=ccp(size.width - size.width/9,size.height/3);
            [self addChild: self.greenbutton2];
            
            self.yellowbutton2=[CCSprite spriteWithFile:@"yellowbutton.png"];
            self.yellowbutton2.position=ccp(size.width - size.width/9,size.height/6);
            [self addChild: self.yellowbutton2];
            
        }
        
        if (CGRectContainsPoint(self.main3bs.boundingBox, location)) {
            [[SimpleAudioEngine sharedEngine]playEffect:@"button.mp3"];
            
            CCTexture2D *texture=[[CCTextureCache sharedTextureCache] addImage:@"main3b.png"];
            [self.selectedCharacter setTexture:texture];
            
            self.bluebutton3=[CCSprite spriteWithFile:@"bluebutton.png"];
            self.bluebutton3.position=ccp(size.width - size.width/9,size.height - size.height/3);
            [self addChild: self.bluebutton3];
            
            self.redbutton3=[CCSprite spriteWithFile:@"redbutton.png"];
            self.redbutton3.position=ccp(size.width - size.width/9,size.height/2);
            [self addChild: self.redbutton3];
            
            self.greenbutton3=[CCSprite spriteWithFile:@"greenbutton.png"];
            self.greenbutton3.position=ccp(size.width - size.width/9,size.height/3);
            [self addChild: self.greenbutton3];
            
            self.yellowbutton3=[CCSprite spriteWithFile:@"yellowbutton.png"];
            self.yellowbutton3.position=ccp(size.width - size.width/9,size.height/6);
            [self addChild: self.yellowbutton3];
            
        }
        
        
        //button Setting
        //main1
        if (CGRectContainsPoint(self.bluebutton1.boundingBox, location)) {
            [[SimpleAudioEngine sharedEngine]playEffect:@"button.mp3"];
            
            CCTexture2D *texture=[[CCTextureCache sharedTextureCache] addImage:@"main1b.png"];
            [self.selectedCharacter setTexture:texture];
            
        }
        
        if (CGRectContainsPoint(self.redbutton1.boundingBox, location)) {
            [[SimpleAudioEngine sharedEngine]playEffect:@"button.mp3"];
            
            CCTexture2D *texture=[[CCTextureCache sharedTextureCache] addImage:@"main1r.png"];
            [self.selectedCharacter setTexture:texture];
        }
        
        if (CGRectContainsPoint(self.greenbutton1.boundingBox, location)) {
            [[SimpleAudioEngine sharedEngine]playEffect:@"button.mp3"];
            
            CCTexture2D *texture=[[CCTextureCache sharedTextureCache] addImage:@"main1g.png"];
            [self.selectedCharacter setTexture:texture];
        }
        
        if (CGRectContainsPoint(self.yellowbutton1.boundingBox, location)) {
            [[SimpleAudioEngine sharedEngine]playEffect:@"button.mp3"];
            
            CCTexture2D *texture=[[CCTextureCache sharedTextureCache] addImage:@"main1y.png"];
            [self.selectedCharacter setTexture:texture];
        }
        
        
        //button Setting
        //main2
        
        if (CGRectContainsPoint(self.bluebutton2.boundingBox, location)) {
            [[SimpleAudioEngine sharedEngine]playEffect:@"button.mp3"];
            
            CCTexture2D *texture=[[CCTextureCache sharedTextureCache] addImage:@"main2b.png"];
            [self.selectedCharacter setTexture:texture];
            
        }
        
        if (CGRectContainsPoint(self.purplebutton2.boundingBox, location)) {
            [[SimpleAudioEngine sharedEngine]playEffect:@"button.mp3"];
            
            CCTexture2D *texture=[[CCTextureCache sharedTextureCache] addImage:@"main2p.png"];
            [self.selectedCharacter setTexture:texture];
        }
        
        if (CGRectContainsPoint(self.greenbutton2.boundingBox, location)) {
            [[SimpleAudioEngine sharedEngine]playEffect:@"button.mp3"];
            
            CCTexture2D *texture=[[CCTextureCache sharedTextureCache] addImage:@"main2g.png"];
            [self.selectedCharacter setTexture:texture];
        }
        
        if (CGRectContainsPoint(self.yellowbutton2.boundingBox, location)) {
            [[SimpleAudioEngine sharedEngine]playEffect:@"button.mp3"];
            
            CCTexture2D *texture=[[CCTextureCache sharedTextureCache] addImage:@"main2y.png"];
            [self.selectedCharacter setTexture:texture];
        }
        
        
        //button Setting
        //main3
        
        if (CGRectContainsPoint(self.bluebutton3.boundingBox, location)) {
            [[SimpleAudioEngine sharedEngine]playEffect:@"button.mp3"];
            
            CCTexture2D *texture=[[CCTextureCache sharedTextureCache] addImage:@"main3b.png"];
            [self.selectedCharacter setTexture:texture];
            
        }
        
        if (CGRectContainsPoint(self.redbutton3.boundingBox, location)) {
            [[SimpleAudioEngine sharedEngine]playEffect:@"button.mp3"];
            
            CCTexture2D *texture=[[CCTextureCache sharedTextureCache] addImage:@"main3r.png"];
            [self.selectedCharacter setTexture:texture];
        }
        
        if (CGRectContainsPoint(self.greenbutton3.boundingBox, location)) {
            [[SimpleAudioEngine sharedEngine]playEffect:@"button.mp3"];
            
            CCTexture2D *texture=[[CCTextureCache sharedTextureCache] addImage:@"main3g.png"];
            [self.selectedCharacter setTexture:texture];
        }
        
        if (CGRectContainsPoint(self.yellowbutton3.boundingBox, location)) {
            [[SimpleAudioEngine sharedEngine]playEffect:@"button.mp3"];
            
            CCTexture2D *texture=[[CCTextureCache sharedTextureCache] addImage:@"main3y.png"];
            [self.selectedCharacter setTexture:texture];
        }
        
        
        
        if (CGRectContainsPoint(self.Return.boundingBox, location)) {
            [[SimpleAudioEngine sharedEngine]playEffect:@"button.mp3"];
            [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[MainMenu scene] ]];
        }
        
        if (CGRectContainsPoint(self.go.boundingBox, location)) {
            [[SimpleAudioEngine sharedEngine]playEffect:@"button.mp3"];
            [[SimpleAudioEngine sharedEngine]stopBackgroundMusic];
            [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[GameScene scene] ]];
        }
        
    }
    
}



@end
