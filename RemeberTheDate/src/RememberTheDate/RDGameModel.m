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

-(instancetype) initWithQuestionId: (NSInteger) questionId
{
    self = [self init];
    
    NSLog(@"Init with question Id %ld", questionId);
    
    _question = @"Дата начала Великой Отечественной Войны";
    _answer = @"22.06.1941";
    _gameCells = [NSArray arrayWithObjects:
                  [[RDCell alloc] initEmptyAt:0 And:0],
                  [[RDCell alloc] initWithValue:@"2" atX:1 andY:0],
                  [[RDCell alloc] initWithValue:@"2" atX:2 andY:0],
                  [[RDCell alloc] initWithValue:@"0" atX:0 andY:1],
                  [[RDCell alloc] initWithValue:@"6" atX:1 andY:1],
                  [[RDCell alloc] initWithValue:@"1" atX:2 andY:1],
                  [[RDCell alloc] initWithValue:@"9" atX:0 andY:2],
                  [[RDCell alloc] initWithValue:@"4" atX:1 andY:2],
                  [[RDCell alloc] initWithValue:@"1" atX:2 andY:2],
                  nil];
    
    return self;
}

@end
