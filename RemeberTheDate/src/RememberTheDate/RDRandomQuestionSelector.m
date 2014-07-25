//
//  RDRandomQuestionSelector.m
//  RememberTheDate
//
//  Created by NamelessMobile on 25.07.14.
//  Copyright (c) 2014 Anton Bogushevsky. All rights reserved.
//

#import "RDRandomQuestionSelector.h"

@implementation RDRandomQuestionSelector

-(RDQuestion *) getRandomQuestion
{
    NSString *question = @"Дата начала Великой Отечественной Войны";
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *dateComponents = [NSDateComponents new];
    dateComponents.year = 1945;
    dateComponents.month = 6;
    dateComponents.day = 22;
    
    NSDate *answer = [calendar dateFromComponents:dateComponents];
    return [[RDQuestion alloc] initWithQuestion:question andAnswer:answer];
}

@end
