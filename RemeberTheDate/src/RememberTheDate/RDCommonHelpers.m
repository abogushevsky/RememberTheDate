//
//  RDCommonHelpers.m
//  RememberTheDate
//
//  Created by NamelessMobile on 25.07.14.
//  Copyright (c) 2014 Anton Bogushevsky. All rights reserved.
//

#import "RDCommonHelpers.h"

@implementation RDCommonHelpers

+(NSString *) popRandomItemFromMutable:(NSMutableArray *)array
{
    int rnd = rand() % array.count;
    NSString *result = (NSString*)[array objectAtIndex:rnd];
    [array removeObjectAtIndex:rnd];
    return result;
}

+(id) getRandomArrayItem:(NSArray *)array
{
    int rnd = rand() % array.count;
    return [array objectAtIndex:rnd];
}

+(NSString *) getStringFromDate:(NSDate *)date removeFormatSymbols:(BOOL)removeFormatSymbols
{
    NSDateFormatter *formatter = [NSDateFormatter new];
    NSString *format = [NSDateFormatter dateFormatFromTemplate:@"ddMMyyyy" options:0 locale:[NSLocale currentLocale]];
    [formatter setDateFormat:format];
    NSString *dateString = [formatter stringFromDate:date];
    NSString *result = @"";
    
    NSError *error = nil;
    NSRegularExpression *regEx = [NSRegularExpression regularExpressionWithPattern:@"\\d" options:0 error:&error];
    
    for(NSTextCheckingResult* match in [regEx matchesInString:dateString options:0 range:NSMakeRange(0, [dateString length])]){
        result = [result stringByAppendingString:[dateString substringWithRange:[match range]]];
    }
    
    return result;
}

@end
