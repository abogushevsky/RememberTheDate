//
//  RDGameModel.h
//  RememberTheDate
//
//  Created by NamelessMobile on 07.06.14.
//  Copyright (c) 2014 Anton Bogushevsky. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RDCell.h"

@interface RDGameModel : NSObject

@property (nonatomic, readonly) NSString *question;
@property (nonatomic, readonly) NSString *answer;
@property (nonatomic, readonly) NSArray *gameCells;

-(instancetype) initWithQuestionId: (NSInteger) questionId;

@end
