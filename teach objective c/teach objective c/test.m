//
//  test.m
//  teach objective c
//
//  Created by vilayouth vongsomxai on 2013/11/14.
//  Copyright (c) 2013年 vilayouth vongsomxai. All rights reserved.
//

#import "test.h"
#import "cocos2d.h"
@implementation test
-(id)init{
    if (self=[super init]) {
        [self makesprite:@"BOOM.jpg"];
    }
    return self;
}

-(void)makesprite:(NSString *)s{
    self.image=[CCSprite spriteWithFile:s];
}
@end
