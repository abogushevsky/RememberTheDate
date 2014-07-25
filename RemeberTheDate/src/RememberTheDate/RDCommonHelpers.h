//
//  RDCommonHelpers.h
//  RememberTheDate
//
//  Created by NamelessMobile on 25.07.14.
//  Copyright (c) 2014 Anton Bogushevsky. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RDCommonHelpers : NSObject

+(NSString *) popRandomItemFromMutable: (NSMutableArray *)array;

+(id) getRandomArrayItem:(NSArray *) array;

+(NSString *) getStringFromDate:(NSDate *) date removeFormatSymbols:(BOOL) removeFormatSymbols;

@end
