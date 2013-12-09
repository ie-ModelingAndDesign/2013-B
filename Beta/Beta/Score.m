//
//  Score.m
//  Beta
//
//  Created by Shiho OMINE on 2013/12/05.
//  Copyright (c) 2013年 vilayouth vongsomxai. All rights reserved.
//

#import "Score.h"
#import "MainMenu.h"

@implementation Score
{
    unsigned int _new;
    unsigned int _third;
    unsigned int _second;
    unsigned int _highScore;
    CCLabelTTF* _newLabel;
    CCLabelTTF* _thirdLabel;
    CCLabelTTF* _secondLabel;
    CCLabelTTF* _highScoreLabel;
}

+ (Score*)sharedInfo
{
    static Score* sharedInstance = nil;
    if (sharedInstance == nil) {
        sharedInstance = [[self alloc] init];
    }
    return sharedInstance;
}

+(CCScene *) scene
{
    // 'scene' is an autorelease object.
    CCScene *scene = [CCScene node];
    
    // 'layer' is an autorelease object.
    Score *layer = [Score node];
    
    // add layer as a child to scene
    [scene addChild: layer];
    
    // return the scene
    return scene;
}

- (id)init
{
    if( (self=[super init]) ) {
        self.scoreback=[CCSprite spriteWithFile:@"scoreback.png"];
        self.no1=[CCSprite spriteWithFile:@"1.png"];
        self.no2=[CCSprite spriteWithFile:@"2.png"];
        self.no3=[CCSprite spriteWithFile:@"3.png"];
        self.scoreRe=[CCSprite spriteWithFile:@"scoreRe.png"];
        self.scoreubar=[CCSprite spriteWithFile:@"scoreubar.png"];
        
        CGSize size=[CCDirector sharedDirector].winSize;
        
        self.scoreback.position=ccp(size.width/2,size.height/2);
        self.no1.position=ccp(size.width/6-15,size.height - 50); //(横,縦)になってる。これはimage1の位置
        self.no2.position=ccp(85,size.height/2);
        self.no3.position=ccp(95,75);
        self.scoreRe.position=ccp(426,53);
        self.scoreubar.position=ccp(size.width/2-15,size.height/2);
        
        [self addChild: self.scoreback];
        [self addChild: self.no1];
        [self addChild: self.no2];
        [self addChild: self.no3];
        [self addChild: self.scoreRe];
        [self addChild: self.scoreubar];
        
        self.isTouchEnabled=YES; //この一行でタッチに対応出来ました。でも処理はまだ入れていません！
        [self schedule:@selector(update:)]; //この命令で更新機能ができるらしい。0.03秒ごとに更新！！みたいな

        
        _new = 0; //newの初期値
        _third = 0; //thirdの初期値
        _second = 0; //scoreの初期値
        _highScore = 0; //highscoreの初期値
        NSString* thirdString = [NSString stringWithFormat:@"%d", _third];
        NSString* secondString = [NSString stringWithFormat:@"%d", _second];
        NSString* highScoreString = [NSString stringWithFormat:@"%d", _highScore];
        _thirdLabel = [CCLabelTTF labelWithString:thirdString fontName:@"arial" fontSize:45];
        _secondLabel = [CCLabelTTF labelWithString:secondString fontName:@"arial" fontSize:50];
        _highScoreLabel = [CCLabelTTF labelWithString:highScoreString fontName:@"arial" fontSize:60];
        [self addChild:_thirdLabel];
        [self addChild:_secondLabel];
        [self addChild:_highScoreLabel];
        _thirdLabel.anchorPoint = ccp(1.0, 1.0); //anchorPointは0.0 〜 1.0で指定!!
        _secondLabel.anchorPoint = ccp(1.0, 1.0);
        _highScoreLabel.anchorPoint = ccp(1.0, 1.0);
        CGPoint thirdOffset = ccp(-10, -10);
        CGPoint secondOffset = ccp(-10, -10);
        CGPoint highScoreOffset = ccp(10, -10);
        CGSize winSize = [CCDirector sharedDirector].winSize;
        CGPoint bottom = ccp(winSize.width/2+100, winSize.height/4+20);
        CGPoint center = ccp(winSize.width/2+110, winSize.height/2+30);
        CGPoint top = ccp(winSize.width/2+105, winSize.height-15);
        _thirdLabel.position = ccpAdd(bottom, thirdOffset);
        _secondLabel.position = ccpAdd(center, secondOffset);
        _highScoreLabel.position = ccpAdd(top, highScoreOffset);
        
        [[SimpleAudioEngine sharedEngine]playBackgroundMusic:@"score.mp3" loop:YES];
    }
    return self;
}

-(void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{ //タッチするとこれが実行されます
    for (UITouch *i in touches) {
        CGPoint location=[self convertTouchToNodeSpace:i];
        if (CGRectContainsPoint(self.scoreRe.boundingBox, location)) {
            [[SimpleAudioEngine sharedEngine]playEffect:@"button.mp3"];
            [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[MainMenu scene] ]];
        }
    }
}

- (void)setScore:(unsigned int)score
{
    _new = score;
    if (_new > _highScore) {
        _highScore = _new;
        [_highScoreLabel setString:[NSString stringWithFormat:@"%d", _highScore]];
    }else if(_new > _second){
        _second = _new;
        [_secondLabel setString:[NSString stringWithFormat:@"%d", _second]];
    }else if(_new > _third){
        _third = _new;
        [_thirdLabel setString:[NSString stringWithFormat:@"%d", _third]];
    }
}

@end
