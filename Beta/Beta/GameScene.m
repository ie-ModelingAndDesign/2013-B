//
//  GameScene.m
//  Beta
//
//  Created by vilayouth vongsomxai on 2013/11/24.
//  Copyright (c) 2013年 vilayouth vongsomxai. All rights reserved.
//

#import "GameScene.h"

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
        self.attackboard=[CCSprite spriteWithFile:@"attackboard.png"];
        self.moveboard.position=ccp(50, 50);
        CGSize size=[CCDirector sharedDirector].winSize;
        self.attackboard.position=ccp(size.width-50, 50);
        [self addChild:self.moveboard];
        [self addChild:self.attackboard];
        
        self.character=[[MainCharacter alloc]init];
        [self addChild:self.character];
        
        self.isTouchEnabled = YES;
        [self schedule:@selector(nextFrame:)];
    }
	return self;
}

-(void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    for (UITouch *i in touches) {
        CGPoint location = [self convertTouchToNodeSpace: i];
        if (CGRectContainsPoint(self.moveboard.boundingBox,location) ) {
            float speed=5;
            float dx=location.x-self.moveboard.position.x;
            float dy=location.y-self.moveboard.position.y;
            float dr=dx*dx+dy*dy;
            dr=sqrtf(dr);
            self.character.speedx=dx/dr*speed;
            self.character.speedy=dy/dr*speed;
        }
    }
}
- (void)ccTouchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    for (UITouch *i in touches) {
        CGPoint location = [self convertTouchToNodeSpace: i];
        if (CGRectContainsPoint(self.moveboard.boundingBox,location) ) {
            float speed=5;
            float dx=location.x-self.moveboard.position.x;
            float dy=location.y-self.moveboard.position.y;
            float dr=dx*dx+dy*dy;
            dr=sqrtf(dr);
            self.character.speedx=dx/dr*speed;
            self.character.speedy=dy/dr*speed;
        }
    }
}
-(void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    self.character.speedx=0;
    self.character.speedy=0;
    
}
-(void)nextFrame:(float)dt{
    CCNode* child;
    CCARRAY_FOREACH(self.children, child)
    {
        // Check if the child is a game object
        if ([child isKindOfClass:[GameObject class]])
        {
            GameObject* gameObject = (GameObject*)child;
            
            // Update all game objects
            [gameObject update];
            
        }
    }
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
