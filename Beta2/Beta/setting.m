//
//  setting.m
//  Beta
//
//  Created by Shiho OMINE on 2013/12/10.
//  Copyright (c) 2013年 vilayouth vongsomxai. All rights reserved.
//

#import "setting.h"
#import "MainMenu.h"

@implementation setting


+(CCScene *) scene
{
    // 'scene' is an autorelease object.
    CCScene *scene = [CCScene node];
    
    // 'layer' is an autorelease object.
    setting *layer = [setting node];
    
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
        self.back=[CCSprite spriteWithFile:@"settingback.png"]; //これで、.hで宣言したimage1=画像名　って感じ！！
        self.BGMon=[CCSprite spriteWithFile:@"BGMon.png"]; //これで、.hで宣言したimage1=画像名　って感じ！！
        //self.BGMoff=[CCSprite spriteWithFile:@"BGMoff.png"];
        self.SEon=[CCSprite spriteWithFile:@"SEon.png"];
        //self.SEoff=[CCSprite spriteWithFile:@"SEoff.png"];
        self.scoreRe=[CCSprite spriteWithFile:@"scoreRe.png"];
        
        CGSize size=[CCDirector sharedDirector].winSize; //画面のサイズを取得しているそうです
        
        self.back.position=ccp(size.width/2,size.height/2);
        self.BGMon.position=ccp(size.width/3-30,size.height/3+20); //(横,縦)になってる。これはimage1の位置
        //self.BGMoff.position=ccp(size.width/3,size.height/2-100);
        self.SEon.position=ccp(size.width-size.width/3+30,size.height/3+20);
        //self.SEoff.position=ccp(size.width/3,size.height/2-100);
        self.scoreRe.position=ccp(size.width/2,size.height-size.height/7);
        
        [self addChild: self.back];
        [self addChild: self.BGMon];
        //[self addChild: self.BGMoff];
        [self addChild: self.SEon];
        //[self addChild: self.SEoff];
        [self addChild: self.scoreRe];
        
        self.isTouchEnabled=YES; //この一行でタッチに対応出来ました。でも処理はまだ入れていません！
        [self schedule:@selector(update:)]; //この命令で更新機能ができるらしい。0.03秒ごとに更新！！みたいな
    }
    
    //[[SimpleAudioEngine sharedEngine]playBackgroundMusic:@"BGMop.mp3" loop:YES];
    
    return self;
}

-(void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{ //タッチするとこれが実行されます
    for (UITouch *i in touches) {
        CGPoint location=[self convertTouchToNodeSpace:i];
        if (CGRectContainsPoint(self.scoreRe.boundingBox, location)) {
            [[SimpleAudioEngine sharedEngine]playEffect:@"button.caf"];
            [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[MainMenu scene] ]];
        }
    }
}


@end
