//
//  Question.h
//  RememberTheDate
//
//  Created by NamelessMobile on 26.07.14.
//  Copyright (c) 2014 Anton Bogushevsky. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Question : NSManagedObject

@property (nonatomic) NSTimeInterval answer;
@property (nonatomic) BOOL isAnswered;
@property (nonatomic, retain) NSString * question;

@end
