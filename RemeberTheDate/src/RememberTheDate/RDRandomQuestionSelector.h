//
//  RDRandomQuestionSelector.h
//  RememberTheDate
//
//  Created by NamelessMobile on 25.07.14.
//  Copyright (c) 2014 Anton Bogushevsky. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RDQuestion.h"

@interface RDRandomQuestionSelector : NSObject

-(RDQuestion *) getRandomQuestion;

@end
