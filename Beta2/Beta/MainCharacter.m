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
@implementation MainCharacter
-(id)init{
    if(self=[super init]){
        self.image=[CCSprite spriteWithFile:@"test.jpg"];
        self.status =[[Status alloc]init];
        self.status.MaxHP=100;
        self.status.HP=self.status.MaxHP;
        self.status.AttackSpeed=5;
        self.status.Attack=100;
        //fortest only
        [self.image runAction:[CCScaleTo actionWithDuration:0.1 scaleX:0.1 scaleY:0.1]];
//        CGSize sizeofimage=[self.image boundingBox].size;
         self.radius=10;
        [self addChild:self.image];
        
    }
    return self;
}
-(id)initwithimage:(NSString *)name{
    if(self=[super init]){
        self.image=[CCSprite spriteWithFile:name];
        self.status =[[Status alloc]init];
        self.status.MaxHP=100;
        self.status.HP=self.status.MaxHP;
        //fortest only
        [self.image runAction:[CCScaleTo actionWithDuration:0.1 scaleX:0.1 scaleY:0.1]];
        CGSize sizeofimage=[self.image boundingBox].size;
        self.radius=sizeofimage.height;
        [self addChild:self.image];
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
}
-(void)attack1{
    Attack *a=[[NSClassFromString([PlayerDocument getattack1]) alloc] init];
    a.position=self.position;
    a.startp=self.position;
    a.speedx=self.direction.x*self.status.AttackSpeed;
    a.speedy=self.direction.y*self.status.AttackSpeed;
    a.target=0;
    
    [self.parent addChild:a];
}
-(void)attack2{
    Attack *a=[[NSClassFromString([PlayerDocument getattack2]) alloc] init];
    a.position=self.position;
    a.startp=self.position;
    a.speedx=self.direction.x;
    a.speedy=self.direction.y;
    a.target=0;
    [self.parent addChild:a];
}
-(void)attack3{
    Attack *a=[[NSClassFromString([PlayerDocument getattack3]) alloc] init];
    a.position=self.position;
    a.startp=self.position;
    a.speedx=self.direction.x;
    a.speedy=self.direction.y;
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
