//
//  setting.h
//  Beta
//
//  Created by Shiho OMINE on 2013/12/10.
//  Copyright (c) 2013年 vilayouth vongsomxai. All rights reserved.
//

#import "CCLayer.h"

#import <GameKit/GameKit.h>

#import <UIKit/UIKit.h>

#import "cocos2d.h"

#import "SimpleAudioEngine.h"

@interface setting : CCLayer

@property(nonatomic,strong) CCSprite *back,*BGMon,*BGMoff,*SEon,*SEoff,*scoreRe;

@property BOOL isBGM,isEffectSund;
+(CCScene *) scene;
+(setting *) shared;
@end
