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
#import "CharacterDoc.h"
@implementation MainCharacter
-(id)init{
    if(self=[super init]){
        //animation
    //    NSLog(@"character name : %@",[CharacterDoc share].Name);
        NSString *name =[[CharacterDoc share].Name stringByAppendingString:@"1.png"];
        NSString *name2 =[[CharacterDoc share].Name stringByAppendingString:@"2.png"];
        CCAnimation *characteranimation =[[CCAnimation alloc] init];
        [characteranimation addSpriteFrameWithFilename:name];
        [characteranimation addSpriteFrameWithFilename:name2];
        characteranimation.delayPerUnit = 0.03;
        CCTexture2D *texture=[[CCTextureCache sharedTextureCache] addImage:name];
        self.image = [CCSprite spriteWithTexture:texture];
        self.image.scale = 2;
        CCAnimate *animateaction = [CCAnimate actionWithAnimation:characteranimation];
        CCRepeatForever *action = [CCRepeatForever actionWithAction:animateaction];
        [self.image runAction:action];
        [self addChild:self.image];

        NSArray *characterName = [[CharacterDoc share].Name componentsSeparatedByString:@"-"];
        NSString *theName = [characterName objectAtIndex:0];
        if ([theName isEqualToString:@"main1"]) {
            self.status =[[Status alloc]init];
            self.status.MaxHP=1500;
            self.status.HP=self.status.MaxHP;
            self.status.Speed = 1.5f;
            self.status.Attack=250;
            self.speedx =0;
            self.speedy =0;
            self.direction = ccp(0, 1);
            self.radius=3;

        }else if ([theName isEqualToString:@"main2"]) {
            self.status =[[Status alloc]init];
            self.status.MaxHP=3000;
            self.status.HP=self.status.MaxHP;
            self.status.Speed = 1.5f;
            self.status.Attack=150;
            self.speedx =0;
            self.speedy =0;
            self.direction = ccp(0, 1);
            self.radius=3;
        }else if ([theName isEqualToString:@"main3"]) {
            self.status =[[Status alloc]init];
            self.status.MaxHP=1500;
            self.status.HP=self.status.MaxHP;
            self.status.Speed = 3.5f;
            self.status.Attack=150;
            self.speedx =0;
            self.speedy =0;
            self.direction = ccp(0, 1);
            self.radius=3;
        }
        NSString *theequipment = [characterName objectAtIndex:1];
        if ([theequipment isEqualToString:@"B"]) {
            self.status.Attack *=1.3f;
            self.status.MaxHP *= 1.3f;
            self.status.HP *= 1.3f;
            self.status.Speed *=1.3f;
        }else if ([theequipment isEqualToString:@"Y"]) {
            self.status.MaxHP *= 2;
            self.status.HP *= 2;
        }else if ([theequipment isEqualToString:@"R"]) {
            self.status.Attack *=2;
        }else if([theequipment isEqualToString:@"P"]) {
            self.status.Attack *=2;
        }else if([theequipment isEqualToString:@"G"]) {
            self.status.Speed *=2;
        }
    }
    return self;
}
-(void)update{
    self.positionx+=self.speedx;
    self.positiony+=self.speedy;
    self.position=ccp(self.positionx, self.positiony);
    if (self.speedx!=0 && self.speedy !=0) {
        self.direction=ccp(self.speedx, self.speedy);
    }
    self.rotation=atan2f(self.direction.x, self.direction.y)*180/3.14-90;
    CGSize winsize = [CCDirector sharedDirector].winSize;
    float x = max(0, self.positionx);
    self.positionx  = min(winsize.width, x);
    self.positiony = min(winsize.height, max(0, self.positiony));
    self.position = ccp(self.positionx, self.positiony);
}

-(void)attack1{
    Attack *a=[[NSClassFromString([PlayerDocument getattack1]) alloc] init];
    a.position=self.position;
    a.startp=self.position;
    a.damage= self.status.Attack;
    a.speedx=self.direction.x*2.5f;
    a.speedy=self.direction.y*2.5f;
    a.target=0;
    
    [self.parent addChild:a];
}

-(void)handleCollisionWith:(GameObject *)gameObject{
    if ([gameObject isKindOfClass:[Attack class]]) {
        Attack *attack=(Attack *)gameObject;
        self.status.HP-=attack.damage;
    }
}
@end
