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
    NSDate *answer = [RDCommonHelpers createDateWithYear:1941 month:6 day:22];
    RDQuestion *question1 = [[RDQuestion alloc] initWithQuestion:question andAnswer:answer];
    
    question = @"Дата оконачания Великой Отчественной Войны";
    answer = [RDCommonHelpers createDateWithYear:1945 month:5 day:9];
    RDQuestion *question2 = [[RDQuestion alloc] initWithQuestion:question andAnswer:answer];
    
    return [NSArray arrayWithObjects:question1, question2, nil];
}

@end
