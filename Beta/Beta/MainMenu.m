//
//  MainMenu.m
//  Beta
//
//  Created by Shiho OMINE on 2013/11/29.
//  Copyright (c) 2013年 vilayouth vongsomxai. All rights reserved.
//



#import "AppDelegate.h"
#import "MainMenu.h"
#import "GameScene.h"
#import "CharacterDoc.h"
#import "GameObject.h"
#import "MainCharacter.h"
#import "Score.h"
#import "setting.h"

@implementation MainMenu

+(CCScene *) scene
{
    // 'scene' is an autorelease object.
    CCScene *scene = [CCScene node];
    
    // 'layer' is an autorelease object.
    MainMenu *layer = [MainMenu node];
    
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
        self.back=[CCSprite spriteWithFile:@"back.png"]; //これで、.hで宣言したimage1=画像名　って感じ！！
        self.ready=[CCSprite spriteWithFile:@"ready.png"]; //これで、.hで宣言したimage1=画像名　って感じ！！
        //self.monster=[CCSprite spriteWithFile:@"Monster.png"];
        self.Score=[CCSprite spriteWithFile:@"Score.png"];
        self.setting=[CCSprite spriteWithFile:@"Setting.png"];
        //self.Howto=[CCSprite spriteWithFile:@"Howto.png"];
        
        CGSize size=[CCDirector sharedDirector].winSize; //画面のサイズを取得しているそうです
        
        self.back.position=ccp(size.width/2,size.height/2);
        self.ready.position=ccp(size.width/2-10,size.height/2-30); //(横,縦)になってる。これはimage1の位置
        //self.monster.position=ccp(50,50);
        self.Score.position=ccp(size.width/2-75,size.height/2-100);
        self.setting.position=ccp(size.width/2+55,size.height/2-100);
        //self.Howto.position=ccp(430,50);
        
        [self addChild: self.back];
        [self addChild: self.ready];
        //[self addChild: self.monster];
        [self addChild: self.Score];
        [self addChild: self.setting];
        //[self addChild: self.Howto];
        
        self.isTouchEnabled=YES; //この一行でタッチに対応出来ました。でも処理はまだ入れていません！
        [self schedule:@selector(update:)]; //この命令で更新機能ができるらしい。0.03秒ごとに更新！！みたいな
    }
    
    
    
    [[SimpleAudioEngine sharedEngine]playBackgroundMusic:@"BGMop.mp3" loop:YES];
    
    return self;
}

-(void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{ //タッチするとこれが実行されます
    for (UITouch *i in touches) {
        CGPoint location=[self convertTouchToNodeSpace:i];
        if (CGRectContainsPoint(self.ready.boundingBox, location)) {
            [[SimpleAudioEngine sharedEngine]playEffect:@"button.mp3"];
            [[SimpleAudioEngine sharedEngine]stopBackgroundMusic];
            [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[GameScene scene] ]];
        }
        
        if (CGRectContainsPoint(self.monster.boundingBox, location)) {
            [[SimpleAudioEngine sharedEngine]playEffect:@"button.mp3"];
            printf("monster");
        }
        
        
        if (CGRectContainsPoint(self.Score.boundingBox, location)) {
            [[SimpleAudioEngine sharedEngine]playEffect:@"button.mp3"];
            [[SimpleAudioEngine sharedEngine]stopBackgroundMusic];
            [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[Score scene] ]];
        }
        
        
        if (CGRectContainsPoint(self.setting.boundingBox, location)) {
            [[SimpleAudioEngine sharedEngine]playEffect:@"button.mp3"];
            [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[setting scene] ]];
        }
        
        
        if (CGRectContainsPoint(self.Howto.boundingBox, location)) {
            [[SimpleAudioEngine sharedEngine]playEffect:@"button.mp3"];
            printf("Howto");
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

#pragma mark GameKit delegate

-(void) achievementViewControllerDidFinish:(GKAchievementViewController *)viewController
{
    AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
    [[app navController] dismissModalViewControllerAnimated:YES];
}

-(void) leaderboardViewControllerDidFinish:(GKLeaderboardViewController *)viewController
{
    AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
    [[app navController] dismissModalViewControllerAnimated:YES];
}
@end
