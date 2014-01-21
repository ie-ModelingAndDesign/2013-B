//
//  GameScene.h
//  Beta
//
//  Created by vilayouth vongsomxai on 2013/11/24.
//  Copyright (c) 2013年 vilayouth vongsomxai. All rights reserved.
//

#import "GameObject.h"
#import "cocos2d.h"
#import "MainCharacter.h"
#import "Monster1.h"

@interface GameScene : CCLayer
@property (nonatomic,strong) MainCharacter *character;

//@property(nonatomic, strong) Monster *Monster;
@property float periodofmonster;//period of monsters appear in the same wave
@property int maxmonsterinwave;//max of monster for this wave
@property int levelmonsters;//type of monsters that appear
@property int levelmaxmonster;
@property int sentmonster;
@property int killmonster;
@property float monstercounter;

@property int score;

@property (nonatomic,strong) CCSprite *HPShower;
//controller
@property(nonatomic, strong) CCSprite *moveboard;
@property(nonatomic, strong) CCSprite *attackboard1,*attackboard2,*attackboard3;
@property(nonatomic,strong) NSArray *monsterlist;
+(CCScene *) scene;
@end
