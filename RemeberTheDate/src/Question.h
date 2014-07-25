//
//  Question.h
//  RememberTheDate
//
//  Created by NamelessMobile on 25.07.14.
//  Copyright (c) 2014 Anton Bogushevsky. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Question : NSManagedObject

@property (nonatomic, retain) NSString * question;
@property (nonatomic, retain) NSDate * answer;
@property (nonatomic, retain) NSNumber * isAnswered;

@end
