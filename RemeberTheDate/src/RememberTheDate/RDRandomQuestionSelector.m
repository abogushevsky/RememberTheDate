//
//  RDRandomQuestionSelector.m
//  RememberTheDate
//
//  Created by NamelessMobile on 25.07.14.
//  Copyright (c) 2014 Anton Bogushevsky. All rights reserved.
//

#import "RDRandomQuestionSelector.h"
#import "RDCommonHelpers.h"

@implementation RDRandomQuestionSelector

-(RDQuestion *) getRandomQuestion
{
    NSArray *questions = [self getAllQuestions];
    return [RDCommonHelpers getRandomArrayItem: questions];
}

-(NSArray *) getAllQuestions
{
    NSString *question = @"Дата начала Великой Отечественной Войны";
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *dateComponents = [NSDateComponents new];
    dateComponents.year = 1941;
    dateComponents.month = 6;
    dateComponents.day = 22;
    NSDate *answer = [calendar dateFromComponents:dateComponents];
    RDQuestion *question1 = [[RDQuestion alloc] initWithQuestion:question andAnswer:answer];
    
    question = @"Дата оконачания Великой Отчественной Войны";
    dateComponents.year = 1945;
    dateComponents.month = 5;
    dateComponents.day = 9;
    answer = [calendar dateFromComponents:dateComponents];
    RDQuestion *question2 = [[RDQuestion alloc] initWithQuestion:question andAnswer:answer];
    
    return [NSArray arrayWithObjects:question1, question2, nil];
}

@end
