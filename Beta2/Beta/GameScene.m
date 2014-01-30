//
//  GameScene.m
//  Beta
//
//  Created by vilayouth vongsomxai on 2013/11/24.
//  Copyright (c) 2013年 vilayouth vongsomxai. All rights reserved.
//

#import "GameScene.h"
#import "Monster1.h"
#import "Attack.h"
#import "Score.h"
#import "settingDoc.h"
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
        CCSprite *backGround = [CCSprite spriteWithFile:@"BG.jpg"];
        backGround.anchorPoint = ccp(0, 0);
        [self addChild:backGround];
        
		self.moveboard=[CCSprite spriteWithFile:@"moveboard.png"];
        self.attackboard1=[CCSprite spriteWithFile:@"attackboard.png"];
        self.moveboard.opacity = 100;
        self.attackboard1.opacity = 100;
        self.moveboard.zOrder=1000;
        self.attackboard1.zOrder=1000;
        self.moveboard.position=ccp(70, 70);
        self.moveboard.scale = 2;
        CGSize size=[CCDirector sharedDirector].winSize;
        self.attackboard1.position=ccp(size.width-70, 70);
        self.attackboard1.scale   = 2;
        [self addChild:self.moveboard];
        [self addChild:self.attackboard1];
        
        self.character=[[MainCharacter alloc]init];
        self.character.position=ccp(size.width/2, size.height/2);
        self.character.positionx=self.character.position.x;
        self.character.positiony=self.character.position.y;
        [self addChild:self.character];
        
        CCLabelTTF *HPLabel=[[CCLabelTTF alloc] initWithString:@"HP" fontName:@"CourierNewPS-BoldItalicMT" fontSize:20];
        HPLabel.position=ccp(30,size.height- 30);
        self.HPShower=[CCSprite spriteWithFile:@"hp.png"];
        [self.HPShower setAnchorPoint:ccp(0, 0.5)];
        self.HPShower.position=ccp(50, size.height-30);
        [self addChild:self.HPShower];
        [self addChild:HPLabel];
        self.isTouchEnabled = YES;
        [self schedule:@selector(nextFrame:)];
        
        
    
//        CGSize size=[CCDirector sharedDirector].winSize;
        
        self.periodofmonster=2;
        self.monstercounter=0;
        self.levelmaxmonster=6;
        self.levelmonsters=1;
        self.maxmonsterinwave=1;
        self.sentmonster=0;
        self.killmonster=0;
        NSString *d=[[NSBundle mainBundle] pathForResource:@"PlayerDataBase" ofType:@"plist"];
        self.monsterlist=[NSArray arrayWithContentsOfFile:d];
        
        
        self.score=0;
        NSString * text = [NSString stringWithFormat:@"Score : %d",self.score];
        self.scoreShower = [CCLabelTTF labelWithString:text fontName:@"arial" fontSize:25];
        self.scoreShower.anchorPoint = ccp(0, 0.5f);
        self.scoreShower.position = ccp(size.width/2, size.height-30);
        [self addChild:self.scoreShower];
    }
    if([settingDoc share].isBGM)
    [[SimpleAudioEngine sharedEngine]playBackgroundMusic:@"gameBGM.mp3" loop:YES];
    
	return self;
}

