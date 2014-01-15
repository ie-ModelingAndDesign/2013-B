//
//  CharacterSetting.h
//  Beta
//
//  Created by Shiho OMINE on 2013/12/15.
//  Copyright (c) 2013年 vilayouth vongsomxai. All rights reserved.
//

#import "CCLayer.h"

#import <GameKit/GameKit.h>

#import <UIKit/UIKit.h>

#import "cocos2d.h"

#import "SimpleAudioEngine.h"

@interface CharacterSetting : CCLayer

@property(nonatomic,strong) CCSprite *go,*back,*main1bs,*main1b,*main1g,*main1r,*main1y,*main2bs,*main2b,*main2g,*main2p,*main2y,*main3bs,*main3b,*main3g,*main3r,*main3y,*Return,*status;
@property (nonatomic,strong) CCSprite *selectedCharacter,*selectbutton1,*selectbutton2,*selectbutton3,*selectbutton4;

@property(nonatomic,assign)int machineNumber;

+(CCScene *) scene;

@end
