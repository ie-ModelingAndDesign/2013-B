//
//  Attack.m
//  Beta
//
//  Created by vilayouth vongsomxai on 2013/12/01.
//  Copyright (c) 2013年 vilayouth vongsomxai. All rights reserved.
//

#import "Attack.h"

@implementation Attack
-(id)init{
    if (self=[super init]) {
        self.speedx=10;
        self.speedy=0;
        CGSize s=[CCDirector sharedDirector].winSize;
        self.position=ccp(s.width/2, s.height/2);
        self.startp=self.position;
      //  self.image=[[CCSprite alloc] initWithFile:@"fire.gif"];
        self.image=[CCSprite spriteWithFile:@"fire.gif"];
        [self addChild:self.image];
        CGSize sizeofimage=[self.image boundingBox].size;
        //self.radius=sqrt(sizeofimage.height*sizeofimage.height+sizeofimage.width*sizeofimage.width);
        self.radius=10;
        self.lifetime=2;
    }
    return self;
}
-(void)update{
    self.lifetime-=0.03;
    self.position=ccp(self.position.x+self.speedx,self.position.y+self.speedy);
    if (self.lifetime<0) {
        self.isScheduledForRemove=YES;
    }
}
-(void)handleCollisionWith:(GameObject *)gameObject{
    self.isScheduledForRemove=YES;
}
@end