-(void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    for (UITouch *i in touches) {
        CGPoint location = [self convertTouchToNodeSpace: i];
        if (CGRectContainsPoint(self.moveboard.boundingBox,location) ) {
            float dx=location.x-self.moveboard.position.x;
            float dy=location.y-self.moveboard.position.y;
            float dr=dx*dx+dy*dy;
            dr=sqrtf(dr);
            if (dr!=0) {
                self.character.speedx=dx/dr*self.character.status.Speed;
                self.character.speedy=dy/dr*self.character.status.Speed;
            }

        }
    }
}
- (void)ccTouchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    for (UITouch *i in touches) {
        CGPoint location = [self convertTouchToNodeSpace: i];
        if (CGRectContainsPoint(self.moveboard.boundingBox,location) ) {
            float dx=location.x-self.moveboard.position.x;
            float dy=location.y-self.moveboard.position.y;
            float dr=dx*dx+dy*dy;
            dr=sqrtf(dr);
            if (dr!=0) {
                self.character.speedx=dx/dr*self.character.status.Speed;
                self.character.speedy=dy/dr*self.character.status.Speed;
            }
        }
    }
}
-(void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    for (UITouch *i in touches) {
        CGPoint location = [self convertTouchToNodeSpace: i];
        if (CGRectContainsPoint(self.attackboard1.boundingBox,location) ) {
            [self.character attack1];
        } else {            
            self.character.speedx=0;
            self.character.speedy=0;
        }
    }
}
-(void)nextFrame:(float)dt{
    self.monstercounter+=dt;
    if (self.monstercounter>self.periodofmonster) {
        self.monstercounter=0;
        
        if (self.sentmonster<=self.maxmonsterinwave) {
           self.sentmonster++;
            [self createmonster];
        }
    }
    CCNode* child;
    NSMutableArray *enemy=[NSMutableArray array];
    CCARRAY_FOREACH(self.children, child)
    {
        // Check if the child is a game object
        @try{
        if ([child isKindOfClass:[GameObject class]])
        {
            GameObject* gameObject = (GameObject*)child;
            [gameObject update];
            if ([gameObject isKindOfClass:[Monster1 class]]) {
                Monster1 *m=(Monster1 *)gameObject;
                m.target=self.character.position;
                [enemy addObject:m];
            }
            if ([gameObject isKindOfClass:[Attack class]]) {
                Attack* attack=(Attack*)gameObject;
                // printf("attack target%d \n",attack.target);
                if (attack.target==0) {
                    //CCNode *attacked;
                    for (Monster1* m in enemy) {
                        if (ccpDistance(attack.position, m.position)<attack.radius+m.radius) {
                            [m handleCollisionWith:attack];
                            [attack handleCollisionWith:m];
                            NSLog(@"%f",m.radius);
                        }
                    }
                }else if (attack.target ==1){
                    if (ccpDistance(attack.position, self.character.position)<attack.radius+self.character.radius) {
                        [self.character handleCollisionWith:attack];
                        [attack handleCollisionWith:self.character];
                    }
                }
            
            }
            
        }
        }@catch (NSException *exception) {
            NSLog(@"[ERROR]\nstr[%@]\nexception[%@]", [child description], exception);
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
                if ([gameObject isKindOfClass:[Monster1 class]]) {
                    Monster1 *m=(Monster1 *)gameObject;
                    self.score+=m.status.MaxHP;
                }
                [gameObjectsToRemove addObject:gameObject];
            }
        }
    }
    
    for (GameObject* gameObject in gameObjectsToRemove)
    {
        if ([gameObject isKindOfClass:[Monster1 class]]) {
            Monster1 *m=(Monster1 *)gameObject;
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
        if (self.levelmonsters< self.levelmaxmonster) {
            self.levelmonsters++;
        }
    }
    //update character hp
    self.HPShower.scaleX=(float)(self.character.status.HP/self.character.status.MaxHP);
    //isgameove
    if (self.character.status.HP<=0) {
        [self GameOver];
    }
    NSString * text = [NSString stringWithFormat:@"Score : %d",self.score];
    [self.scoreShower setString:text];
  //  NSLog(@"%f",self.HPShower);
}
-(void)GameOver{
    [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[Score scenewithscore:self.score] ]];
}
-(void)createmonster{
   // CGSize size=[CCDirector sharedDirector].winSize;
    int level = (arc4random() % self.levelmonsters) + 1;
    NSString *classname = [NSString stringWithFormat:@"Monster%d",level];
//    NSLog(classname);
    GameObject *m=[[NSClassFromString(classname) alloc]init];
   // m.position=ccp(size.width, size.height);
    [self addChild:m];
}

-(void)onExitTransitionDidStart{
    [self removeAllChildren];
    [CCAnimationCache purgeSharedAnimationCache];
    [[CCTextureCache sharedTextureCache] removeAllTextures];
    [super cleanup];
    [super onExit];
}
@end
