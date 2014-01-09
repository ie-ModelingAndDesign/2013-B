//
//  Monster.h
//  Beta
//
//  Created by Yuuto ARAKAWA on 2013/12/05.
//  Copyright (c) 2013年 vilayouth vongsomxai. All rights reserved.
//

#import "GameObject.h"
#import "Status.h"
@interface Monster : GameObject

@property (nonatomic ,strong) CCSprite *imageM;
@property CGPoint target;
@property (nonatomic,strong) Status *status;

@property (nonatomic,strong) NSString *attackname;

@property double positionx,positiony;
@property double speedx,speedy;
-(id)initWithName:(NSString *)name attackName:(NSString *)attack;
@end
