//
//  RDCell.h
//  RememberTheDate
//
//  Created by NamelessMobile on 07.06.14.
//  Copyright (c) 2014 Anton Bogushevsky. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RDCell : NSObject

@property (nonatomic) BOOL isEmpty;
@property (nonatomic) int x;
@property (nonatomic) int y;
@property (nonatomic) NSString *value;

-(void) moveTo:(int)x and:(int)y;
-(instancetype) initWithValue:(NSString*)value atX:(int)x andY:(int)y;
-(instancetype) initEmptyAt:(int)x And:(int)y;

@end
