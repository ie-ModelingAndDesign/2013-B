//
//  Monster.h
//  Beta
//
//  Created by Yuuto ARAKAWA on 2013/12/05.
//  Copyright (c) 2013年 vilayouth vongsomxai. All rights reserved.
//

#import "GameObject.h"

@interface Monster : GameObject

@property (nonatomic ,strong) CCSprite *imageM;
@property CGPoint target;
@property double positionx,positiony;
@property double speedx,speedy;

@end
