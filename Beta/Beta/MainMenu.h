//
//  MainMenuViewController.h
//  teach objective c
//
//  Created by Shiho OMINE on 2013/11/24.
//  Copyright (c) 2013年 vilayouth vongsomxai. All rights reserved.
//

#import <GameKit/GameKit.h>

#import <UIKit/UIKit.h>

#import "cocos2d.h"

#import "SimpleAudioEngine.h"

@interface MainMenu : CCLayer <GKAchievementViewControllerDelegate, GKLeaderboardViewControllerDelegate>


@property(nonatomic,strong) CCSprite *back,*ready,*monster,*Score,*setting,*Howto;

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;

@end
