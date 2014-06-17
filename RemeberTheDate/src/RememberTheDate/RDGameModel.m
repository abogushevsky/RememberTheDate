//
//  RDGameModel.m
//  RememberTheDate
//
//  Created by NamelessMobile on 07.06.14.
//  Copyright (c) 2014 Anton Bogushevsky. All rights reserved.
//

#import "RDGameModel.h"

@implementation RDGameModel

@synthesize question = _question;
@synthesize answer = _answer;
@synthesize gameCells = _gameCells;

-(instancetype) init
{
    self = [super init];
    
    NSLog(@"Game model initialization");
    
    _question = @"What is the capital of Great Britain?";
    _answer = @"02.02.2014";
    
    return self;
}

@end
