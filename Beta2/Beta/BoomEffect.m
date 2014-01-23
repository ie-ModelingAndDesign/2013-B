//
//  BoomEffect.m
//  Beta
//
//  Created by vilayouth vongsomxai on 2014/01/23.
//  Copyright (c) 2014年 vilayouth vongsomxai. All rights reserved.
//

#import "BoomEffect.h"
#import "settingDoc.h"
#import "SimpleAudioEngine.h"
@implementation BoomEffect

-(id)initWithPoistion:(CGPoint)point {
    if (self =[super init]) {
        CCAnimation *characteranimation =[[CCAnimation alloc] init];
        [characteranimation addSpriteFrameWithFilename:@"exp1.png"];
        [characteranimation addSpriteFrameWithFilename:@"exp2.png"];
        [characteranimation addSpriteFrameWithFilename:@"exp3.png"];
        [characteranimation addSpriteFrameWithFilename:@"exp4.png"];
        characteranimation.delayPerUnit = 0.03;
        CCTexture2D *texture=[[CCTextureCache sharedTextureCache] addImage:@"exp1.png"];
        CCSprite *image = [CCSprite spriteWithTexture:texture];
        self.count = 0;
        self.lifetime = 0.5f;
        self.position = point;
        CCAnimate *animateaction = [CCAnimate actionWithAnimation:characteranimation];
        CCRepeatForever *action = [CCRepeatForever actionWithAction:animateaction];
        [image runAction:action];
        [self addChild:image];
        
        if ([settingDoc share].isEffectSund) {
            [[SimpleAudioEngine sharedEngine] playEffect:@"explosion.caf" pitch:1.4 pan:0 gain:1];
        }
    }
    return self;
}

-(void)update {
    self.count +=0.03f;
    if (self.lifetime < self.count) {
        self.isScheduledForRemove = YES;
    }
}

@end
