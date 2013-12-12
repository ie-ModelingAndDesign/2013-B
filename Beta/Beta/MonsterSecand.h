//
//  MonsterSecand.h
//  Beta
//
//  Created by Yuuto ARAKAWA on 2013/12/10.
//  Copyright (c) 2013年 vilayouth vongsomxai. All rights reserved.
//

#import "GameObject.h"

@interface MonsterSecand : GameObject

@property (nonatomic ,strong) CCSprite *imageM;
@property CGPoint target;
@property double positionx,positiony;
@property double speedx,speedy;

@end
