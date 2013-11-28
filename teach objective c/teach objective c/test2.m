//
//  test2.m
//  teach objective c
//
//  Created by Shiho OMINE on 2013/11/24.
//  Copyright (c) 2013年 vilayouth vongsomxai. All rights reserved.
//

#import "test2.h"
#import "MainMenu.h"
@implementation test2

+(CCScene *) scene
{
    // 'scene' is an autorelease object.
    CCScene *scene = [CCScene node];
    
    // 'layer' is an autorelease object.
    test2 *layer = [test2 node];
    
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
        self.image1=[CCSprite spriteWithFile:@"neko.jpg"]; //これで、.hで宣言したimage1=画像名　って感じ！！
        
        CGSize size=[CCDirector sharedDirector].winSize; //画面のサイズを取得しているそうです
        
        self.image1.position=ccp(size.width/2,size.height/2);
        
        [self addChild: self.image1];
        
        self.isTouchEnabled=YES; //この一行でタッチに対応出来ました。でも処理はまだ入れていません！
        [self schedule:@selector(update:)]; //この命令で更新機能ができるらしい。0.03秒ごとに更新！！みたいな
    }
    return self;
}

@end
