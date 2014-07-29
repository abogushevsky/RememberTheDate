//
//  RDCommonHelpers.h
//  RememberTheDate
//
//  Created by NamelessMobile on 25.07.14.
//  Copyright (c) 2014 Anton Bogushevsky. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RDCommonHelpers : NSObject

#ifndef IS_HIGH_CREEN
#define IS_HIGH_CREEN   (fabs((double)[[UIScreen mainScreen] bounds].size.height - (double)568) < DBL_EPSILON)
#endif

#ifndef IS_IPHONE
#define IS_IPHONE       ([[[UIDevice currentDevice] model] isEqualToString:@"iPhone"])
#endif

#ifndef IS_IPOD
#define IS_IPOD         ([[[UIDevice currentDevice] model] isEqualToString:@"iPod touch"])
#endif

#ifndef IS_IPAD
#define IS_IPAD         ([[[UIDevice currentDevice] model] isEqualToString:@"iPad"])
#endif

#ifndef IS_IPHONE_5
#define IS_IPHONE_5      (IS_HIGH_CREEN && IS_IPHONE)
#endif

#ifndef IS_IPOD_5
#define IS_IPOD_5        (IS_HIGH_CREEN && IS_IPOD)
#endif

+(NSString *) popRandomItemFromMutable: (NSMutableArray *)array;
+(id) getRandomArrayItem:(NSArray *) array;
+(NSString *) getStringFromDate:(NSDate *) date removeFormatSymbols:(BOOL) removeFormatSymbols;
+(NSDate *) createDateWithYear:(NSInteger) year month:(NSInteger) month day:(NSInteger) day;

@end
