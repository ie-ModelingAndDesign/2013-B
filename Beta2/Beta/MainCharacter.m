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
  
        self.status =[[Status alloc]init];
        self.status.MaxHP=100;
        self.status.HP=self.status.MaxHP;
        self.status.AttackSpeed=5;
        self.status.Attack=100;
        //fortest only
        self.speedx =0;
        self.speedy =0;
        self.direction = ccp(0, 1);
//        CGSize sizeofimage=[self.image boundingBox].size;
         self.radius=10;
        
        self.weapon = noraml;
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
    self.positionx  = min(winsize.width, self.positionx);
    self.positiony = min(winsize.height, max(0, self.positiony));
    self.position = ccp(self.positionx, self.positiony);
}

-(void)attack1{
    Attack *a=[[NSClassFromString([PlayerDocument getattack1]) alloc] init];
    a.position=self.position;
    a.startp=self.position;
    a.damage= self.status.Attack;
    a.speedx=self.direction.x*self.status.AttackSpeed;
    a.speedy=self.direction.y*self.status.AttackSpeed;
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
