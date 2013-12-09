//
//  Score.h
//  Beta
//
//  Created by Shiho OMINE on 2013/12/05.
//  Copyright (c) 2013年 vilayouth vongsomxai. All rights reserved.
//

#import "CCLayer.h"

#import <GameKit/GameKit.h>

#import <UIKit/UIKit.h>

#import "cocos2d.h"

#import "SimpleAudioEngine.h"


@interface Score : CCLayer

@property(nonatomic,strong) CCSprite *scoreback,*no1,*no2,*no3,*scoreRe,*scoreubar;

+(CCScene *) scene;

@end
