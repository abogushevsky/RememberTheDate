//
//  RDQuestion.h
//  RememberTheDate
//
//  Created by NamelessMobile on 25.07.14.
//  Copyright (c) 2014 Anton Bogushevsky. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RDQuestion : NSObject

@property (nonatomic, readonly) NSString *question;
@property (nonatomic, readonly) NSDate *answer;
@property (nonatomic) BOOL *isAnswered;

-(instancetype) initWithQuestion:(NSString *) question andAnswer:(NSDate *) answer;

-(instancetype) initWithQuestion:(NSString *)question andAnswer:(NSDate *)answer answered:(BOOL *)isAnswered;

@end
