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


@interface GameScene : CCLayer
@property (nonatomic,strong) MainCharacter *character;

//controller
@property(nonatomic, strong) CCSprite *moveboard;
@property(nonatomic, strong) CCSprite *attackboard;
+(CCScene *) scene;
@end
