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
#import "CharacterDoc.h"
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
        
        
        self.selectbutton1=[CCSprite spriteWithFile:@"bluebutton.png"];
        self.selectbutton1.position=ccp(size.width - size.width/9,size.height - size.height/3);
        [self addChild:self.selectbutton1];
        
        self.selectbutton2=[CCSprite spriteWithFile:@"redbutton.png"];
        self.selectbutton2.position=ccp(size.width - size.width/9,size.height/2);
        [self addChild:self.selectbutton2];
        
        self.selectbutton3=[CCSprite spriteWithFile:@"greenbutton.png"];
        self.selectbutton3.position=ccp(size.width - size.width/9,size.height/3);
        [self addChild:self.selectbutton3];
        
        self.selectbutton4=[CCSprite spriteWithFile:@"yellowbutton.png"];
        self.selectbutton4.position=ccp(size.width - size.width/9,size.height/6);
        [self addChild:self.selectbutton4];
        
        self.isTouchEnabled=YES;
        [self schedule:@selector(update:)];
        
    }
    
    self.machineNumber = 1;
    [[SimpleAudioEngine sharedEngine]playBackgroundMusic:@"CharacterSetting.mp3" loop:YES];
    
    return self;
    
    
}


-(void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{ //タッチするとこれが実行されます
    
    
    
    for (UITouch *i in touches) {
        CGPoint location=[self convertTouchToNodeSpace:i];
        
        CGSize size=[CCDirector sharedDirector].winSize;
        
        if (CGRectContainsPoint(self.main1bs.boundingBox, location)) {
            [[SimpleAudioEngine sharedEngine]playEffect:@"CharacterSelect.caf"];
            [CharacterDoc share].Name = @"main1-B";
            CCTexture2D *texture=[[CCTextureCache sharedTextureCache] addImage:@"main1b.png"];
            [self.selectedCharacter setTexture:texture];
            
            CCTexture2D *button1=[[CCTextureCache sharedTextureCache] addImage:@"bluebutton.png"];
            [self.selectbutton1 setTexture:button1];
            
            CCTexture2D *button2=[[CCTextureCache sharedTextureCache] addImage:@"redbutton.png"];
            [self.selectbutton2 setTexture:button2];
            
            CCTexture2D *button3=[[CCTextureCache sharedTextureCache] addImage:@"greenbutton.png"];
            [self.selectbutton3 setTexture:button3];
            
            CCTexture2D *button4=[[CCTextureCache sharedTextureCache] addImage:@"yellowbutton.png"];
            [self.selectbutton4 setTexture:button4];
            self.machineNumber = 1;
        }
        
        if (CGRectContainsPoint(self.main2bs.boundingBox, location)) {
            [[SimpleAudioEngine sharedEngine]playEffect:@"CharacterSelect.caf"];
            [CharacterDoc share].Name = @"main2-B";
            CCTexture2D *texture=[[CCTextureCache sharedTextureCache] addImage:@"main2b.png"];
            [self.selectedCharacter setTexture:texture];
            
            CCTexture2D *button1=[[CCTextureCache sharedTextureCache] addImage:@"bluebutton.png"];
            [self.selectbutton1 setTexture:button1];
            
            CCTexture2D *button2=[[CCTextureCache sharedTextureCache] addImage:@"purplebutton.png"];
            [self.selectbutton2 setTexture:button2];
            
            CCTexture2D *button3=[[CCTextureCache sharedTextureCache] addImage:@"greenbutton.png"];
            [self.selectbutton3 setTexture:button3];
            
            CCTexture2D *button4=[[CCTextureCache sharedTextureCache] addImage:@"yellowbutton.png"];
            [self.selectbutton4 setTexture:button4];
            
            self.machineNumber = 2;
            
        }
        
        if (CGRectContainsPoint(self.main3bs.boundingBox, location)) {
            [[SimpleAudioEngine sharedEngine]playEffect:@"CharacterSelect.caf"];
            [CharacterDoc share].Name = @"main3-B";
            CCTexture2D *texture=[[CCTextureCache sharedTextureCache] addImage:@"main3b.png"];
            [self.selectedCharacter setTexture:texture];
            
            CCTexture2D *button1=[[CCTextureCache sharedTextureCache] addImage:@"bluebutton.png"];
            [self.selectbutton1 setTexture:button1];
            
            CCTexture2D *button2=[[CCTextureCache sharedTextureCache] addImage:@"redbutton.png"];
            [self.selectbutton2 setTexture:button2];
            
            CCTexture2D *button3=[[CCTextureCache sharedTextureCache] addImage:@"greenbutton.png"];
            [self.selectbutton3 setTexture:button3];
            
            CCTexture2D *button4=[[CCTextureCache sharedTextureCache] addImage:@"yellowbutton.png"];
            [self.selectbutton4 setTexture:button4];
            
            self.machineNumber = 3;
            
        }
        
        
        //button Setting
        
        
        if (CGRectContainsPoint(self.selectbutton1.boundingBox, location)) {
            [[SimpleAudioEngine sharedEngine]playEffect:@"CharacterSelect.caf"];
            NSString *machineColor = @"null";
            switch (self.machineNumber) {
                case 1:
                    [CharacterDoc share].Name = @"main1-B";
                    machineColor = @"main1b.png";
                    break;
                case 2:
                    [CharacterDoc share].Name = @"main2-B";
                    machineColor = @"main2b.png";
                    break;
                case 3:
                    [CharacterDoc share].Name = @"main3-B";
                    machineColor = @"main3b.png";
                    break;
                    
            }
            
            CCTexture2D *texture=[[CCTextureCache sharedTextureCache] addImage:machineColor];
            [self.selectedCharacter setTexture:texture];
            
            
        }
        
        if (CGRectContainsPoint(self.selectbutton2.boundingBox, location)) {
            [[SimpleAudioEngine sharedEngine]playEffect:@"CharacterSelect.caf"];
            
            NSString *machineColor = @"null";
            switch (self.machineNumber) {
                case 1:
                    [CharacterDoc share].Name = @"main1-R";
                    machineColor = @"main1r.png";
                    break;
                case 2:
                    [CharacterDoc share].Name = @"main2-P";
                    machineColor = @"main2p.png";
                    break;
                case 3:
                    [CharacterDoc share].Name = @"main3-R";
                    machineColor = @"main3r.png";
                    break;
                    
            }
            
            CCTexture2D *texture=[[CCTextureCache sharedTextureCache] addImage:machineColor];
            [self.selectedCharacter setTexture:texture];
        }
        
        if (CGRectContainsPoint(self.selectbutton3.boundingBox, location)) {
            [[SimpleAudioEngine sharedEngine]playEffect:@"CharacterSelect.caf"];
            
            NSString *machineColor = @"null";
            switch (self.machineNumber) {
                case 1:
                    [CharacterDoc share].Name = @"main1-G";
                    machineColor = @"main1g.png";
                    break;
                case 2:
                    [CharacterDoc share].Name = @"main2-G";
                    machineColor = @"main2g.png";
                    break;
                case 3:
                    [CharacterDoc share].Name = @"main3-G";
                    machineColor = @"main3g.png";
                    break;
                    
            }
            
            CCTexture2D *texture=[[CCTextureCache sharedTextureCache] addImage:machineColor];
            [self.selectedCharacter setTexture:texture];
        }
        
        if (CGRectContainsPoint(self.selectbutton4.boundingBox, location)) {
            [[SimpleAudioEngine sharedEngine]playEffect:@"CharacterSelect.caf"];
            
            NSString *machineColor = @"null";
            switch (self.machineNumber) {
                case 1:
                    [CharacterDoc share].Name = @"main1-Y";
                    machineColor = @"main1y.png";
                    break;
                case 2:
                    [CharacterDoc share].Name = @"main2-Y";
                    machineColor = @"main2y.png";
                    break;
                case 3:
                    [CharacterDoc share].Name = @"main3-Y";
                    machineColor = @"main3y.png";
                    break;
                    
            }
            
            CCTexture2D *texture=[[CCTextureCache sharedTextureCache] addImage:machineColor];
            [self.selectedCharacter setTexture:texture];
        }
        
        
        
        if (CGRectContainsPoint(self.Return.boundingBox, location)) {
            [[SimpleAudioEngine sharedEngine]playEffect:@"button.caf"];
            [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[MainMenu scene] ]];
        }
        
        if (CGRectContainsPoint(self.go.boundingBox, location)) {
            [[SimpleAudioEngine sharedEngine]playEffect:@"button.caf"];
            [[SimpleAudioEngine sharedEngine]stopBackgroundMusic];
            [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[GameScene scene] ]];
        }
        
    }
    
}



@end

