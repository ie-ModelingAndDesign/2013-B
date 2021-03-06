//
//  MainCharacter.h
//  Beta
//
//  Created by vilayouth vongsomxai on 2013/11/24.
//  Copyright (c) 2013年 vilayouth vongsomxai. All rights reserved.
//

#import "GameObject.h"
#import "Status.h"
//#import "Attack.h"
typedef enum {
    noraml,
    special,
    laser
}WeaponStatus;

@interface MainCharacter : GameObject

@property double positionx,positiony;
@property double speedx,speedy;
@property CGPoint direction;
@property BOOL islookright;
@property int movingstat;//0 move 1 attack 2 skill1 3 skill2 4skill3 5hurt 6 dying 7 die
@property float countmoveable;
@property float freezestagetime;
@property BOOL movestagechangeable;

@property WeaponStatus weapon;
@property (nonatomic,strong) Status *status;
@property (nonatomic,strong) CCSprite *image;

-(void)attack1;
@end
