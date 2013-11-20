//
//  HelloWorldLayer.h
//  teach objective c
//
//  Created by vilayouth vongsomxai on 2013/11/14.
//  Copyright vilayouth vongsomxai 2013年. All rights reserved.
//


#import <GameKit/GameKit.h>

// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"


// HelloWorldLayer
@interface HelloWorldLayer : CCLayer <GKAchievementViewControllerDelegate, GKLeaderboardViewControllerDelegate>
{
}

@property(nonatomic,strong) CCSprite *image1,*image2;
//@property int number;
-(void) shownumber;

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;

@end
