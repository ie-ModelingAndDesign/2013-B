//
//  Attack.h
//  Beta
//
//  Created by vilayouth vongsomxai on 2013/12/01.
//  Copyright (c) 2013年 vilayouth vongsomxai. All rights reserved.
//

#import "GameObject.h"

@interface Attack : GameObject

@property float damage;
@property float speedx,speedy;
@property float lifetime;
@property int target;
@property CGPoint startp;

@property (nonatomic,strong) CCSprite *image;

-(BOOL)isattacked:(CGPoint)p;
-(void)lifedown;
-(id)initwithAttackname:(NSString *)name;
@end
