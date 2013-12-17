//
//  GameScene.m
//  Beta
//
//  Created by vilayouth vongsomxai on 2013/11/24.
//  Copyright (c) 2013年 vilayouth vongsomxai. All rights reserved.
//

#import "GameScene.h"
#import "Monster.h"
#import "Attack.h"
@implementation GameScene
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	GameScene *layer = [GameScene node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super's" return value
	if( (self=[super init]) ) {
		self.moveboard=[CCSprite spriteWithFile:@"moveboard.png"];
        self.attackboard1=[CCSprite spriteWithFile:@"attackboard.png"];
        self.attackboard2=[CCSprite spriteWithFile:@"attackboard.png"];
        self.attackboard3=[CCSprite spriteWithFile:@"attackboard.png"];
        self.moveboard.position=ccp(50, 50);
        CGSize size=[CCDirector sharedDirector].winSize;
        self.attackboard1.position=ccp(size.width-140, 50);
        self.attackboard2.position=ccp(size.width-100, 50);
        self.attackboard3.position=ccp(size.width-60, 50);
        [self addChild:self.moveboard];
        [self addChild:self.attackboard1];
        [self addChild:self.attackboard2];
        [self addChild:self.attackboard3];
        
        self.character=[[MainCharacter alloc]init];
        self.character.position=ccp(size.width/2, size.height/2);
        self.character.positionx=self.character.position.x;
        self.character.positiony=self.character.position.y;
        [self addChild:self.character];
        
        self.HPShower=[CCSprite spriteWithFile:@"hp.png"];
        [self.HPShower setAnchorPoint:ccp(0, 0.5)];
        self.HPShower.position=ccp(20, size.height-30);
        
        [self addChild:self.HPShower];
        
        self.isTouchEnabled = YES;
        [self schedule:@selector(nextFrame:)];

//        CGSize size=[CCDirector sharedDirector].winSize;
        
        self.periodofmonster=2;
        self.monstercounter=0;
        self.levelmaxmonster=1;
        self.levelmonsters=1;
        self.maxmonsterinwave=1;
        self.sentmonster=0;
        self.killmonster=0;
    }
	return self;
}

-(void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    for (UITouch *i in touches) {
        CGPoint location = [self convertTouchToNodeSpace: i];
        if (CGRectContainsPoint(self.moveboard.boundingBox,location) ) {
            float speed=1;
            float dx=location.x-self.moveboard.position.x;
            float dy=location.y-self.moveboard.position.y;
            float dr=dx*dx+dy*dy;
            dr=sqrtf(dr);
            if (dr!=0) {
                self.character.speedx=dx/dr*speed;
                self.character.speedy=dy/dr*speed;
            }
        }
    }
}
- (void)ccTouchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    for (UITouch *i in touches) {
        CGPoint location = [self convertTouchToNodeSpace: i];
        if (CGRectContainsPoint(self.moveboard.boundingBox,location) ) {
            float speed=1;
            float dx=location.x-self.moveboard.position.x;
            float dy=location.y-self.moveboard.position.y;
            float dr=dx*dx+dy*dy;
            dr=sqrtf(dr);
            if (dr!=0) {
                self.character.speedx=dx/dr*speed;
                self.character.speedy=dy/dr*speed;
            }
        }
    }
}
-(void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    for (UITouch *i in touches) {
        CGPoint location = [self convertTouchToNodeSpace: i];
        if (CGRectContainsPoint(self.attackboard1.boundingBox,location) ) {
            [self.character attack1];
        }else if (CGRectContainsPoint(self.attackboard2.boundingBox,location) ) {
            [self.character attack2];
        }else if (CGRectContainsPoint(self.attackboard3.boundingBox,location) ) {
            [self.character attack3];
        }
    }
    self.character.speedx=0;
    self.character.speedy=0;
}
-(void)nextFrame:(float)dt{
    self.monstercounter+=dt;
    //NSLog(@"%f",self.monstercounter);
    if (self.monstercounter>self.periodofmonster) {
        self.monstercounter=0;
        
        if (self.sentmonster<=self.maxmonsterinwave) {
           self.sentmonster++;
        [self createmonster];
            NSLog(@"here");
        }
    }
    CCNode* child;
    NSMutableArray *enemy=[NSMutableArray array];
    CCARRAY_FOREACH(self.children, child)
    {
        // Check if the child is a game object
        if ([child isKindOfClass:[GameObject class]])
        {
            GameObject* gameObject = (GameObject*)child;
            
            // Update all game objects
            //NSLog([gameObject description]);
            [gameObject update];
            if ([gameObject isKindOfClass:[Monster class]]) {
                Monster *m=(Monster *)gameObject;
                m.target=self.character.position;
                [enemy addObject:m];
            }
            if ([gameObject isKindOfClass:[Attack class]]) {
                Attack* attack=(Attack*)gameObject;
                // printf("attack target%d \n",attack.target);
                if (attack.target==0) {
                    //CCNode *attacked;
                    for (Monster* m in enemy) {
                        if (ccpDistance(attack.position, m.position)<attack.radius+m.radius) {
                            [m handleCollisionWith:attack];
                            [attack handleCollisionWith:m];
                        }
                    }
                }else if (attack.target ==1){
                    if (ccpDistance(attack.position, self.character.position)<attack.radius+self.character.radius) {
                        [MainCharacter handleCollisionWith:attack];
                        [attack handleCollisionWith:self.character];
                    }
                }
            
            }
            
        }
    }
    NSMutableArray* gameObjectsToRemove = [NSMutableArray array];
    CCARRAY_FOREACH(self.children, child)
    {
        if ([child isKindOfClass:[GameObject class]])
        {
            GameObject* gameObject = (GameObject*)child;
            
            if (gameObject.isScheduledForRemove)
            {
                [gameObjectsToRemove addObject:gameObject];
            }
        }
    }
    
    for (GameObject* gameObject in gameObjectsToRemove)
    {
        if ([gameObject isKindOfClass:[Monster class]]) {
            Monster *m=(Monster *)gameObject;
            [enemy removeObject:m];
            self.killmonster++;
        }
        [[CCTextureCache sharedTextureCache] removeUnusedTextures];
        [self removeChild:gameObject cleanup:YES];
        
    }
    [gameObjectsToRemove removeAllObjects];
    
    if (self.killmonster>=self.maxmonsterinwave) {
        self.maxmonsterinwave+=self.maxmonsterinwave*1.5;
        self.sentmonster=0;
        self.killmonster=0;
        if (self.levelmonsters< self.maxmonsterinwave) {
            self.levelmonsters++;
        }
    }
}

-(void)createmonster{
    CGSize size=[CCDirector sharedDirector].winSize;
    Monster *m=[[Monster alloc]init];
    m.position=ccp(size.width, size.height);
    [self addChild:m];
}
// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}


@end
