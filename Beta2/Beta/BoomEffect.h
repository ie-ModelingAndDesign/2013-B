//
//  BoomEffect.h
//  Beta
//
//  Created by vilayouth vongsomxai on 2014/01/23.
//  Copyright (c) 2014年 vilayouth vongsomxai. All rights reserved.
//

#import "GameObject.h"

@interface BoomEffect : GameObject

@property float count,lifetime;

-(id)initWithPoistion:(CGPoint)point;
@end
