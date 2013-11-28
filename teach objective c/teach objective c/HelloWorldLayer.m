//
//  HelloWorldLayer.m
//  teach objective c
//
//  Created by vilayouth vongsomxai on 2013/11/14.
//  Copyright vilayouth vongsomxai 2013年. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"

// Needed to obtain the Navigation Controller
#import "AppDelegate.h"
#import "test2.h"
#pragma mark - HelloWorldLayer

// HelloWorldLayer implementation
@implementation HelloWorldLayer

// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
+(CCScene *) scene
{
    // 'scene' is an autorelease object.
    CCScene *scene = [CCScene node];
    
    // 'layer' is an autorelease object.
    HelloWorldLayer *layer = [HelloWorldLayer node];
    
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
        self.back=[CCSprite spriteWithFile:@"back2.png"]; //これで、.hで宣言したimage1=画像名　って感じ！！
        self.start=[CCSprite spriteWithFile:@"start2.png"]; //これで、.hで宣言したimage1=画像名　って感じ！！
        self.monster=[CCSprite spriteWithFile:@"Monster2.png"];
        self.Score=[CCSprite spriteWithFile:@"Score2.png"];
        self.setup=[CCSprite spriteWithFile:@"Setup2.png"];
        self.Howto=[CCSprite spriteWithFile:@"Howto2.png"];
        
         CGSize size=[CCDirector sharedDirector].winSize; //画面のサイズを取得しているそうです
        
        self.back.position=ccp(size.width/2,size.height/2);
        self.start.position=ccp(225,140); //(横,縦)になってる。これはimage1の位置
        self.monster.position=ccp(50,50);
        self.Score.position=ccp(170,60);
        self.setup.position=ccp(300,60);
        self.Howto.position=ccp(430,50);
        
        [self addChild: self.back];
        [self addChild: self.start];
        [self addChild: self.monster];
        [self addChild: self.Score];
        [self addChild: self.setup];
        [self addChild: self.Howto];
        
        self.isTouchEnabled=YES; //この一行でタッチに対応出来ました。でも処理はまだ入れていません！
        [self schedule:@selector(update:)]; //この命令で更新機能ができるらしい。0.03秒ごとに更新！！みたいな
    }
    return self;
}


-(void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{ //タッチするとこれが実行されます
    UITouch *t = [touches anyObject];
    CGPoint p = [t locationInView:[t view]];
    //self.start.position = ccp(p.x, [CCDirector sharedDirector].winSize.height-p.y); //クリックして表示するときの座標！！
    [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[test2 scene] ]];
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