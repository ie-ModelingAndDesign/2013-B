

#import "MainMenu.h"
#import "HelloWorldLayer.h"
#import "AppDelegate.h"
#import "test2.h"

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
        self.back=[CCSprite spriteWithFile:@"back2.png"]; //これで、.hで宣言したimage1=画像名　って感じ！！
        self.ready=[CCSprite spriteWithFile:@"ready.png"]; //これで、.hで宣言したimage1=画像名　って感じ！！
        self.monster=[CCSprite spriteWithFile:@"Monster2.png"];
        self.Score=[CCSprite spriteWithFile:@"Score2.png"];
        self.setting=[CCSprite spriteWithFile:@"Setting.png"];
        self.Howto=[CCSprite spriteWithFile:@"Howto2.png"];
        
        CGSize size=[CCDirector sharedDirector].winSize; //画面のサイズを取得しているそうです
        
        self.back.position=ccp(size.width/2,size.height/2);
        self.ready.position=ccp(225,140); //(横,縦)になってる。これはimage1の位置
        self.monster.position=ccp(50,50);
        self.Score.position=ccp(170,60);
        self.setting.position=ccp(300,60);
        self.Howto.position=ccp(430,50);
        
        [self addChild: self.back];
        [self addChild: self.ready];
        [self addChild: self.monster];
        [self addChild: self.Score];
        [self addChild: self.setting];
        [self addChild: self.Howto];
        
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
            [[SimpleAudioEngine sharedEngine]stopBackgroundMusic];
            [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[test2 scene] ]];
        }

        if (CGRectContainsPoint(self.monster.boundingBox, location)) {
            printf("monster");
        }
    
        
        if (CGRectContainsPoint(self.Score.boundingBox, location)) {
            printf("Score");
        }
     
        
        if (CGRectContainsPoint(self.setting.boundingBox, location)) {
            printf("setting");
        }
     
        
        if (CGRectContainsPoint(self.Howto.boundingBox, location)) {
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