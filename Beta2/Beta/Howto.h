//
//  Howto.h
//  Beta
//
//  Created by Yuuto ARAKAWA on 2013/12/12.
//  Copyright (c) 2013年 vilayouth vongsomxai. All rights reserved.
//

#import "CCLayer.h"

#import <GameKit/GameKit.h>

#import <UIKit/UIKit.h>

#import "cocos2d.h"

#import "SimpleAudioEngine.h"

@interface Howto : CCLayer

@property(nonatomic,strong) CCSprite *imageHow,*imageback,*imageMonster,*imageHowtoplay;

+(CCScene *) scene;


@end
