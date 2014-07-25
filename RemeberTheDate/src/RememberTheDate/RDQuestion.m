//
//  RDQuestion.m
//  RememberTheDate
//
//  Created by NamelessMobile on 25.07.14.
//  Copyright (c) 2014 Anton Bogushevsky. All rights reserved.
//

#import "RDQuestion.h"

@implementation RDQuestion

@synthesize question = _question;
@synthesize answer = _answer;

-(instancetype) initWithQuestion:(NSString *)question andAnswer:(NSDate *)answer
{
    self = [self init];
    
    _question = question;
    _answer = answer;
    
    return self;
}

@end
